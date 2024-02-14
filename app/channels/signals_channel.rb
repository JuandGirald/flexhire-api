class SignalsChannel < ApplicationCable::Channel
  def subscribed
    stream_from (params[:user_id])
    ActionCable.server.broadcast(params[:user_id], "0")
  end
end
