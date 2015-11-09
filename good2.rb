# A line can be more than 120 characters in case it is a long leteral string
foo = "This is a very very long string that can't be broken down and may contain #{variable}"
# Do not add white spaces before and after {} but leave white space before and after {} if using in block
[1, 2, 3].each { |num| puts num * 2 }
{key1: :value1, key2: :value2}

# Use here document for long string with line breaks.
# However, we can use literal string when define a short message or method chain.
foo = <<-EOS
From this valley they say you are going,
We will miss your bright eyes and sweet smile,
For they say you are taking the sunshine
That has brightened our pathways a while.
      EOS
# Add 1 white space after arguments
arr.each { |elem| puts elem }

# Write hash in 1.9 style
h = {key: :value}

# Do not leave white spaces after, before {} in hash
h = {key: :value}

# Add 1 white space between do and argument
arr.each do |elem|
  puts elem
end

# Add 1 white space after comment out character #
# this is a good comment

# Do not write anything in line comment out =begin
=begin
# good style
  do
    something
  end
=end

# Indent when as deep as case
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

# Add 1 white space after def
def method1
  # some proccesses
end

def some_method2
  # some proccesses
end

# Use () in method definition
def method1
  # some proccesses
end

# Do not use for
arr.each { |elem| puts elem }

# Do not use then
if some_condition
  # some proccesses
end

# When using ternary operator / conditional operator ( ? : ), all should be written on the same line.
# Do not use if then else
weather = sun.shiny? ? 'well' : 'cloud'

# Do not use nested ternary operators
if some_condition
  nested_condition ? nested_something : nested_something_else
else
  something_else
end

# Use && and || instead of and and or if possible

# if ~ end or unless ~ end can be shorten by putting if or unless at the end of line
foo = 'This is a short string' if some_condition
unless some_condition
  foo = "This is a very very long string that can not be broken down and may contain #{variable}"
end

# Use short style when it is possible to write less than 80 characters in a line
# Do not use unless with else
if success?
  puts 'success'
else
  puts 'failure'
end

# Do not use ! in if conditional clause (if necessary use unless).
# However we can still use ! with && or ||. In these cases we can use De Morgan's rules to write simpler.
user.greeting unless user.nil?
user.greeting if user
user.greeting if !user.nil? && !user.suspended?
user.greeting unless user.nil? || user.suspended?
user.greeting if user && user.active?

# Do not use () in conditional clause of if/unless/while
if x > 10
  # body omitted
end

# If there is a code block, use {} and write in 1 line.
# In case there are many commands, use do ~ end This rule also applies to method chain.
names = ["Bozhidar", "Steve", "Sarah"]
names.each { |name| puts name }
[1, 2, 3].map { |num| num * 2 }.reduce { |double, sum| sum += double }
[1, 2, 3].map do |num|
  num * 2
end.reduce do |double, sum|
  sum += double
end

# Remove return if possible
def some_method(some_arr)
  some_arr.size
end

# If there is assignment inside conditional clause of if, use ()
if (v = array.grep(/foo/))
end
if (v = next_value) == 'hello'
end

# Avoid misunderstanding with ==
# Encourage using ||= for variable declaration However, with boolean variables, false value will be overwritten
name ||= 'Bozhidar'
enabled = true if enabled.nil?

# There is no white spaces between method name and arguments
f(3 + 2) + 1

# Still keep argument also it do not used in block
result = hash.map { |k, v| v + 1 }

# Use shorten name of argument to name temporary argument in block
products.each { |product| product.maintain! }
products.each { |prod| prod.maintain! }

# Naming
# Method name or variable name use snake_case
# Class name or Module name use CamelCase
# Constant use SCREAMING_SNAKE_CASE

# Methods which return boolean should add ? at the end, such as Array#empty?

# Destroy method or dangerous method should add ! at the end, such as
# Array#flatten! When define destroy method, un-destroy method like
# Array#flatten should be defined as well.

# Class
# Avoid using class variables @@ unless it is really necessary
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

Parent.print_class_var # => output "parent"

# When define singleton method (class method), do not use def self.method or def ClassName.method
# When define a method or a class macro, use class << self
class TestClass
  class << self
    attr_accessor :per_page
    alias_method :nwo, :find_by_name_with_owner

    def find_by_name_with_owner
      # body omitted
    end

    def first_method
      # body omitted
    end

    def second_method_etc
      # body omitted
    end
  end
end

# With a block of public methods, no need to declare public before like private/protected block below
# Write protected methods before private methods. When define protected methods, private methods,
# indent the methods to be the same as public methods and add an empty line above these protected methods,
# private methods, do not add an empty line below
class SomeClass
  def public_method
    # ...
  end

  protected
  def protected_method
    # ...
  end

  private
  def private_method
    # ...
  end
end

# Use self to call these methods
class SomeClass
  attr_accessor :message

  def set_name name
    self.message = "Hi #{name}"
  end

  def greeting
    puts self.message
  end
end

# Do not use exception to control the flow. Exceptions which can be avoided should be avoided
# In normal process, avoid generating StackTrace of exceptions as much as possible
if d.zero?
  puts "Cannot divide by 0!"
else
  n / d
end

# Do not rescue class Exception. Must rescue a specific class
begin
  # Exception caught
rescue XxxException # Specify type of exceptions
  # Process exception
end

# Use %w( ) to create array of strings
STATES = %w(draft open closed)

# When write key of hash, use symbol instead of characters if possible
hash = {one: 1, two: 2, three: 3}

# When combine variables into a string, follow below rules
email_with_name = "#{user.name} <#{user.email}>"
html = ''
html << '<h1>Page title</h1>'

paragraphs.each do |paragraph|
  html << "<p>#{paragraph}</p>"
end

# When use here document, delimiter is indented the same as assign command
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
end

# Do not use $1 〜 9 to name string
/(?<meaningful_var>regexp)/ =~ string
process meaningful_var

# To define start and end of a string, including new lines, use \A and \Z
string = "some injection\nusername"
string[/^username$/]   # matches
string[/\Ausername\Z/] # don't match

# Use x when writing a complex regular expression. However, all empty characters will be ignored
regexp = %r{
  start         # some text
  \s            # white space char
  (group)       # first group
  (?:alt1|alt2) # some alternation
  end
}x

# Use %() when need to display "
# Use %r() when need to write / in regular expression
%r(^/blog/2011/(.*)$)

# When need to compare between a variable and a value like a number or a constant, write variable on the right side
greeting = 'Hello!'

# bad
if greeting == 'Hola!'
end

# good
if 'Hola!' == greeting
end
