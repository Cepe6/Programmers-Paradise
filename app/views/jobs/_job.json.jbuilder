json.extract! job, :id, :author_id, :description, :type, :salary, :currency, :created_at, :updated_at
json.url job_url(job, format: :json)
