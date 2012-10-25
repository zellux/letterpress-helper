class HomeController < ApplicationController
  def index
  end

  def search
    @list = Solver.search(params[:letters])
  end
end
