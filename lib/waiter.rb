class Waiter
    attr_accessor :name, :yrs_experience
    @@all = []

    def initialize(name, yrs_experience)
        @name = name
        @yrs_experience = yrs_experience
        @@all << self 
    end 

    def new_meal(customer, total, tip=0)
        Meal.new(self, customer, total, tip)
    end 

    def meals
        Meal.all.select {|meals| meals.waiter == self }
    end 

    def best_tipper
        best_tipped_meal = meals.max {|a, b| a.tip <=> b.tip }
        best_tipped_meal.customer 
    end 


    def self.all
        @@all 
    end 

end