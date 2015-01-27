class CreateReplicatorDebitTransactions < ActiveRecord::Migration
  def change
    create_table :replicator_debit_transactions do |t|
      t.integer :amount
      t.string :description

      t.timestamps null: false
    end
  end
end
