class Company < ActiveRecord::Base
  has_many :projects
  has_many :task_types
end
