xcode-select --install

rails g scaffold tasks name:string biz_owner:string biz_plan_start_dt:date biz_plan_end_dt:date

rails g scaffold teammembers name:string display_name:string

rails g migration add_biz_owner_id_to_task biz_owner_id:integer


git remote add origin git@github.com:ygzheng9/TeamGo.git


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
1. overall layout
  top ban, log on the left, menu on the right, dropdown menu

1. create之后，清空dialog，以便更快度录入下一条记录； -- find the form_id and reset()  --OK

3. f.button :submit
  1. new 和 update 时，显示不同的名字，如何搞的？

1. create之后，直接调用另一个click？ remote？ -- ajax the screen is blank  -- walkaround: reset the form
2. gem 之后，装在哪了？scss的@import的路径是什么？
