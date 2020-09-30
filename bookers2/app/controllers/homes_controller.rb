class HomesController < ApplicationController

  def top
  end

  def about
    render 'homes/about', homes: @homes
  end

end
