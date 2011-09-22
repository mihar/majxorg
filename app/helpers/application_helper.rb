module ApplicationHelper
  def format_source(source)
    case source
    when 'tumblr'
      link_to "break the bit", "http://breakthebit.org", :title => "My tech blog &ldquo;break the bit&rdquo; (http://breakthebit.org)".html_safe
    when 'posterous'
      link_to "break the beat", "http://breakthebeat.org", :title => "My life blog &ldquo;break the beat&rdquo; (http://breakthebeat.org)".html_safe
    end
  end
end
