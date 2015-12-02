class TasklinesController < ApplicationController
  before_action :set_taskline, only: [:show, :edit, :update, :destroy]

  # GET /tasklines
  # GET /tasklines.json
  def index
    @tasklines = Taskline.pretty_list
  end

  # GET /tasklines/1
  # GET /tasklines/1.json
  def show
  end

  # GET /tasklines/new
  def new
    @taskline = Taskline.new
    @taskline.level = 1
  end

  # GET /tasklines/new_subtask
  def new_subtask
    uplevel = Taskline.find(params[:id])

    @taskline = Taskline.new
    @taskline.project_id = uplevel.project_id
    @taskline.uplevel_id = uplevel.id
    @taskline.teammember_id = uplevel.teammember_id

    if (uplevel.level.nil?)
      current_level = 1
    else
      current_level = uplevel.level
    end

    @taskline.level = current_level + 1

    render 'new'
  end

  # GET /tasklines/1/edit
  def edit
  end

  # POST /tasklines
  # POST /tasklines.json
  def create
    @taskline = Taskline.new(taskline_params)

    respond_to do |format|
      if @taskline.save
        # pry

        @taskline.task_type.sub_tasks.each do |sub|
            @taskline.sub_tasks.create({level: @taskline.level + 1, task_type_id: sub.id, teammember_id: sub.teammember_id, code: sub.code, name: sub.name, desc: sub.desc, display_seq: sub.display_seq})
            # new_sub.save!
        end

        format.html { redirect_to tasklines_path, notice: 'Taskline was successfully created.' }
        format.json { render :show, status: :created, location: @taskline }
      else
        format.html { render :new }
        format.json { render json: @taskline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasklines/1
  # PATCH/PUT /tasklines/1.json
  def update
    # if @taskline.task_type_id_changed?

    # byebug

    new_task_type_id = taskline_params[:task_type_id].to_i
    if @taskline.task_type_id != new_task_type_id then
      @taskline.task_type_id = new_task_type_id
      @taskline.task_type.sub_tasks.each do |sub|
          @taskline.sub_tasks.create({level: @taskline.level + 1, task_type_id: sub.id, teammember_id: sub.teammember_id, code: sub.code, name: sub.name, desc: sub.desc, display_seq: sub.display_seq})
          # new_sub.save!
      end
    end

    respond_to do |format|
      if @taskline.update(taskline_params)
        format.html { redirect_to tasklines_path, notice: 'Taskline was successfully updated.' }
        format.json { render :show, status: :ok, location: @taskline }
      else
        format.html { render :edit }
        format.json { render json: @taskline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasklines/1
  # DELETE /tasklines/1.json
  def destroy
    @taskline.destroy
    respond_to do |format|
      format.html { redirect_to tasklines_url, notice: 'Taskline was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_taskline
      @taskline = Taskline.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def taskline_params
      params.require(:taskline).permit(:project_id, :code, :name, :display_seq, :desc, :teammember_id, :uplevel_id, :planned_start_dt, :planned_end_dt, :actual_start_dt, :actual_end_dt, :planned_manhours, :actual_manhours, :completion, :level, :task_type_id)
    end
end
