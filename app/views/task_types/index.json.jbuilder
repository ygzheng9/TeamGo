json.array!(@task_types) do |task_type|
  json.extract! task_type, :id, :company_id, :code, :name, :display_seq, :desc, :teammember_id, :parent_id
  json.url task_type_url(task_type, format: :json)
end
