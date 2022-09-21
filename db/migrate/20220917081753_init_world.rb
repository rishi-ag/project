# creates initial model
class InitWorld < ActiveRecord::Migration[7.0]
  def change
    create_table :investors do |t|
      t.string :name
      t.string :email
      t.float :amount_deposited
      t.float :amount_deployed
      t.timestamps null: false
    end

    create_table :investor_contracts do |t|
      t.float :annualised_interest
      t.float :non_utilised_interest
      t.float :contract_amount
      t.references :investor, foreign_key: true
      t.timestamps null: false
    end

    create_table :financed_invoices do |t|
      t.float :deployed_amount
      t.references :investor, foreign_key: true
      t.references :invoice, foreign_key: true
      t.timestamps null: false
    end

    create_table :invoices do |t|
      t.float :total_amount
      t.timestamp :created_at
      t.timestamp :goods_delivered_at
      t.timestamp :goods_delivered_due_at
      t.boolean :is_goods_delivered
      t.references :client, foreign_key: true
      t.references :operator, foreign_key: true
    end

    create_table :operators do |t|
      t.string :name
      t.string :email
      t.timestamps null: false
    end

    create_table :clients do |t|
      t.string :name
      t.string :email
      t.references :operator, foreign_key: true
      t.timestamps null: false
    end

    create_table :operator_client_contracts do |t|
      t.integer :days_to_payment
      t.references :operator, foreign_key: true
      t.references :client, foreign_key: true
    end
  end
end
