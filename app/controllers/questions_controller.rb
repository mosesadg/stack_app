class QuestionsController < ApplicationController
	before_action :set_question, only: [:show, :edit, :update]
	before_action :question_owner, only: [:edit, :update, :destroy]
	
	def index
		@questions = Question.all
  		if params[:search]
				@questions = Question.search(params[:search]) + Answer.search(params[:search])
		  elsif params[:tag]
  			@questions = Question.tagged_with(params[:tag])
			else  			
		    @questions = Question.all.order('created_at DESC')
		end
	end

	def new
		@question = Question.new
	end

	def edit
	end

	def create
		@question = Question.new(question_params)
		@question.user_id = current_user.id

		if @question.save
			redirect_to @question, notice: 'Your question was created successfully'
		else
			render :new
		end
	end

	def show
		
	
	end

	def update
	  if @question.update(question_params)
	    redirect_to @question
	  else
	    render 'edit'
  end
end


	private
	def question_params
		params.require(:question).permit(:date, :text, :tag_list)
	end

	def set_question
		@question = Question.find(params[:id])
	end

  def question_owner
	 unless @question.user_id == current_user.id
	  flash[:notice] = 'Access denied'
	  redirect_to questions_path
   end
 end
end
