# == Schema Information
#
# Table name: accounts
#
#  id         :bigint           not null, primary key
#  active     :boolean
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Account < ApplicationRecord
    has_many :events
    validates :name, presence: true, uniqueness: true 
    after_initialize :set_defaults, unless: :persisted?

    def set_defaults
        self.active = true if self.active.nil?
    end
end

