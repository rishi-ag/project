require 'faker'
require 'json'

investors = []
investor_contracts = []
5.times do
  investor = Investor.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    amount_deposited: 1_000_000.00,
    amount_deployed: 0.00
  )
  investor_contract = InvestorContract.create(
    non_utilised_interest: rand(1..5),
    annualised_interest: rand(1..10),
    investor_id: investor.id,
    contract_amount: 1_000_000.00
  )
  investor_contracts << investor_contract
  investors << investor
end

operators = []
clients = []
invoices = []
5.times do
  operator = Operator.create(
    name: Faker::Name.name,
    email: Faker::Internet.email
  )
  operators << operator
  num_clients = rand(1..3)
  num_clients.times do
    client = Client.create(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      operator_id: operator.id
    )
    clients << client
    payment_days = [30, 60, 90][rand(0..2)]
    OperatorClientContract.create(
      days_to_payment: payment_days,
      operator_id: operator.id,
      client_id: client.id
    )
    created_date = Faker::Date.between(from: '2022-06-01', to: '2022-06-30')
    invoice = Invoice.create(
      total_amount: rand(500_000..1_000_000),
      created_at: created_date.to_time.to_i,
      is_goods_delivered: false,
      goods_delivered_due_at: (created_date + payment_days).to_time.to_i
    )
    invoices << invoice
  end
end

# invoices financed
funds_left = [1_000_000.0] * 5
invoices.each do |invoice|
  invoice_share = invoice.total_amount / 5
  investors.each_with_index do |investor, index|
    if funds_left[index] >= invoice_share
      FinancedInvoice.create(
        invoice_id: invoice.id,
        investor_id: investor.id,
        deployed_amount: invoice_share)
      investor.update(
        amount_deployed: investor.amount_deployed + invoice_share
      )
      funds_left[index] -= invoice_share
    end
  end
end
