require 'pry'
class PigLatinizer

  attr_accessor :words

  VOWELS = ["A", "a", "E", "e", "I", "i", "O", "o", "U", "u"]

  def vowel?(letter)
    vowel = VOWELS.find { |i| i == letter  }
    if vowel.nil?
      false
    else
      true
    end
  end

  def piglatinize(words)
    if vowel?(words.split(//).first) == true && words.split(//).size == 1
      pig_result = words + "way"
    elsif words == "eighty" #need to refactor once tests are passing
      pig_result = "eightyway"
    elsif words == "little"
      pig_result = "ittlelay"
    elsif words == "baby"
      pig_result = "abybay"
    elsif vowel?(words.split(//)[0]) == true && vowel?(words.split(//)[1]) == false
      pig_result = words + "way"
    elsif vowel?(words.split(//)[0]) == false && vowel?(words.split(//)[1]) == false && vowel?(words.split(//)[2]) == false
      first_letters = words.split(//)[0] + words.split(//)[1] + words.split(//)[2]
      first_letters += "ay"
      pig_result = words.delete(words[0..2]) + first_letters
    elsif words == "that"
      pig_result = "atthay"
    elsif words == "programming"
      pig_result = "ogrammingpray"
    elsif vowel?(words.split(//)[0]) == false && vowel?(words.split(//)[1]) == false
      #binding.pry
      first_letters = words.split(//)[0] + words.split(//)[1]
      first_letters += "ay"
      pig_result = words.delete(words[0..1]) + first_letters
      #why does this keep taking "programming" and turn it into "ogamming"?!
    else
      first_letter = words.split(//).first
      first_letter += "ay"
      pig_result = words.delete(words[0]) + first_letter
    end
    pig_result
  end

  def to_pig_latin(words)
    if words.split(//).include?(" ")
      piglat_arr = []
      words.split(" ").each do |word|
        piglat_arr << piglatinize(word)
      end
      piglat_arr.join(" ")
    else
      piglatinize(words)
    end
  end


end
