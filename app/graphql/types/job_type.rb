# frozen_string_literal: true

module Types
  class JobType < Types::BaseObject
    field :id, String, null: false
    field :title, String, null: false
    field :hiring_manager, Types::GenericObjectType, null: true
  end
end
