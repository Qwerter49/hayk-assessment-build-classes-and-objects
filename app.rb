require 'pry'

class Building
    attr_accessor :name, :number_of_tenants
    attr_reader :address

    #array of any Building objects created
    @@all = []

    #initializes any Building objects created
    def initialize name, address, number_of_floors, number_of_tenants
        @name = name
        @address = address
        @number_of_floors = number_of_floors
        @number_of_tenants = number_of_tenants
        @@all << self
    end

    #keeps track of all new buildings made
    def self.all
        @@all
    end

    #adds all tenants for all building objects created
    def self.total_tenants
        all.map {|building| building.number_of_tenants}.reduce(0) {|sum, n| sum + n}
    end

    #averages amount of tenants per building
    def self.average_tenants_per_building 
        (total_tenants.to_f / all.length).round
    end

    #displays the name and address of a building if called
    def placard
        "#{@name}, #{@address}"
    end
    
    #averages the tenants in a building per floor
    def average_tenant_per_floor
        @number_of_tenants.to_f / @number_of_floors.to_f
    end

end

#creates the building objects
building_1 = Building.new "small house", "555 Blake St", 4, 8
building_2 = Building.new "medium house", "762 Market St", 12, 62
building_3 = Building.new "large house", "4502 Ashmore Circle", 18, 252
