require "rails_helper"

RSpec.describe ReplicatorDebitTransaction, :type => :model do 

	it "belongs to a CrewMember" do
		crew_member = CrewMember.create name:"Picard", rank:"Capt"

		debit = ReplicatorDebitTransaction.create description:"gift to Crusher", amount:10, crew_member:crew_member

		expect(debit.crew_member).to eq(crew_member)
	end

	it "belongs to a Replication" do
		crew_member = CrewMember.create name:"Picard", rank:"Capt"

		replication = Replication.create description:"Earl Grey", crew_member: crew_member

		debit = ReplicatorDebitTransaction.create description:"gift to Crusher", amount:10, replication:replication

		expect(debit.replication).to eq(replication)
	end

end