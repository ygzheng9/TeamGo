class TaskType < ActiveRecord::Base
  belongs_to :company
  belongs_to :teammember

  has_many :sub_tasks, class_name: "TaskType",
                       foreign_key: "uplevel_id"

  belongs_to :uplevel, class_name: "TaskType"

  scope :top_levels, -> { where("uplevel_id is null") }
  scope :pretty_list, -> { order(:company_id, display_seq: :asc) }

  def full_display_name
      display_seq + '-' + code + '-' + name
  end

end
