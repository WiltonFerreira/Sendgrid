class HomeController < ApplicationController
  def index
      perfil = CLIENTE
      @eventos = Sent.where(account: perfil).order('created_at desc')
      
  end

  def about
  end
end
