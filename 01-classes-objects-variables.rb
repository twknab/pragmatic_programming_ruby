=begin
Note: The code in this file is roughly following along with the following sections in the "Programming Ruby: Pragmatic Programmer's Guide" (http://ruby-doc.com/docs/ProgrammingRuby/)

- Roadmap
- Ruby.new
- Classes, objects and variables

Some background: 
Ruby is a full feature programming language, it may not meet every need every time, but its designed to be a general use language and is a full OOP language. Everything in Ruby is an object. The syntax is designed to surprise you less, code is designed to be more elegant, and in theory, one will write less code and achieve more. This is good because the less code the easier it is to read, the less you can screw yourself up :)

One good thing about Ruby is it gives us quick and direct solutions. The only thing to be aware of, is that one ought to still maintain an understanding as to what Ruby is doing "behind the scenes", as in other languages or frameworks (not Rails), less "magic" is done for you, so while embracing Ruby magic is important and great for us as developers, it's important to understand WHAT is still happening, else we risk being naive in our programming knoweldge.

=end



# define a basic function
def sayGoodnight(name)
  result = "Goodnight " + name
end

# best convention is to use parentheses to keep things clean
def sayGoodmorning name
  "Goodmorning #{name}"
end

puts sayGoodnight("tim")
puts sayGoodnight("buddy boy")
puts sayGoodnight "billy"

puts sayGoodmorning "Tim"

# define an array this way
a = [1, "cat", 3.14]

puts a[0]

# or this way
b = Array.new
b[0] = 10
b[1] = 11
puts b.class  # .class gives us Type
puts b.length # .length similar to JS, etc gives arr len
# loop using .each and do
b.each do |thing|
  puts "number from array #{thing}" # inline var using #{myVar}
end
 
# Another way to create an array
c = %w{ one two three four five six  }

puts c[5]

# similar to python dictionary or javascript object
myHash = {
  "something" => "else",
  "and" => "another thing",
  "and" => "this too",
  "and" => "i think i forgot the last thing"
}

puts myHash['something']

radiation = 500

puts "Danger, Will Robinson" if radiation > 10

square = 500
while square < 600
  square = square*square 
  # remember, ruby always returns last line, so don't have to always worry about `return` statement
end

# can inline this expression
square = square*square while square < 250001

puts square


# create a method to say the time based on day
def sayTime
  time = Time.new.strftime("%H:%M")
  date = Time.new.strftime("%m/%d/%Y")
  hour = Time.new.strftime("%H").to_i
  puts time, hour

  if hour < 12 and hour > 16
    puts "Good evening, the time is #{time} on #{date}."
  elsif hour <= 16 and hour > 11
    puts "Good afternoon, the time is #{time} on #{date}."
  elsif hour <= 11 and hour >= 0 or hour === 0
    puts "Good morning, the time is #{time} on #{date}."
  end
end

sayTime

# This is how we create classes
class Song
  attr_reader :name, :artist, :duration

  def initialize(name, artist, duration)
    # duration variable is in seconds
    @name = name
    @artist = artist
    @duration = duration
  end

  def to_s
    "Song: #{@name} -- #{@artist} (#{@duration})"
  end
end

rockSong = Song.new('Free Flying', 'Tom Petty', 420)

puts (rockSong.inspect)

rockSong.to_s

puts rockSong


# Let's create a child class of `Song` class:
class KaraokeSong < Song
  attr_reader :lyrics
  # Ruby has getter and setter methods, and to save ourselves time from writing them, we can use `attr_reader` and other `attr_` uses to do this for us.

  def initialize(name, artist, duration, lyrics)
    super(name, artist, duration) # this line gets parent prop
    @lyrics = lyrics
  end

  def to_s
    super + " [#{@lyrics}]"
  end

  # this is a class method!!!
  def KaraokeSong.sayHi
    puts "Hi there!!"
  end
end

rAndBSong = KaraokeSong.new("Sittin on the Dock of the Bay", "Otis Redding", 530, "Sitting in the morning sun...")

puts rAndBSong.to_s

puts rAndBSong.name
puts rAndBSong.lyrics

KaraokeSong.sayHi


# Understand Yield statement:

def callBlock
  yield
  yield
end

callBlock { puts "In the block" }

# The parameters passed into `callback()` will run for each yield statement. Lookup mor examples or see documentation on better use cases and more complicated use cases of yield blocks.