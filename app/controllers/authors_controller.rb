class AuthorsController < ApplicationController
  def new
    @author = Author.new()
  end
  def index
    @authors = Author.all
  end
  def create
    @author = Author.new(author_params)
    if @author.save
      redirect_to root_path, notice: 'Success!'
    else
      render 'new'
    end

    redirect_to root_path, notice: 'Success!'
    #render plain: params[:author].inspect
  end
  def show
    @author = Author.find(params[:id])
  end
  private
    def author_params
      params.require(:author).permit(:first_name, :last_name, :homepage)
    end
end
