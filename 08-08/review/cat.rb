class Cat
  # initialize is a method on the Cat class (a special one)
  # when I call Cat.new("whatever"), "whatever" is used as `name`
  # inside this function.
  def initialize(name)
    # Here `name` is a local variable, set to whatever is passed in when
    # I call Cat.new(...)
    #
    # We store name as @name, an instance, so that we can refer back to it
    #   even outside of this scope.
    @name = name
  end

  def this_method_fails
    # This doesn't work, because `name` would refer to a local variable that
    # isn't present (isn't in scope)
    puts name
  end

  def this_works
    # This refers to the instance variable, which is set up when we create a
    #   new cat. So this will print out the cat's name.
    puts @name
  end

  def this_is_a_method
    puts "Calling the method `this_is_a_method`"
  end

  def variables_versus_method_names(passed_in)
    name # Ruby will error in trying to look this up, because it isn't in scope

    # There are essentially 3 ways to get things in scope
    # - Passed in arguments
    puts passed_in # Works, prints whatever we called this method with

    # - Variables that I've assigned inside this function
    new_variable = "some stuff"
    puts new_variable # This works for the rest of this function body (until `end`)

    # - Methods on the current object
    this_is_a_method # Ruby knows that I mean `self.this_is_a_method` and calls that
  end
end

# Instance variables are internal
#> tom = Cat.new("tom")
#> tom.name # Does not work, because this would be calling a method

# I can fix that by defining a method
class Cat
  # This function lets me read the "name" attribute
  def name
    @name
  end

  # This function lets me write the "name" attribute
  def name= new_name
    @name = new_name
  end

  # Or just
  # attr_reader :name
  # attr_writer :name
  # or
  # attr_accessor :name to get both
end
