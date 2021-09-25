require_relative 'bakers_percentage'

module Services
  class DoughScaler

    def initialize(scaler)
      @name = scaler.name
      @ingredients = scaler.ingredients
    end

    private_class_method :new

    def self.call(params)
      new(params).calculate
    end

    def calculate
      Scaler::Recipe.new(name: name, ingredients: percentages)
    end

    private

    attr_reader :name, :ingredients

    def percentages
      Services::BakersPercentage.call(ingredients)
    end

  end
end