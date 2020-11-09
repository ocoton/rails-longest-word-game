class GamesController < ApplicationController
  def start
    @grid = Array.new(9) { ('A'..'Z').to_a.sample }
  end

  def score
    @guess = params[:guess]
    @grid = params[:grid]
    # @guess.chars.all? { |letter| @guess.count(letter) <= @grid.count(letter) }
    # raise
    @message = "try again"
    run_game
  end

  def included?(guess, grid)
    guess.chars.all? { |letter| guess.count(letter) <= grid.count(letter) }
  end

  def run_game
  if included?(@guess, @grid)
    if english_word?(@guess.upcase)
      @message = "Congratulations! #{@guess} is an English word!"
    else
      @message = "Sorry but #{@guess} is an English word!"
    end
    else
      @message = "Sorry but #{@guess} cannot be built out of #{@grid}"
    end
  end

  def english_word?(word)
    response = open("https://wagon-dictionary.herokuapp.com/#{@guess}")
    json = JSON.parse(response.read)
    return json['found']
  end
end
