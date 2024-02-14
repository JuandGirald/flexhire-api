# frozen_string_literal: true

module Types
  class BaseObject < GraphQL::Schema::Object

    def check_authentication!
      return if context[:api_key]

      raise GraphQL::ExecutionError,
        "You need to provide a valid api key to perform this action"
    end

    edge_type_class(Types::BaseEdge)
    connection_type_class(Types::BaseConnection)
    field_class Types::BaseField
  end
end
