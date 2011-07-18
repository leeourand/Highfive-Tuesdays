class HighfivesController < ApplicationController
  before_filter :authenticate, :except => [:index, :show]
  
  # GET /highfives
  # GET /highfives.json
  def index
    @recent = Highfive.recent.approved
    @leaders = User.leaders
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @highfives }
    end
  end

  # GET /highfives/new
  # GET /highfives/new.json
  def new
    @highfive = Highfive.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @highfive }
    end
  end
  
  # GET /highfives/edit/1
  # GET /highfives/edit/1.json
  def edit
    @highfive = Highfive.find(params[:id])
    render :layout => false
  end
  
  # POST /highfives
  # POST /highfives.json
  def create
    @highfive = Highfive.new(params[:highfive])
		@highfive.user1 = current_user

    respond_to do |format|
      if @highfive.save
        # Send push notification to highfive recipient
        message = @highfive.id
        broadcast("/messages/#{@highfive.user2.id}", message)
        format.html { redirect_to highfives_path, :notice => 'Highfive was successfully submitted. Awaiting confirmation from "#{@highfive.user2.username}".' }
        format.json { render :json => @highfive, :status => :created, :location => @highfive }
      else
        format.html { render :action => "new" }
        format.json { render :json => @highfive.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def update
    @highfive = Highfive.find(params[:id])
    @highfive.approved = true
    @highfive.save if @highfive.user2 == current_user
  end


  # DELETE /highfives/1
  # DELETE /highfives/1.json
  def destroy
    @highfive = Highfive.find(params[:id])
    @highfive.destroy if @highfive.user2 == current_user

    respond_to do |format|
      format.html { redirect_to highfives_url }
      format.json { head :ok }
    end
  end
end
