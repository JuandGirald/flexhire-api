# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, String, null: false
    field :name, String, null: false
    field :avatar_url, String, null: false
    field :verified, Boolean, null: false
    field :profile, Types::ProfileType, null: false
    field :video, Types::VideoType, null: true
    field :skills, [Types::UserSkillType], null: false
    field :applications, Types::UserApplicationType, null: false
    field :timeline, [Types::MomentType], null: false
  end
end
