class EventsController < ApplicationController
  def index
    perfil = CLIENTE
    @events = Event.with_account(perfil).order('created_at desc')
  end

  
end
