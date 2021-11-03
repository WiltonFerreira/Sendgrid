require 'rails_helper'

RSpec.describe AccountsController, type: :controller do
    
    describe "GET #index" do
        it { should route(:get, '/accounts').to(action: :index) }
    end
    describe "GET #show" do
        it { should route(:get, '/accounts/1').to(action: :show, id: 1) }
    end

end