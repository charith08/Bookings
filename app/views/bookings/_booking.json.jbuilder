json.extract! booking, :id, :start, :end, :status, :created_at, :updated_at
json.url booking_url(booking, format: :json)
