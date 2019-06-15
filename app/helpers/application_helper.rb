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

  def remove_t_co(text)
    text.gsub(/https:\/\/t\.co\/[0-9a-zA-Z]+/, '')
  end

  # TODO: データベース設計が破滅しているのでここで吸収している
  def media_uris(target_tweet_object)
    media_uris = []

    unless target_tweet_object.media_url_https_01.nil?
      media_uris << target_tweet_object.media_url_https_01
    end

    unless target_tweet_object.media_url_https_01.nil?
      media_uris << target_tweet_object.media_url_https_02
    end

    unless target_tweet_object.media_url_https_01.nil?
      media_uris << target_tweet_object.media_url_https_03
    end

    unless target_tweet_object.media_url_https_01.nil?
      media_uris << target_tweet_object.media_url_https_04
    end

    media_uris
  end
end
