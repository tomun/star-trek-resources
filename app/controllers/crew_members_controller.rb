class CrewMembersController < ApplicationController
	before_action :set_crew_member, only: [:show, :use_replicator, :transfer_to]

	# GET /crew_members
	def index
		@crew_members = CrewMember.all
		@login = ""
	end

  # GET /crew_members/1
  def show
    debits = ReplicatorDebitTransaction.where crew_member: @crew_member
    credits = ReplicatorCreditTransaction.where crew_member: @crew_member

    puts "debits = #{debits}"
    puts "credits = #{credits}"
    @transactions =  (debits + credits).sort{|a,b| a.created_at <=> b.created_at }
    puts "@transactions = #{@transactions}"

  end

	# GET /crew_members/new
	def new
		@crew_member = CrewMember.new
	end

  # POST /crew_members
  def create
    @crew_member = CrewMember.new(crew_member_params)

    respond_to do |format|
      if @crew_member.save
        format.html { redirect_to crew_members_path, notice: 'Crew member was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # POST /crew_members/login
  def login
    respond_to do |format|
      format.html { redirect_to crew_member_path( params[:id] )}
    end
  end

  # POST /crew_members/:id/use_replicator
  def use_replicator
    replication = Replication.create(description: params[:description], device: "replicator unit 1489", crew_member: @crew_member)
  
    replicator_debit_transaction = ReplicatorDebitTransaction.create(:description => "Replication", :crew_member => @crew_member, :replication => replication, :amount => 1)

    respond_to do |format|
      format.html { redirect_to crew_members_path, notice: 'Replication complete' }
    end
  end


  # POST /crew_members/:id/transfer_to
  def transfer_to
    other_crew_member = CrewMember.find(params[:to_id])

    replicator_debit_transaction = ReplicatorDebitTransaction.create(:description => "Transfer to #{other_crew_member.name}", :crew_member => @crew_member, :amount => params[:amount])

    replicator_credit_transaction = ReplicatorCreditTransaction.create(:description => "Transfer from #{@crew_member.name}", :crew_member => other_crew_member, :amount => params[:amount])

    respond_to do |format|
      format.html { redirect_to crew_members_path, notice: 'Transfer complete' }
    end
  end

private
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crew_member
      @crew_member = CrewMember.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def crew_member_params
      params.require(:crew_member).permit(:id, :name, :rank)
    end

end