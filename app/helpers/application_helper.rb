module ApplicationHelper
  def full_title(page_title)
    base_title = "AskIt"
    if page_title.present?
      "#{page_title} | #{base_title}"
    else
      base_title
    end
  end

  # def full_title(page_title = '')
  #   base_title = "Ask It"
  #   if page_title.empty?
  #     base_title
  #   else
  #     page_title + " | " + base_title
  #   end
  # end


end
