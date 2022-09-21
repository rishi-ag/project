# models client invoice
class Invoice < ActiveRecord::Base
  belongs_to :client
  belongs_to :operator
  has_many :financed_invoices
  has_many :investors, through: :financed_invoices
  has_many :operator_client_contracts, through: :operator
  after_initialize :init

  validates :total_amount, presence: true, comparison: { greater_than_or_equal_to: 0.0 }
  validates :created_at, presence: true

  private

  def init
    is_goods_delivered = false if is_goods_delivered.nil?
  end
end
