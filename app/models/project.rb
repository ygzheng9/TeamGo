class Project < ActiveRecord::Base
  belongs_to :company
  has_many :project_members
  has_many :teammembers, through: :project_members
end
