class PagesController < ApplicationController
  def home
    @title = "Home"
  end

  def about
    @title = "About"
  end

  def login
	@title = "Login"
  end
  
  def help
	@title = "Help"
  end

end
