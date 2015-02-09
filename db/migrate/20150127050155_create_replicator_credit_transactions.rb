class CreateReplicatorCreditTransactions < ActiveRecord::Migration
  def change
    create_table :replicator_credit_transactions do |t|
      t.integer :amount
      t.string :description

      t.timestamps null: false
    end
  end
end
