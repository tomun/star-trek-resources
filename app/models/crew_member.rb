class CrewMember < ActiveRecord::Base
	has_many :replication #, :replication_debit_transaction, :replication_credit_transaction
end
