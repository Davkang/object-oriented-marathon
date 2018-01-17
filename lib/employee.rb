class Employee

  attr_reader :name
  attr_reader :title

  def initialize(name, title="Zoo Keeper")
    @name, @title = name, title
  end

  def full_title
    [@name, @title].join(", ")
  end

  def greet
    "#{@name} waved hello!"
  end
end
