# frozen_string_literal: true

module Types
  class MoneyType < Types::BaseObject
    field :formatted, String, null: false
    field :value, Float, null: false
  end
end
