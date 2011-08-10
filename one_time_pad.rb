#!/usr/bin/ruby
require 'rubygems'

letters = []
("a".."z").each do |l|
  letters << l
end

type = ARGV.shift
if type == "-e"  
  plaintext = gets.chomp
  plaintext_arr = plaintext.scan /./
  cypher = plaintext.size.times.map{ 
    i = rand 25
    letters[i]
  }
  cyphertext = []
  plaintext.size.times do |l|
    p = letters.index plaintext_arr[l]
    c = letters.index cypher[l]
    cti = (p.to_i + c.to_i) % 25
    cyphertext << letters[cti]
  end
  puts "Cypher: #{cypher.to_s}"
  puts "Cyphertext: #{cyphertext.to_s}"
elsif type == "-d"
  puts "please enter cypher"
  cypher = gets.chomp
  cypher_arr = cypher.scan /./
  puts "please enter cyphertext"
  cyphertext = gets.chomp
  cyphertext_arr = cyphertext.scan /./
  plaintext = []
  cyphertext.size.times do |l|
    ct = letters.index cyphertext_arr[l]
    c = letters.index cypher_arr[l]
    pti = (ct.to_i - c.to_i) % 25
    plaintext << letters[pti]
  end
  puts "Plaintext: #{plaintext.to_s}"
else
  puts "you must give an option for encrypting or decrypting a string"
end
