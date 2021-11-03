require 'rails_helper' 


describe Account, type: :model do 
    
    it "válido se possui name, active" do
        account = Account.new( name: 'Charles Xavier', active: true ) 
        expect(account).to be_valid
    end

    it "inválido se name é nulo" do
        account = Account.new(name: nil, active: true)
        
        account.valid?
        expect(account.errors[:name]).to include("can't be blank")
    end

    context 'validations' do
        subject {Account.new(name: 'Charles Xavier', active: true)}
        it { should validate_uniqueness_of(:name) }
    end
    
end
