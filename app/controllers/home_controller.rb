class HomeController < ApplicationController
  def index
      @eventos = Sent.where(account: = 'cdlparauapebas')
  end

  def about
  end
end
