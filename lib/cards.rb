# frozen_string_literal: true

require_relative "cards/version"
require "net/http"
require "json"

module Cards
  class Error < StandardError; end
  URI = URI("https://api.magicthegathering.io/v1/cards")
  # class Cards::Magic
  module Magic
    # get cards data from API
    def self.cli_run(options)
      data = get
      case options
      when "s"
        group_by_set(data)

      when "r"
        group_set_by_rarity(data)

      when "k"
        group_by_set_colors(data)

      end
    end

    def self.get
      url = Net::HTTP.get(URI)

      # return result["cards"]
      res = JSON.parse(url, { symbolize_names: true })
      res[:cards]
    end

    def self.group_by_set(data)
      data.group_by { |card| card[:set] }
    end
    # return array of hash of each set with their respective cards

    def self.group_set_by_rarity(cards_arr)
      data = group_by_set(cards_arr)
      cards = {}
      data.each { |key, value| cards[key] = value.group_by { |card| card[:rarity] } }
      cards
    end

    def self.group_by_set_colors(data)
      data.select do |card|
        card[:set] == "KTK" && card[:colors].any? { |x| x == "red" } && card[:colors].any? do |x|
          x == "blue"
        end
      end
    end
  end
end
