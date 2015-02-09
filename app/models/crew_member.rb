class CrewMember < ActiveRecord::Base
	has_many :replications
	has_many :replicator_debit_transactions
	has_many :replicator_credit_transactions
end
