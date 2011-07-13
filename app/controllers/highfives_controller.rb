class HighfivesController < ApplicationController
  before_filter :authenticate, :except => [:index, :show]
  
  # GET /highfives
  # GET /highfives.json
  def index
    @recent = Highfive.recent
    @leaders = User.leaders
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @highfives }
    end
  end

  # GET /highfives/1
  # GET /highfives/1.json
  def show
    @highfive = Highfive.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @highfive }
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

  # GET /highfives/1/edit
  def edit
    @highfive = Highfive.find(params[:id])
  end

  # POST /highfives
  # POST /highfives.json
  def create
    params[:highfive][:user1_id] = current_user
    @highfive = Highfive.new(params[:highfive])

    respond_to do |format|
      if @highfive.save
        format.html { redirect_to @highfive, :notice => 'Highfive was successfully created.' }
        format.json { render :json => @highfive, :status => :created, :location => @highfive }
      else
        format.html { render :action => "new" }
        format.json { render :json => @highfive.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /highfives/1
  # PUT /highfives/1.json
  def update
    @highfive = Highfive.find(params[:id])

    respond_to do |format|
      if @highfive.update_attributes(params[:highfive])
        format.html { redirect_to @highfive, :notice => 'Highfive was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @highfive.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /highfives/1
  # DELETE /highfives/1.json
  def destroy
    @highfive = Highfive.find(params[:id])
    @highfive.destroy

    respond_to do |format|
      format.html { redirect_to highfives_url }
      format.json { head :ok }
    end
  end
end
