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
require "test_helper"

class SentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
