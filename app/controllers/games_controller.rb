class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a
  end

  def score
    raise
  end
end
