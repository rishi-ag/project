# Client model for discounting
class Client < ActiveRecord::Base
  belongs_to :operator
  has_many :invoices
  has_many :operator_client_contracts
  has_many :financed_invoices, through: :invoices

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  before_validation :remove_whitespaces

  private

  def remove_whitespaces
    email&.strip!
  end
end
