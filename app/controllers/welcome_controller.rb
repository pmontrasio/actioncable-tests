class WelcomeController < ApplicationController
  before_action :authenticate_user!

  def notify
    # TODO use a slug for the user
    # Nella gemma: nome canale = cable_flash_#{user.cable_flash_slug} che fa default in user_id
    # class User < ActiveRecord::Base
    #   cable_flash channel: -> (user) { "cable_flash_#{user.id}" }
    # end
    ActionCable.server.broadcast "web_notifications_#{current_user.id}", { mode: "notice", body: "Hello #{params[:id]}" }
  end
end
