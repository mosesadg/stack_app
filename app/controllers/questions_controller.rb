class QuestionsController < ApplicationController
	before_action :set_question, only: [:show]
	
	def index
		@questions = Question.all
	end

	def new
		@question = Question.new
	end

	def create
		@question = Question.new(post_params)
		@question.user_id = current_user.id

		if @question.save
			redirect_to @question, notice: 'Your question was created successfully'
		else
			render :new
		end
	end

	def show
		
	
	end


	private
	def post_params
		params.require(:question).permit(:date, :text)
	end

	def set_question
		@question = Question.find(params[:id])
	end
end
