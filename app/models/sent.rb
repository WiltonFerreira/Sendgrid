# == Schema Information
#
# Table name: sents
#
#  id         :bigint           not null, primary key
#  account    :string
#  active     :boolean
#  info       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Sent < ApplicationRecord

    def created_at
        self[:created_at].strftime("%d/%m/%Y")
    end
end
