module FlexhireManager
    class WebhookRegister < ApplicationService
  
      attr_reader :api_key
      attr_reader :user_id
  
      def initialize(api_key, user_id)
        @user_id = user_id
        @client = client = Graphlient::Client.new(ENV["FLEXHIRE_API_URL"],
          headers: {
            'FLEXHIRE-API-KEY' => api_key
          },
          http_options: {
            read_timeout: 20,
            write_timeout: 30
          }
        )
      end
  
      def call
        client_mutation_id = SecureRandom.hex
        response = @client.execute create_webhook_mutation, client_mutation_id: client_mutation_id , url: "#{ENV["WEBHOOK_HOST"]}/webhook?channel=#{client_mutation_id}"
        return nil unless response.data.create_webhook.errors.empty?
        webhook = WebhookSubscription.new(
          user_id: @user_id,
          client_mutation_id: client_mutation_id,
          webhook_id: response.data.create_webhook.webhook.id
        )
        webhook.save!
        return webhook
      end

      def create_webhook_mutation
        @client.parse <<~GRAPHQL
        mutation ($client_mutation_id: String!, $url: String!){
            create_webhook: createWebhook(
              input: {clientMutationId: $client_mutation_id, url: $url, enabled: true}
            ) {
            errors {
              message
            }
            clientMutationId
            webhook {
              authenticationHeaderName
              authenticationHeaderValue
              enabled
              id
              url
            }
          }
        }
        GRAPHQL
      end
    end
end
  
  