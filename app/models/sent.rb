# == Schema Information
#
# Table name: sents
#
#  id         :bigint           not null, primary key
#  account    :string
#  active     :boolean
#  info       :text             default("true")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Sent < ApplicationRecord
    has_many :events
    validates :account, :info, presence: true
    after_initialize :set_defaults, unless: :persisted?

    def set_defaults
        self.active = true if self.active.nil?
    end

    def created_at
        self[:created_at].strftime("%d/%m/%Y")
    end
end
