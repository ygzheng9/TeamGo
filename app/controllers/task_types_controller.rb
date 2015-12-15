class TaskTypesController < ApplicationController
  before_action :set_task_type, only: [:show, :edit, :update, :destroy]

  # GET /task_types
  # GET /task_types.json
  def index
    @task_types = TaskType.pretty_list
  end

  # GET /task_types/1
  # GET /task_types/1.json
  def show
  end

  # GET /task_types/new
  def new
    @task_type = TaskType.new
  end

  # GET /task_types/new
  def new_subtask
    uplevel = TaskType.find(params[:id])

    @task_type = TaskType.new
    @task_type.company_id = uplevel.company_id
    @task_type.uplevel_id = uplevel.id
    @task_type.teammember_id = uplevel.teammember_id

    render 'new'
  end

  # GET /task_types/1/edit
  def edit
  end

  # POST /task_types
  # POST /task_types.json
  def create
    @task_type = TaskType.new(task_type_params)

    respond_to do |format|
      if @task_type.save
        format.html { redirect_to task_types_path, notice: 'Task type was successfully created.' }
        format.json { render :show, status: :created, location: @task_type }
      else
        format.html { render :new }
        format.json { render json: @task_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /task_types/1
  # PATCH/PUT /task_types/1.json
  def update
    respond_to do |format|
      if @task_type.update(task_type_params)
        format.html { redirect_to task_types_path, notice: 'Task type was successfully updated.' }
        format.json { render :show, status: :ok, location: @task_type }
      else
        format.html { render :edit }
        format.json { render json: @task_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_types/1
  # DELETE /task_types/1.json
  def destroy
    @task_type.destroy
    respond_to do |format|
      format.html { redirect_to task_types_url, notice: 'Task type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def edit_all
    @task_types = TaskType.pretty_list
  end

  def batch_edit
    @task_types = TaskType.pretty_list
  end

  def saveAll
    @haha = params

    TaskType.update(params['task_type'].keys, params['task_type'].values)

    # byebug

    respond_to do |format|
      format.json { head :no_content }
    end
  end

  def update_all
    TaskType.update(params['task_type'].keys, params['task_type'].values)

    redirect_to edit_all_task_types_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_type
      @task_type = TaskType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_type_params
      params.require(:task_type).permit(:company_id, :code, :name, :display_seq, :desc, :teammember_id, :uplevel_id)
    end
end
