require_relative "zoo_at_capacity"
require_relative "cage"



class Zoo

  attr_reader :name, :employees, :cages
  attr_reader :season_opening_date
  attr_reader :season_closing_date

  def initialize(name, season_starts, season_ends)
    @name = name
    @season_opening_date = season_starts
    @season_closing_date = season_ends
    @employees = []
    @cages = [].tap do |cages|
      10.times do
        cages << Cage.new
      end
    end
  end


  # def cages
  #   cages = []
  #   10.times do
  #     cages << nil
  #   end
  #   cages
  # end


  def add_employee(employee)
    @employees << employee
  end

  def open?(date_to_check)
    @season_opening_date <= date_to_check &&
     @season_closing_date >= date_to_check
  end

  def add_animal(animal)
    empty_cage = @cages.find{|cage| cage.empty?}
    # require 'pry'
    # binding.pry if empty_cage.nil?
    if !empty_cage.nil?
      empty_cage.animal = animal
    else
      raise ZooAtCapacity
    end
  end

  def visit
    results = ""
    @employees.each do |employee|
      results << employee.greet + "\n"
    end

    @cages.each do |cage|
      results << cage.animal.speak + "\n" if !cage.empty?
    end
    results
  end

end
