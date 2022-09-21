# model to define the contract between investor and halliday growth
class InvestorContract < ActiveRecord::Base
  belongs_to :investor

  validates :contract_amount, comparison: { greater_than_or_equal_to: 0.0 }
  validates :annualised_interest, comparison: { greater_than_or_equal_to: 0.0, less_than_or_equal_to: 100.0 }
  validates :non_utilised_interest, comparison: { greater_than_or_equal_to: 0.0, less_than_or_equal_to: 100.0 }
end
