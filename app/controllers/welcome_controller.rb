class WelcomeController < ApplicationController
  before_action :authenticate_user!

  def notify
    ActionCable.server.broadcast "web_notifications_#{current_user.id}", { mode: "notice", body: "Hello #{params[:id]}" }
  end
end
