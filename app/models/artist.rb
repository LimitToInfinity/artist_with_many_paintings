class Artist < ApplicationRecord
    has_many :paintings
    accepts_nested_attributes_for :paintings, reject_if: :all_blank
end
