class HighfivesController < ApplicationController
  # GET /highfives
  # GET /highfives.json
  def index
    @highfives = Highfive.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @highfives }
    end
  end

  # GET /highfives/1
  # GET /highfives/1.json
  def show
    @highfife = Highfive.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @highfife }
    end
  end

  # GET /highfives/new
  # GET /highfives/new.json
  def new
    @highfife = Highfive.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @highfife }
    end
  end

  # GET /highfives/1/edit
  def edit
    @highfife = Highfive.find(params[:id])
  end

  # POST /highfives
  # POST /highfives.json
  def create
    @highfife = Highfive.new(params[:highfife])

    respond_to do |format|
      if @highfife.save
        format.html { redirect_to @highfife, :notice => 'Highfive was successfully created.' }
        format.json { render :json => @highfife, :status => :created, :location => @highfife }
      else
        format.html { render :action => "new" }
        format.json { render :json => @highfife.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /highfives/1
  # PUT /highfives/1.json
  def update
    @highfife = Highfive.find(params[:id])

    respond_to do |format|
      if @highfife.update_attributes(params[:highfife])
        format.html { redirect_to @highfife, :notice => 'Highfive was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @highfife.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /highfives/1
  # DELETE /highfives/1.json
  def destroy
    @highfife = Highfive.find(params[:id])
    @highfife.destroy

    respond_to do |format|
      format.html { redirect_to highfives_url }
      format.json { head :ok }
    end
  end
end
