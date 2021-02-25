class Car
  attr_reader :make,
              :model,
              :color,
              :year,
              :age

  def initialize(info)
    @make = info[:description].split(" ")[1]
    @model = info[:description].split(" ")[2]
    @color = info[:description].split(" ")[0]
    @year = info[:year]
    @age = Time.now.year - info[:year].to_i
  end
end
