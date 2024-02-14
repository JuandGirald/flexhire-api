# frozen_string_literal: true

module Types
  class UserApplicationType < Types::BaseObject
    field :total_count, Integer, null: false
    field :data, [Types::ApplicationNodeType], null: false
  end
end
