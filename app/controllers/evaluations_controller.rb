class EvaluationsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_evaluation, only: %i[ show edit update destroy ]
    before_action :set_presentation, only: %i[ create edit show update destroy ]

    def show
    end

    def create
        @evaluation = @presentation.evaluations.create(params[:evaluation].permit(:points, :feedback, :presentation_id))
        @evaluation.user_id = current_user.id
        respond_to do |format|
            if @evaluation.save
                format.html { redirect_to presentation_url(@presentation)}
                format.js
            else
                format.html { redirect_to presentation_url(@presentation), notice: "Evaluation was not created." }
                format.js
            end
        end
    end

    def new
    end

    def destroy
        @evaluation = @presentation.evaluations.find(params[:id])
        @evaluation.destroy
        redirect_to presentation_path(@presentation)
    end

    def edit
        @presentation = Presentation.find(params[:presentation_id])
        @evaluation = @presentation.evaluations.find(params[:id])
    end

    def update
        @evaluation = @presentation.evaluations.find(params[:id])
        respond_to do |format|
            if @evaluation.update(evaluation_params)
                format.html { redirect_to presentation_url(@presentation), notice: "Evaluation was successfully updated." }
                format.json { render :show, status: :ok, location: @evaluation }
            else
                format.html { render :edit, status: :unprocessable_entity }
                format.json { render json: @evaluation.errors, status: :unprocessable_entity }
            end
        end
    end

    private

    def set_evaluation
        @evaluation = Evaluation.find(params[:id])
    end

    def set_presentation
        @presentation = Presentation.find(params[:presentation_id])
    end

    def evaluation_params
        params.require(:evaluation).permit(:points, :feedback)
    end

end