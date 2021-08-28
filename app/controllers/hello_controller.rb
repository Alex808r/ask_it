# frozen_string_literal: true

class HelloController < ApplicationController
  def start
    render html: 'Hello'
  end
end
