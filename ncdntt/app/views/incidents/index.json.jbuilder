json.array!(@incidents) do |incident|
  json.extract! incident, :id, :title, :user_id, :category, :description, :severity, :location, :is_closed, :date_closed, :closing_comment
  json.url incident_url(incident, format: :json)
end
