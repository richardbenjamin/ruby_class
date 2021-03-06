class Tut

	attr_accessor :tut_string

	@@tut = 'ut'
	@@consonants = /[^aeiouAEIOU[:punct:]\ ]/
	@@consonants_ut = /([^aeiouAEIOU[:punct:]\ ]ut)/

	def self.to_tut( string )
		yield string.gsub!( @@consonants ) { |match|  "#{match}#{@@tut}" }
	end

	def self.to_english( string )
		puts string.gsub!( @@consonants_ut ) { |match|  "#{match}".sub("ut", "") }
	end

	# changed "print" to "puts" on the first test to create a new line

end

Tut.to_tut( "Wow! Look at this get converted to Tut!" ) { |c| puts c }
# should outout : Wutowut! Lutookut atut tuthutisut gutetut cutonutvuteruttutedut tuto Tututut!

tut_string = ""
Tut.to_tut( "I'm in tut but I want to be in english." ) { |c| tut_string += c }
puts tut_string
# should output : I'mut inut tututut bututut I wutanuttut tuto bute inut enutgutlutisuthut.

Tut.to_english( tut_string ) { |c| print c }
# should output : I'm in tut but I want to be in english.
