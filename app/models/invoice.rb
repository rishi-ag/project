# models client invoice
class Invoice < ActiveRecord::Base
  belongs_to :client
  belongs_to :operator
  has_many :financed_invoices
  has_many :investors, through: :financed_invoices
  has_many :operator_client_contracts, through: :operator
  has_one :status_invoice

  validates :total_amount, presence: true, comparison: { greater_than_or_equal_to: 0.0 }
  validates :created_at, presence: true
end
