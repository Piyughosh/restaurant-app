# frozen_string_literal: true

class RestaurantStatusJob < ApplicationJob
  queue_as :default

  def perform(restaurant)
    value = restaurant.status ? false : true
    restaurant.update_columns(status: value)
  end
end
