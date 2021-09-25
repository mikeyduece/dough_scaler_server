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
      ingredients.each_with_object([]) do |ingredient, acc|
        amount = ingredient.amount
        acc << Scaler::Ingredient.new({
                                        name: ingredient.name,
                                        amount: amount,
                                        bakersPercentage: percentage(amount)
                                      })
      end
    end

    private

    attr_reader :ingredients

    def percentage(amount)
      ((amount / total_flour_weight) * 100).round(2)
    end

    def flour
      @_flour ||= ingredients.select { |ingredient| ingredient.name.match?(/flour/) }
    end

    def total_flour_weight
      @_total_flour_weight ||= flour.sum(&:amount)
    end

  end
end