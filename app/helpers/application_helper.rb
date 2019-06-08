module ApplicationHelper
  # @page_name は各ビューの中で定義する
  def page_title
    if @page_name.nil?
      "#{Constants::SITE_NAME}"
    else
      "#{Constants::SITE_NAME} - #{@page_name}"
    end
  end

  def formatted_time_description(time_class)
    time_class.strftime('%Y/%m/%d %H:%M:%S')
  end
end
