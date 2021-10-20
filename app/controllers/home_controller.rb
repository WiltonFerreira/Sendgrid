class HomeController < ApplicationController
  def index
      @eventos = Sent.all
  end

  def about
  end
end
