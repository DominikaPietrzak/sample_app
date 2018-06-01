class ApplicationController < ActionController::Base
  include SessionsHelper

  protect_from_forgery with: :exception



  def hello
    #binding.pry
    render html: "hello"
  end

  def test
    render html: "test"
  end

  def test2
    render html: "test 2"
  end

  def about
    puts "kot"
  end

  def contact
  end
  private

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in"
      redirect_to login_url
    end
  end


end
