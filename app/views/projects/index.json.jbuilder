json.array!(@projects) do |project|
  json.extract! project, :id, :name, :company_id, :desc
  json.url project_url(project, format: :json)
end
