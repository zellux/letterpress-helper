class HomeController < ApplicationController
  def index
  end

  def search
    if params[:letters].scan(/\w/).size != 25
      flash[:error] = I18n.t('error.25_letters')
      redirect_to(root_path)
    end
    @letters = params[:letters].upcase.scan(/\w/).each_slice(5)
    @list = Solver.search(params[:letters])
  end
end
