require "rails_helper"

RSpec.describe ReplicatorCreditTransaction, :type => :model do 

	it "belongs to a CrewMember" do
		crew_member = CrewMember.create name:"Picard", rank:"Capt"

		credit = ReplicatorCreditTransaction.create description:"gift from Crusher", amount:10, crew_member:crew_member

		expect(credit.crew_member).to eq(crew_member)
	end

end