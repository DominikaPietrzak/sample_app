class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def hello
    binding.pry
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


end
