xcode-select --install

rails g scaffold tasks name:string biz_owner:string biz_plan_start_dt:date biz_plan_end_dt:date

rails g scaffold teammembers name:string display_name:string

rails g migration add_biz_owner_id_to_task biz_owner_id:integer

rails g scaffold company name:string desc:string
rails g scaffold project name:string company_id desc:string
rails g model project_member project_id:integer teammember_id:integer


git remote add origin git@github.com:ygzheng9/TeamGo.git

rails g scaffold task_type company_id:integer code:string name:string display_seq:string desc:string teammember_id:integer uplevel_id:integer

rails g scaffold taskline project_id:integer code:string name:string display_seq:string desc:string teammember_id:integer uplevel_id:integer planned_start_dt:date planned_end_dt:date actual_start_dt:date actual_end_dt:date planned_manhours:decimal actual_manhours:decimal completion:decimal

rails g migration add_level_to_taskline level:integer

rails g migration add_task_type_to_taskline task_type_id:integer

rails g migration add_display_seq_to_teammember display_seq:integer

todo
2. ajax to new a task  -- OK
  1. ajax to popup a modal dialog
  2. within the dialog, to create the new task, to refresh the table
      1. render table as render @lines with ID each line
      2. ajax to replace render partial line of append to table
  3. close the modal dialog
5. 人员名单下拉 -- ok
3. datepicker -- OK
4. add new fields to task
1. overall layout  -- ok
  top ban, log on the left, menu on the right, dropdown menu

1. 按照level，显示缩进
2. 表格表头居中
3. form 改成分4列
4. 选择了 task_type 后，把 sub_tasks 加到下一级 -- OK
    1. 新增
    2. 修改
1. save 前，判断某个字段是否被修改过？ --ok

1. group method: 下拉框分组，并且能选中组；

1. create之后，清空dialog，以便更快度录入下一条记录； -- find the form_id and reset()  --OK

3. f.button :submit
  1. new 和 update 时，显示不同的名字，如何搞的？

1. create之后，直接调用另一个click？ remote？ -- ajax the screen is blank  -- walkaround: reset the form
2. gem 之后，装在哪了？scss的@import的路径是什么？

1. simple_form: check_box 的格式；



