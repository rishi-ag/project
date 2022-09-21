# models client invoice
class StatusInvoice < ActiveRecord::Base
  belongs_to :invoice
end
