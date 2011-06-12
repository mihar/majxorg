class Post < ActiveRecord::Base  
  validates :title, :presence => true
  validates :remote_id, :presence => true, :uniqueness => true
  
  scope :recent, order("posted_at DESC").limit(3)
  
  def self.fetch
    # Fetch Tumblr
    Tumblr.blog = 'breakthebit.org'
    if tumblr_posts = Tumblr::Post.all
      tumblr_posts.each do |post|
        new_post = self.new
        
        new_post.title = if post["regular_title"]
          post["regular_title"]
        elsif post["link_text"]
          post["link_text"]
        end
        
        new_post.body = if post["regular_body"]
          post["regular_body"]
        elsif post["link_description"]
          post["link_description"]
        end
        
        new_post.body_html = new_post.body
        new_post.body = new_post.body.strip_html
        
        new_post.permalink = post["slug"]
        new_post.url = post["url_with_slug"]
        new_post.posted_at = post["date"]
        new_post.remote_id = post["id"]
        new_post.source = 'tumblr'
        
        new_post.save        
      end
    end
    
    # Fetch posterous
    request = HTTParty.get("http://posterous.com/api/readposts?hostname=breakbeat")
    return unless request["rsp"] and request["rsp"]["post"]
    posterous_posts = request["rsp"]["post"]

    posterous_posts.each do |post|
      new_post = self.new
      new_post.title = post["title"]
      new_post.body = post["body"].strip_html
      new_post.body_html = post["body"]
      new_post.url = post["url"]
      new_post.remote_id = post["id"]
      new_post.permalink = new_post.title.to_permalink
      new_post.posted_at = post["date"]
      new_post.source = 'posterous'
      
      new_post.save
    end
  end
end
