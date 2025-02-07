class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]
  def index
    @tasks=Task.order(created_at: :desc)
    @upcoming_tasks=Task.where("deadline >= ?",Date.today).order(deadline: :asc).limit(3)
    @total_tasks = @tasks.count
    @completed_tasks = @tasks.where(status: "completed").count
    @not_completed_tasks = @total_tasks - @completed_tasks
    if params[:search].present?
      # Perform the search based on task name or description
      @tasks = Task.where("name LIKE ? OR description LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
    else
      # If no search term, just show all tasks
      @tasks = Task.all
    end

    
    
    
    

    if params[:filter].present?
      case params[:filter]
      when 'open'
        @tasks = @tasks.where(status: 'open')
      when 'completed'
        @tasks = @tasks.where(status: 'completed')
      when 'overdue'
        @tasks = @tasks.where('deadline < ?', Date.today).where.not(status: 'completed')
      when 'in_progress'
        @tasks = @tasks.where(status: 'in_progress')
      end
    end

    
    
    

    

    

  
    
    

  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task=Task.new
  end


  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to @task
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
     
  end
  
  def update
    @task = Task.find(params[:id])
  
    if @task.update(task_params)
      redirect_to @task, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end
  def destroy
    @task.destroy
    redirect_to tasks_path
  end
  


  private
    def set_task
      @task = Task.find(params[:id])
    end


    def task_params
      params.expect(task: [ :name,:deadline,:description,:status,:high_priority])
    end
      
  end
