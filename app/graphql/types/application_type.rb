# frozen_string_literal: true

module Types
  class ApplicationType < Types::BaseObject
    field :status, String, null: false
    field :client, Types::GenericObjectType, null: false
    field :firm, Types::GenericObjectType, null: false
    field :job, Types::JobType, null: false
  end
end
