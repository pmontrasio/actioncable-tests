class WebNotificationsChannel < ApplicationCable::Channel
  def subscribed
    Rails.logger.debug "WebNotificationsChannel subscribed"
    stream_from "web_notifications_#{current_user.id}" # TODO use a slug
  end
end
