# frozen_string_literal: true

module Types
  class MomentType < Types::BaseObject
    field :id, String, null: false
    field :title, String, null: false
    field :place, String, null: false
    field :date_start, String, null: false
    field :date_end, String, null: false
    field :entry_type, String, null: false
    field :description, String, null: true
  end
end
