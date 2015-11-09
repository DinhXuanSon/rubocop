# #Encoding

#     Use UTF-8 only

#     Basically, do not write code that need encoding script comments

# Reason

#     UTF-8 is a standard encoding globally.

#     2-bytes characters should not be in source code, they should be in locale files.

# Stand Rules
class Subject

  def method
  # Indentation is 2 white spaces
  sum = 1
    # Do not use tab
  	a, b = 1, 2
    # Do not leave trailing white spaces
    a = 2 
    # Add 1 white space before and after operators, colon (:), and after comma (,), semi-colon (;)
    # Do not add white spaces before comma (,) and semi-colon(;)
    1 > 2 ? true : false ;puts 'Hi'

    # Do not write more than 120 characters in a line
    # If the line is more than 120 characters, break to a new line following below rules
    #     If it is a string of methods, break line before dot . and let the dot . be the start of new line

    'one string'.something_long_long_method(arg1).other_cool_long_method(arg2).another_awsome_long_method(arg3).another_awsome_long_method(arg4)
  end

  def long_method_name(parameter_1, parameter_2, parameter_3, parameter_4,parameter_5, parameter_6, options)

    # Do not add white spaces before and after [] ()

    # The white space left of `[` is the white space following `=`, not the white space before `[`
    a = [ 1, 2, 3 ] 

    # Do not add white spaces before and after {} but leave white space before and after {} if using in block。
    [1, 2, 3].each{|num| puts num * 2}
    { key1: :value1, key2: :value2 }

    # Use here document for long string with line breaks. However, we can use literal string when define a short message or method chain.

    foo = "From this valley they say you are going,\nWe will miss your bright eyes and sweet smile,\nFor they say you are taking the sunshine\nThat has brightened our pathways a while."

    # Add 1 white space after arguments.

    arr.each { |elem|puts elem }

    # Write hash in 1.9 style

    h = {:key => :value}
    # Do not leave white spaces after, before {} in hash

    h = { key: :value }

    # Add 1 white space between do and argument

    arr.each do|elem|
      puts elem
    end

    # Add 1 white space after comment out character #

    #this is a bad comment

    # this is a good comment

    # Do not write anything in line comment out =begin

=begin # bad style
  do
    something
  end
=end

=begin
# good style
  do
    something
  end
=end

    # Let indentation of when and case be the same

    case
      when song.name == 'Misty'
        puts 'Not again!'
      when song.duration > 120
        puts 'Too long!'
      when Time.now.hour > 21
        puts "It's too late"
      else
        song.play
      end

    #Howerver, if left side of case has anything, indentation of when lines will be inside compare with case.

    foo = case
    when song.name == 'Misty'
      puts 'Not again!'
    when song.duration > 120
      puts 'Too long!'
    when Time.now.hour > 21
      puts "It's too late"
    else
      song.play
    end

    #Add 1 white space after def
  end

  def method1 arg1, arg2
    # some proccesses
  end

  def method2 arg1, arg2
    # some proccesses

    # Do not use () when calling method. However we can use in below cases
    #     There are operators in parameters, or operators right after method, or paremeter is hash
    #     Has 2 or more parameters
    #     There are too many parameters, the line will break to a new line so there are less than 120 characters.
    self.method1(arg1, arg2)

    #Do not use for

    arr = [1, 2, 3]

    # bad
    for elem in arr do
      puts elem
    end
    
    # Do not use then

    # incorrect
    if some_condition then
      # some proccesses
    end

    # When using ternary operator / conditional operator ( ? : ), all should be written on the same line. Do not use if then else

    # incorrect
    weather = sun.shin? ?
      'well'
      :
      'cloud'

    # incorrect
    weather = if sun.shiny? then 'well' else 'cloud' end # you must also not use 'then' keyword.

    # Do not use nested ternary operators

    some_condition ? (nested_condition ? nested_something : nested_something_else) : something_else

    # Use && and || instead of and and or if possible
    if 1 == 1 and true
      # do something
    end

    if a == b or false
      # do something
    end 

    # if ~ end or unless ~ end can be shorten by putting if or unless at the end of line
    # Use short style when it is possible to write less than 80 characters in a line

    if some_condition
      foo = 'This is a short string'
    end

    foo = "This is a very very long string that can not be broken down and may contain #{variable}" unless some_another_condition

    #Do not use unless with else

    unless success?
      puts 'failure'
    else
      puts 'success'
    end

    #Do not use ! in if conditional clause (if necessary use unless). However we can still use ! with && or ||. In these cases we can use De Morgan's rules to write simpler.

    # bad
    if !user.nil?
      user.greeting
    end

    #Do not use () in conditional clause of if/unless/while

    if (x > 10)
      # body omitted
    end

    #If there is a code block, use {} and write in 1 line. In case there are many commands, use do ~ end This rule also applies to method chain.

    names = ['Bozhidar', 'Steve', 'Sarah']
    names.each do |name|
      puts name
    end

    # Remove return if possible
  end
  # incorrect
  def some_method(some_arr)
    return some_arr.size
  end

    #If there is assignment inside conditional clause of if, use ()
  def more_method
    # incorrect
    if v = array.grep(/foo/) 
    end

  # Reason

  #     Avoid misunderstanding with ==

  #     Encourage using ||= for variable declaration However, with boolean variables, false value will be overwritten

  # incorrect - will set enabled to be true even when it is false
    enabled ||= true

    #There is no white spaces between method name and arguments

    # incorrect
    self.f (3 + 2) + 1

    # Still keep argument also it do not used in block.

    # incorrect
    result = hash.map { |_, v| v + 1 }

    # Use shorten name of argument to name temporary argument in block

    # correct
    products.each { |product| product.maintain! }

    # OK
    products.each { |prod| prod.maintain! }

  # Naming

  #     Method name or variable name use snake_case

  #     Class name or Module name use CamelCase

  #     Constant use SCREAMING_SNAKE_CASE

  #     Methods which return boolean should add ? at the end, such as Array#empty?

  #     Destroy method or dangerous method should add ! at the end, such as Array#flatten! When define destroy method, un-destroy method like Array#flatten should be defined as well.

  # Class

  #     Avoid using class variables @@ unless it is really necessary
  end
end

class Parent 
  @@class_var = 'parent'

  def self.print_class_var
    puts @@class_var
  end
end

class Child < Parent
  @@class_var = 'child'
end


    # Check if class instance variable can be accessed

class Parent 
  @class_instance_var = 'parent'

  def self.print_class_instance_var
    puts @class_instance_var
  end
end

class Child < Parent
  @class_instance_var = 'child'
end


    # When define singleton method (class method), do not use def self.method or def ClassName.method

class TestClass 
  # incorrect
  def TestClass.some_method
    # body omitted
  end

  # incorrect
  def self.some_other_method
    # body omitted
  end
end
# Do not add white spaces before comma (,) and semi-colon(;)
def method ( a ,b ,c ) 
end

class SomeClass 

  private
  def private_method
    # ...
  end

  protected
  def protected_method
    # ...
  end

  def public_method
    # ...
  end

end

class SomeClass2 
  attr_accessor :message

  def set_name name
    self.message = "Hi #{name}"
  end

  def greeting
    puts self.message
  end

  # Exception

  #     Do not use exception to control the flow. Exceptions which can be avoided should be avoided.

  # Reason

  # In normal process, avoid generating StackTrace of exceptions as much as possible.
  def some_method
  # incorrect
    begin
      n / d
    rescue ZeroDivisionError
      puts 'Cannot divide by 0!'
    end

    # Do not rescue class Exception. Must rescue a specific class

    # incorrect
    begin
      # Exception caught
    rescue
      # Process exception
    end

    # incorrect
    begin
      # Exception caught
    rescue Exception
      # Process exception
    end

    # Use %w( ) to create array of strings

    # incorrect
    # STATES = ['draft', 'open', 'closed']

    # When write key of hash, use symbol instead of characters if possible

    # incorrect
    hash = {'one' => 1, 'two' => 2, 'three' => 3}

  # Strings

  #     When combine variables into a string, follow below rules

  # incorrect
    email_with_name = user.name + ' <' + user.email + '>'

    # * When need to add more into string, do not use ``` String#+ ``` method, use ``` String#<< ``` method

  # correct
    html = ''
    html + '<h1>Page title</h1>'

    paragraphs.each do |paragraph|
      html + "<p>#{paragraph}</p>"
    end

    /(regexp)/ =~ string
    process $1

    string = "some injection\nusername"
    string[/^username$/]   # matches
    string[/\Ausername\Z/] # don't match

    #Use x when writing a complex regular expression. However, all empty characters will be ignored.

    regexp = %r{
      start         # some text
      \s            # white space char
      (group)       # first group
      (?:alt1|alt2) # some alternation
      end
    }

    # % syntax

    # Use %() when need to display 

    message = %(please differenate between ' and " )

    # Use %r() when need to write / in regular expression

    %r(\s+)

    %r(^/(.*)$)

  # Comparison

  #     When need to compare between a variable and a value like a number or a constant, write variable on the right side

    greeting = 'Hello!'

  # bad
    if greeting == 'Hola!'
    end
  end
end

module AttrComparable
  module ClassMethods
    def attr_comparable *attrs
      class_eval <<-DELIM
        attrs.each do |attr|
          define_method(attr.to_s<<'?'){|param| self.send(attr) == param }
        end
      DELIM
    end
  end
#...omitted
end
