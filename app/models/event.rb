# == Schema Information
#
# Table name: events
#
#  id                   :bigint           not null, primary key
#  additional_arguments :text
#  attempt              :text
#  category             :text
#  email                :text
#  event                :text
#  event_post_timestamp :integer
#  ip                   :string
#  newsletter           :text
#  raw                  :text
#  reason               :text
#  response             :text
#  status               :text
#  timestamp            :integer
#  url                  :text
#  useragent            :text
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  account_id           :bigint           not null
#  asm_group_id         :integer
#  sent_id              :bigint           not null
#  sg_event_id          :text
#  sg_message_id        :text
#  smtp_id              :text
#  type_id              :text
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (sent_id => sents.id)
#
class Event < ApplicationRecord
  belongs_to :account
  belongs_to :sent

  scope :with_account, -> (account) { 
    joins(:account).where('accounts.name in (?)',account) 
  }

  
end
