=begin
http://ruby-doc.com/docs/ProgrammingRuby/html/tut_containers.html

If we want to store data we'll need some sort of container. We've learned about hashes and arrays, and there are some custom solutions as well that we could draw from. But for now, let's go ahead and look at containers, blocks and iterators in a little more detail.
=end 

puts "----------------------"
puts "------- ARRAYS -------"
puts "----------------------"

# We can create an array similar to how we might in other languages
a = [3.14, "pie", 99]
puts a.class
# => Array
a.length
# => 3
a[0]
# => 3.14

# We can also use the .new method which is similar to in PHP (`Array()`):

b = Array.new
b.class 
# => Array
b.length
# => 0
b[0] = "second"
b[1] = "array"

puts b
# => ["second", "array"]

# If you index a value that's not there `nil` is returned
puts b[100]
if b[100] === nil
  puts "its nil"
end
# => nil

c = [1,2,3,4,5,6,7,8,9,10,11,12]

puts "--- begin negative index format ---"
# You can also use negative numbers to get the indice from the end of the array moving forwards:
# example:
puts c[-1]
# => 12
puts c[-5]
# => 8

puts "--- begin paired number format ---"
# You can also privde 2 values in a [start, count] format:
puts c[0,5]
# This will return a new array containg those values
# => c[1,2,3,4,5]

d = c[2,2]
puts d
# => [3,4]

puts "--- begin double dot range formation ---"
# Finally we can use range format as well formatted as [start..end]:
# Note that using 2 dots `..` INCLUDES the ending number
e = c[1..3]
puts e
# => [2,3,4]

puts "--- begin triple dot range formation ---"
# The triple dot formation `...` EXCLUDES the final value:
puts c[1...3]
# => [2,3]

puts "--- begin range formation with negative values ---"
puts c[-5..-1]
# => [8, 9, 10, 11, 12]

puts "--- []= operator as well to set values and replace them ---"
c[5] = "bat"
puts c
# => [1,2,3,4,5,"bat",7,8,9,10,11,12]
# if we reference a value not there, nil is placed in between similar to JS:
c[100] = "hello"
p c
# => [1, 2, 3, 4, 5, "bat", 7, 8, 9, 10, 11, 12, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, "hello"]

puts "--- []= operator with range or start, end ---"
c[0, 5] = ["one", "two", "three", "four", "five"]
p c
# => ["one", "two", "three", "four", "five", "bat", 7, 8, 9, 10, 11, 12, nil, ...  nil, "hello"]

puts c.length
puts c.last

puts "--- if you use `.compact` you can remove nil values ---"
c.compact!
# remember we have to use `!` if we want the object itself to take on changes, otherwise merely a new instance is created:
# e.g, `d = c.compact` vs simply, `c.compact!`. In the first example c would remain unchanged with the compacted array now saved as `d`. In the second example `c` is directly modified to become the compacted array
puts c.length
puts c.last
p c


puts "----------------------"
puts "------- HASHES -------"
puts "----------------------"

foodMenu = { 
  'monday' => 'stir fry', 
  "tuesday" => "pizza", 
  "wednesday" => "pasta", 
  "thursday" => "casserole", 
  "friday" => "sandwiches"
}
# In this example, h is a hash, and essentially the same as you'd use associative arrays in PHP or objects in JS.

# now we can reference a value based upon its key:
puts foodMenu["monday"]

# Hashes hvae many uses but their disadvantage is that they are not ordered, thus they are not great for Stacks and Queues. 

# This being said, Hashes are the most COMMONLY USED data structures in Ruby.

puts "----------------------"
puts "------ SONG LIST------"
puts "----------------------"

# We're going to re-use the classes we made in our last section, and we're going to create a new class called "Song List" to keep track of songs or karoke songs
class Song
  attr_reader :name, :artist, :duration

  def initialize(name, artist, duration)
    @name = name
    @artist = artist
    @duration = duration # in seconds
  end

  def to_s
    "Song: #{@name} -- #{@artist} (#{@duration})"
  end
end

class KaraokeSong < Song
  attr_reader :lyrics

  def initialize(name, artist, duration, lyrics)
    super(name, artist, duration) # this line gets parent prop
    @lyrics = lyrics
  end

  def to_s
    super + " [#{@lyrics}]"
  end
end


# We'll start by creating a new class:
# When a new song list is created, an array will be created stored as `.songs`:
class SongList
  def initialize
    @songs = Array.new
  end

  # Let's add a method to append a song to our list:
  def append(song)
    @songs.push(song)
    self # important to return `self` (same as `this`) 
  end

  # Add a method to delete first song in list:
  def deleteFirst
    @songs.shift
    self
  end
  def deleteLast
    @songs.pop
    self
  end

  # Create a method so that we can find index of our song:
  def [](key)
    # if key.kind_of?(Integer)
    #   @songs[key]
    # else
    #   # for i in 0...@songs.length
    #   #   return @songs[i] if key == @songs[i].name
    #   # end

    #   # Note: the above would work but we can do it even better in a rubyesque way:

    #   result = @songs.find { |foundSong| key == foundSong.name  }
    #   # lookup the .find method to learn more

    # end

    # We can even re-write the above more cleanly
    return @songs[key] if key.kind_of?(Integer)
    return @songs.find { |foundSong| foundSong.name == key }
    # this is the beauty of inline expressions
  end
end

# Let's test our new class by generating some songs, because we are returning `self` in our append method, we can of course chain functions:
myList = SongList.new
myList.
  append(Song.new('title1', "artist1", 1)).
  append(Song.new('title2', "artist2", 2)).
  append(Song.new('title3', "artist3", 3)).
  append(Song.new('title4', "artist4", 4))

# Now lets go ahead and see if our deleteFirst and deleteLast methods are working:

puts myList.inspect

myList.deleteFirst
puts myList.inspect

myList.deleteLast.deleteLast # we chained here too
puts myList.inspect

myList.append(Song.new("another song", "cool artist", 10))

puts myList.inspect

puts myList[0]
# => Song: title2 -- artist2 (2)
puts myList[1]
# => Song: another song -- cool artist (10)
puts myList['another song']
# => Song: another song -- cool artist (10)

puts "--------------------------"
puts "-- ITERATORS AND BLOCKS --"
puts "--------------------------"

# Here we'll examine using iterators and blocks:

def threeTimes
  yield
  yield
  yield
end
threeTimes { puts "Yo yo yo" }

# Here's an example of the fibonacci sequence in a crazy Ruby way:

def fibUpTo(max)
  i1, i2 = 1, 1 # parralel assignment
  while i1 <= max
    yield i1
    i1, i2 = i2, i1+i2
  end
end

fibUpTo(1000) { |f| print f, " " }


# There are many more advanced ways to use the `yield` statements, so feel free to explore this as the need arises.

# Lastly, let's discuss `*args`. Similar to python's *kwargs, we can pass a single parameter defined by an asterisk, and then supply multiple arguments. For example:

def multipleArgs(*args)
  args.each do | argument |
    puts argument
  end
end

multipleArgs(1,2,3,4,5,"and","more","stuff")

# For more information: https://web.archive.org/web/20170113103604/http://www.misuse.org/science/2008/01/30/passing-multiple-arguments-in-ruby-is-your-friend
