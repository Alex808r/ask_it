class HelloController < ApplicationController
  def start
    render html: "Hello"
  end
end
