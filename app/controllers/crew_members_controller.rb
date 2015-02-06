class CrewMembersController < ApplicationController
	before_action :set_crew_member, only: [:show, :use_replicator]

	# GET /crew_members
	def index
		@crew_members = CrewMember.all
		@login = ""
	end

  # GET /crew_members/1
  def show
  end

	# GET /crew_members/new
	def new
		@crew_member = CrewMember.new
	end

  # POST /crew_members
  # POST /crew_members.json
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

  def login
    respond_to do |format|
      format.html { redirect_to crew_member_path( params[:id] )}
    end
  end

  def use_replicator
    @replication = Replication.create(description: "Food", device: "ready room", crew_member: @crew_member)
  
    @replicator_debit_transaction = ReplicatorDebitTransaction.create(:description => "Replication", :crew_member => @crew_member, :replication => @replication)

    puts "******** @replicator_debit_transaction => #{@replicator_debit_transaction.inspect}"

    respond_to do |format|
      format.html { redirect_to crew_members_path, notice: 'Replication complete' }
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