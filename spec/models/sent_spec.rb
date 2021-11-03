require 'rails_helper'

RSpec.describe Sent, type: :model do
  it "válido se possui conta, active e texto" do
    sent = Sent.new( account: 'mySendgrid', active: true, info: 'teste' ) 
    expect(sent).to be_valid
  end

  it "inválido se account é nulo" do
      sent = Sent.new(account: nil, active: true, info: 'teste')
      sent.valid?
      expect(sent.errors[:account]).to include("can't be blank")
  end

  it "inválido se info é nulo" do
    sent = Sent.new(account: 'mySendgrid', active: true, info: nil)
    sent.valid?
    expect(sent.errors[:info]).to include("can't be blank")
  end
  
  context 'validations' do
    it { should validate_presence_of(:account) }
    it { should validate_presence_of(:info) }
  end

end
