module Services
  class BakersPercentage

    def initialize(ingredients)
      @ingredients = ingredients
    end

    private_class_method :new

    def self.call(ingredients)
      new(ingredients).calculate
    end

    def calculate

    end

    private

    attr_reader :ingredients

  end
end