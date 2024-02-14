# frozen_string_literal: true

module Mutations
  class BaseMutation < GraphQL::Schema::RelayClassicMutation
    argument_class Types::BaseArgument
    field_class Types::BaseField
    input_object_class Types::BaseInputObject
    object_class Types::BaseObject

    def check_authentication!
      return if context[:api_key]

      raise GraphQL::ExecutionError,
        "You need to provide a valid api key to perform this action"
    end
  end
end
