module ApplicationHelper
  # @page_name は各ビューの中で定義する
  def page_title
    if @page_name.nil?
      "#{Constants::SITE_NAME}"
    else
      "#{Constants::SITE_NAME} - #{@page_name}"
    end
  end
end
