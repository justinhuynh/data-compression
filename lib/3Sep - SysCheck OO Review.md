class Table
  attr_reader :legs
  attr_writer :color
  attr_accessor :color

  def initialize(legs, material)
    @legs = legs
    @material = material
  end

  def color=(new_color)
    @color = new_color
  end

  def likes_table?(person)
    @color == person.favorite_color
  end
end

class Person
  attr_reader :favorite_colors

  def initialize(favorite_colors)
    @favorite_colors = favorite_colors
  end
end

round_table = Table.new(12, "Wood")
pool_table = Table.new(4, "Felt")

king_arthur = Person.new("blue")

You need an interface to check what something is.
A way to take internal state and make it accessible to the world
That's called a getter


A method that takes contextual information
a contextual getter
composing functionality

Two completely different objects operating independently can create function.

Don't interact with instance variables inside of your class.
Don't call the instance variable. Just give yourself a getter

Reset and check your assumptions
Write out the full text - not shorthand

metaprogramming: code that writes code
