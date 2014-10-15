module Crunch
  class Meal
    attr_reader :date, :time_since

    def initialize row
      @date = Crunch.date_fixer row[0]
      @time_since = Crunch.time_since row[0]
      @food = row[1]
  #    @offered = row[2].to_i
      @eaten = row[3].to_i
  #    @time = row[4]
    end

    def menu
      @food = @eaten > 1 ? @food.pluralize : @food

      '%d %s' % [
        @eaten,
        @food
      ]
    end
  end
end
