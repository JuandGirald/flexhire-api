# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    
    field :current_user, Types::UserType, null: false
    
    def current_user
      check_authentication!
      user = FlexhireManager::CurrentUserFetcher.call(context[:api_key])
      return nil unless user

      webhook = WebhookSubscription.find_by(user_id: user.id)
      FlexhireManager::WebhookRegister.call(context[:api_key], user.id) unless webhook

      return user
    end

  end
end
