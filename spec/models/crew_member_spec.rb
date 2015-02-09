require "rails_helper"

RSpec.describe CrewMember, :type => :model do 

	it "may have many Replications" do
		crew_member = CrewMember.create name:"Picard", rank:"Capt"

		replication = Replication.create description:"Earl Grey", crew_member: crew_member

		expect(crew_member.replications).to include(replication)
	end

	it "may have many ReplicatorCreditTransaction" do
		crew_member = CrewMember.create name:"Picard", rank:"Capt"

		credit = ReplicatorCreditTransaction.create description:"gift from Crusher", amount:10, crew_member:crew_member

		expect(crew_member.replicator_credit_transactions).to include(credit)
	end

	it "may have many ReplicatorDebitTransaction" do
		crew_member = CrewMember.create name:"Picard", rank:"Capt"

		debit = ReplicatorDebitTransaction.create description:"gift to Crusher", amount:10, crew_member:crew_member

		expect(crew_member.replicator_debit_transactions).to include(debit)
	end
end