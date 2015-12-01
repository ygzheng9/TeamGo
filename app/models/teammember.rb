class Teammember < ActiveRecord::Base
  has_many :project_members
  has_many :projects, through: :project_members

  has_many :task_types
end
