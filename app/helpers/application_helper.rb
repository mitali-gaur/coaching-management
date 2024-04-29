module ApplicationHelper
  def page_title
    if content_for?(:title)
      title_text = content_for :title
      title_text ? "#{title_text} | Coaching Management" : 'Coaching Management'
    else
      'Coaching Management'
    end
  end
end
