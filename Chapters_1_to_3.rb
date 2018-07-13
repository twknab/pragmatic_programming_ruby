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
puts b.class
puts b.length
b.each do |thing|
  puts "number from array #{thing}"
end
 
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
end

square = square*square while square < 250001

puts square


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