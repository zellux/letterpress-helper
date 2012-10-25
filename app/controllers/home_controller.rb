class HomeController < ApplicationController
  def index
  end

  def search
    @letters = params[:letters].upcase.scan(/\w/).each_slice(5)
    @list = Solver.search(params[:letters])
  end
end
