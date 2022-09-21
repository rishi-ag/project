class OperatorClientContract < ActiveRecord::Base
  belongs_to :client
  belongs_to :operator

  validates :days_to_payment, comparison: { greater_than_or_equal_to: 0 }
end
