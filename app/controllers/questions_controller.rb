class QuestionsController < ApplicationController
    
    # skip_before_action :authenticate_user

    def index 
        question = Question.all
        render json: question
    end

    def show
        question = Question.find(params[:id])
        render json: question
    end

    def create
        question = Question.create!(question_params)
        render json: question
    end

    def update
        question = Question.find(params[:id])
        question.update
        render json: question
    end

    def destroy
        question = Question.find(params[:id])
        question.destroy
        render json: question, status: :no_content 
    end

    private

    def question_params
        params.permit(:question)
    end

end
