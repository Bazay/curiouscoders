class TutorialsController < ApplicationController
  # GET /tutorials
  # GET /tutorials.json
  def index
    @tutorials = Tutorial.all
    authorize! :index, @tutorial, :message => 'Not authorized as an administrator.'

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tutorials }
    end
  end

  # GET /tutorials/1
  # GET /tutorials/1.json
  def show
   # @tutorial = Tutorial.find(params[:id])
      @tutorial = Tutorial.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tutorial }
    end
  end

  # GET /tutorials/new
  # GET /tutorials/new.json
  def new
    @tutorial = Tutorial.new
    authorize! :manage, @tutorial, :message => 'Not authorized to do this action.'

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tutorial }
    end
  end

  # GET /tutorials/1/edit
  def edit
    @tutorial = Tutorial.find(params[:id])
    authorize! :manage, @tutorial, :message => 'Not authorized to do this action.'
  end

  # POST /tutorials
  # POST /tutorials.json
  def create
    @tutorial = Tutorial.new(params[:tutorial])
    authorize! :manage, @tutorial, :message => 'Not authorized to do this action.'

    @tutorial.user = current_user

    respond_to do |format|
      if @tutorial.save
        format.html { redirect_to @tutorial, notice: 'Tutorial was successfully created.' }
        format.json { render json: @tutorial, status: :created, location: @tutorial }
      else
        format.html { render action: "new" }
        format.json { render json: @tutorial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tutorials/1
  # PUT /tutorials/1.json
  def update
    @tutorial = Tutorial.find(params[:id])
    authorize! :manage, @tutorial, :message => 'Not authorized to do this action.'

    respond_to do |format|
      if @tutorial.update_attributes(params[:tutorial])
        format.html { redirect_to @tutorial, notice: 'Tutorial was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tutorial.errors, status: :unprocessable_entity }
      end
    end
  end

  def tagged
    if params[:tag].present? 
      @tutorials = Tutorial.tagged_with(params[:tag])
    else 
      @tutorials = Tutorial.tutorialall
  end  
end

  # DELETE /tutorials/1
  # DELETE /tutorials/1.json
  def destroy
    @tutorial = Tutorial.find(params[:id])
    authorize! :manage, @tutorial, :message => 'Not authorized to do this action.'

    @tutorial.destroy

    respond_to do |format|
      format.html { redirect_to tutorials_url }
      format.json { head :no_content }
    end
  end

end
