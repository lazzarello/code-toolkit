#!/usr/bin/ruby
require 'mathn'
# require 'openssl'
# noob style Diffe-Hellman key exchange in Ruby.

random = `openssl rand -hex 2`.chop
x = random.to_i(16)
# would be cool to pick a prime and find the primitive root
# such that prime > generator
# http://en.wikipedia.org/wiki/Primitive_root_modulo_n
prime = 41
generator = 28

y = (generator**x) % prime
puts y.to_s + " insecurly deliver this number to the peer"
puts "enter clear text number from peer"
yy = gets
key = (yy.to_i**x) % prime
puts key.to_s + " this is both of your secret key"
