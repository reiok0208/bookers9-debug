class SearchController < ApplicationController
  before_action :authenticate_user!
  def search
    @book = Book.new
    method = params[:search_method]
    word = params[:search_word]
    what = params[:search_what]
    if  what == "User"
      @users = User.search(method,word)
    else what == "Book"
      @books = Book.search(method,word)
    end
  end

end
