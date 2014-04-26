class TodosController < ApplicationController
	def index
		if !user_signed_in?
		redirect_to :controller => 'home', :action => 'index'
		end
		@todos = Todo.where(done:false)
		@todone = Todo.where(done:true)
	end

	def new
		@todo = Todo.new
	end
	def show
	send_file(
		    "#{Rails.root}/app/assets/data/abc.pdf",
		    filename: "abc_test.pdf",
		    type: "application/pdf"
	  )
	end
	
	def todo_params
	   params.require(:todo).permit(:name,:done)	
	end

	def create
		@todo = Todo.new(todo_params)
		
		if @todo.save
			redirect_to todos_path, :notice => "Your todo item was created!"
			else
			render "new"
		end
	end
	
	def update
		@todo = Todo.find(params[:id])
		if @todo.update_attribute(:done, true)
			redirect_to todos_path, :notice => "Your todo item was marked as done!"
		else
			render "edit"
		end
	end
	def destroy
		@todo = Todo.find(params[:id])
		@todo.destroy
		
		redirect_to todos_path, :notice => "Your todo item was deleted"
	end
	
	
	
  	
end


