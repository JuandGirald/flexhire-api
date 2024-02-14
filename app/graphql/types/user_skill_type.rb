# frozen_string_literal: true

module Types
  class UserSkillType < Types::BaseObject
    field :id, String, null: false
    field :experience, Integer, null: false
    field :skill, Types::GenericObjectType, null: false
  end
end
