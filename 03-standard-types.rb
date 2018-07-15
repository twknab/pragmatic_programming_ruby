# In this section we're going to look at numbers, strings, ranegs and regular expressions.

puts "------------------"
puts "---- NUMBERS -----"
puts "------------------"
# Ruby allows for floating point and integers.

# Numbers have some cool built in methods, like

3.times { print "yo \n" }  
# does block X number of times, X being number

1.upto(5) { |i| print i, "\n"  }
# starts at number and goes up to value running block

99.downto(95) { |i| print "#{i} decreasing \n"  } 
# starts at number and goes down running block

50.step(80, 5)  { |i| print  "#{i} incrementing \n" }
# starting at 50 step up to 80 in increments of 5 `.step(end, increment)`

puts "------------------"
puts "---- STRINGS -----"
puts "------------------"

# We can define strings similar to JS and other languages either by using `` single quotes or "" double quotes. Generally "" quotes in other languages, and in Ruby as well, support more escape sequences and abilities:

puts 'we can escape inside of a string by using "\\" '
puts 'That\'s right.'

# With double quotes we can even run expressions using `#{}`:
puts "Seconds in a day: #{60*60*24}"

puts "#{'Ho! ' * 3} Merry Christmas!"

puts "This is line #$."

# There are three more ways to create strings although you may not see these much:
puts %q/this is a single-quoted string/

puts %Q!this is a double-quoted string!
# notice the exclamation marks before and after

puts %Q{Seconds/day: #{60*60*24}}
# notice the brackets surrounding

# Finally there is a very weird and not likely to be used in most of your cases way:
puts <<ARBITRARY_TEXT
  The body of this string will
  will continue on until the same
  text that    followed the '<<' is
  again reached. Notice that     this
  is   similar to a string literal in JS
   as 
    all 
     spacings
      are
       preserved     :D
ARBITRARY_TEXT

# Strings have the largest number of methods within Ruby and there are a ton:
# http://ruby-doc.com/docs/ProgrammingRuby/html/ref_c_string.html

# Checkout some cool ones like `chomp`, `squeeze` and `split`

# We'll show a few examples of that below