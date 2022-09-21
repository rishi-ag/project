class Operator < ActiveRecord::Base
  has_many :clients
  has_many :invoices
  has_many :operator_client_contracts

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  before_validation :remove_whitespaces

  private

  def remove_whitespaces
    email&.strip!
  end
end
