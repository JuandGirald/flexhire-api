# frozen_string_literal: true

module Types
  class VideoType < Types::BaseObject
    field :id, String, null: false
    field :optimized_url, String, null: false
    field :poster_url, String, null: false
  end
end
