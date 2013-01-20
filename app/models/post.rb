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
        new_post.source = 'breakthebit'
        
        new_post.save        
      end
    end
    
    Tumblr.blog = 'breakthebeat.org'
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
        
        if new_post.body
          new_post.body_html = new_post.body
          new_post.body = new_post.body.strip_html
        end
        
        new_post.permalink = post["slug"]
        new_post.url = post["url_with_slug"]
        new_post.posted_at = post["date"]
        new_post.remote_id = post["id"]
        new_post.source = 'breakthebeat'
        
        new_post.save        
      end
    end
  end
end
