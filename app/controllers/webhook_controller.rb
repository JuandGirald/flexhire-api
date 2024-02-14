class WebhookController < ApplicationController
    def webhook
        client_mutation_id = request.query_parameters[:channel];
        subscriber = WebhookSubscription.find_by(client_mutation_id: client_mutation_id)
        ActionCable.server.broadcast(subscriber.user_id, "1") if subscriber
        head 200
    end
end