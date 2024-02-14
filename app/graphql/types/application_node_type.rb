# frozen_string_literal: true

module Types
  class ApplicationNodeType < Types::BaseObject
    field :node, Types::ApplicationType, null: false
  end
end
