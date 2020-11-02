require 'set'
require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = 10.times.map { ('A'..'Z').to_a.sample }
  end

  def score
    @answer = params[:answer]
    @letters = params[:letters]
    @letters_match = letters_match(@letters, @answer) #this returns true or false
    @english_word = is_english_word(@answer)
  end

  private

  def letters_match(letters, answer)
    letters_array = letters.split(" ").to_set
    answer_array = answer.upcase.chars.to_set
    answer_array.subset?(letters_array)
  end
  
  def is_english_word(answer)
    url = "https://wagon-dictionary.herokuapp.com/#{answer}"
    word_in_json_dictionary = open(url).read
    word = JSON.parse(word_in_json_dictionary)
    word.key?('error') ? false : true
  end
end
