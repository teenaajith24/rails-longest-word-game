require 'open-uri'
require 'json'

class GamesController < ApplicationController

  def new
    @letters = []
    10.times { @letters << ('a'..'z').to_a.sample }

  end

  def score
    url = "https://wagon-dictionary.herokuapp.com/#{params[:word_to_check]}"
    eng_word_file = open(url).read
    word_found = JSON.parse(eng_word_file)
    if word_found["found"] == true
      @display_message = 1
    elsif word_found["error"] == "word not found"
      @display_message = 2
    else
      @display_message = new
    end
  end
end
