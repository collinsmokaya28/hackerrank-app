class AnswersController < ApplicationController
    def index 
        answer = Answer.all
        render json: answer
    end

    def show
        answer = Answer.find(params[:id])
        render json: answer
    end

    def create
        answer = Answer.create!(answer_params)
        render json: answer
    end

    def update
        answer = Answer.find(params[:id])
        answer.update
    end

    def destroy
        answer = Answer.find(params[:id])
        answer.destroy
        render json: answer, status: :no_content
    end

    private

    def answer_params
        params.permit(:correct_answer)
    end
end
