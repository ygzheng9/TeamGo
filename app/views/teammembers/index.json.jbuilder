json.array!(@teammembers) do |teammember|
  json.extract! teammember, :id, :name, :display_name
  json.url teammember_url(teammember, format: :json)
end
