# frozen_string_literal: true

module Types
  class ProfileType < Types::BaseObject
    field :id, String, null: false
    field :slug, String, null: false
    field :industry, Types::GenericObjectType, null: false
    field :job_types, [String], null: false
    field :total_experience, Integer, null: true
    field :intro, String, null: true
    field :url_blog, String, null: true
    field :url_dribbble, String, null: true
    field :url_github, String, null: true
    field :url_linkedin, String, null: true
    field :rate, Types::MoneyType, null: true
  end
end