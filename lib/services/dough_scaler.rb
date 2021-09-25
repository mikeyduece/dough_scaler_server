require_relative 'bakers_percentage'

module Services
  class DoughScaler

    def initialize(params)
      @params = params
    end

    private_class_method :new

    def self.call(params)
      require 'pry'; binding.pry
      new(params)
    end

    private

    attr_reader :params

    def percentage
      require 'pry'; binding.pry
      Services::BakersPercentage.calculate(params)
    end

  end
end