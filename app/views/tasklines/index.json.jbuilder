json.array!(@tasklines) do |taskline|
  json.extract! taskline, :id, :project_id, :code, :name, :display_seq, :desc, :teammember_id, :uplevel_id, :planned_start_dt, :planned_end_dt, :actual_start_dt, :actual_end_dt, :planned_manhours, :actual_manhours, :completion
  json.url taskline_url(taskline, format: :json)
end
