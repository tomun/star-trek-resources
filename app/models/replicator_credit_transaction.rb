class ReplicatorCreditTransaction < ActiveRecord::Base #CreditTransaction
	belongs_to :crew_member # should come from derived?
end
