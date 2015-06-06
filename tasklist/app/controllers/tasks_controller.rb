class TasksController < ApplicationController
	#before_action :set_tasks, only: [:edit, :update, :destroy]
	#before_action :all_tasks, only: [:index, :create, :update, :destroy]
	# makes it so ALL actions respond to json
  respond_to :html, :js


  # If we wanted to provide json only in our index action, we would write something like this:
	# def index
	#   @tasks = Task.all

	#   respond_to do |format|
	#     format.html
	#     format.json
	#   end
	# end

	def index
		@tasks = Task.all
	end

  def new
    @task = Task.new
  end

  def create
  	@tasks = Task.all
    @task  = Task.create(task_params)
  end


  #updating a task on the index page
  def edit
    @task = Task.find(params[:id])
  end

  def update
  	@tasks = Task.all

    @task = Task.find(params[:id])
    @task.update_attributes(task_params)
  end



  def destroy
  	@tasks = Task.all
    @task = Task.find(params[:id])
    @task.destroy
  end



  private

  def set_tasks
    @task = Task.find(params[:id])
  end

  def all_tasks
    @tasks = Task.all
  end

  def task_params
    params.require(:task).permit(:description, :deadline)
  end

end