class PresentationsController < ApplicationController
  before_action :set_presentation , only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /presentations or /presentations.json
  def index
    @presentations = Presentation.all

    if current_user.admin?
      render 'admin'
    else
      render 'user'
    end
  end

  # GET /presentations/1 or /presentations/1.json
  def show
    @presentations = Presentation.all
  end

  # GET /presentations/new
  def new
    @presentation = current_user.presentations.build
  end

  # GET /presentations/1/edit
  def edit
  end

  # POST /presentations or /presentations.json
  def create
    @presentation = current_user.presentations.build(presentation_params)
    puts @presentation
    respond_to do |format|
      if @presentation.save
        format.html { redirect_to presentations_path, notice: "Presentation was successfully created." }
        format.json { render :show, status: :created, location: @presentation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @presentation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /presentations/1 or /presentations/1.json
  def update
    respond_to do |format|
      if @presentation.update(presentation_params)
        format.html { redirect_to presentation_url(@presentation), notice: "Presentation was successfully updated." }
        format.json { render :show, status: :ok, location: @presentation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @presentation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /presentations/1 or /presentations/1.json
  def destroy
    @presentation.destroy
    respond_to do |format|
      format.html { redirect_to presentations_url, notice: 'Presentation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


def update_grade
  @presentation = Presentation.find(params[:id])
  if @presentation.update(grade_params)
    redirect_to @presentation, notice: 'Grade was successfully updated.'
  else
    render :edit, alert: 'Failed to update grade.'
  end
end

private

def grade_params
  params.require(:presentation).permit(:grade)
end

before_action :check_admin, only: [:update_grade]

def check_admin
  redirect_to(root_url, alert: "You are not authorized to perform this action.") unless current_user.admin?
end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_presentation
      @presentation = Presentation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def presentation_params
      params.require(:presentation).permit(:title, :description, :date)
    end
end
