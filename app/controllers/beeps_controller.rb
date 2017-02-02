require 'securerandom'

class BeepsController < ApplicationController
  def index
  end
  def beep
    @message = { time: Time.now, uuid: SecureRandom.uuid }
    ActionCable.server.broadcast 'beep_channel', @message
    respond_to do |format|
      format.json { render json: @message }
      format.html { render :index }
    end
  end
end
