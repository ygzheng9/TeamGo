class Task < ActiveRecord::Base
    belongs_to :biz_owner, class_name: "Teammember", foreign_key: "biz_owner_id"
end
