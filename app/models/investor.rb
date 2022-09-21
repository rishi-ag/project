# Models investor in HG behaviour
class Investor < ActiveRecord::Base
  has_many :investor_contracts
  has_many :financed_invoices
  has_many :invoices, through: :financed_invoices

  validates :amount_deposited, presence: true
  validates :amount_deployed, presence: true
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  before_validation :remove_whitespaces

  private

  def remove_whitespaces
    email&.strip!
  end
end
