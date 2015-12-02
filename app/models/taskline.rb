class Taskline < ActiveRecord::Base
  belongs_to :project
  belongs_to :teammember
  belongs_to :task_type

  has_many :sub_tasks, class_name: "Taskline",
                       foreign_key: "uplevel_id", dependent: :destroy

  belongs_to :uplevel, class_name: "Taskline"

  # scope :top_levels, -> { where("uplevel_id is null") }
  scope :pretty_list, -> { order(:project_id, display_seq: :asc) }

  def full_display_name
      display_seq + '-' + code + '-' + name
  end
end
