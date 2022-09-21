# class that models invoices financed by investor``
class FinancedInvoice < ActiveRecord::Base
  belongs_to :invoice
  belongs_to :investor

  validates :deployed_amount, presence: true, comparison: { greater_than_or_equal_to: 0.0 }
end
