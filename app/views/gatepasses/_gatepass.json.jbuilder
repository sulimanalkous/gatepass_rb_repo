json.extract! gatepass, :id, :user_id, :gate_type_id, :national_id, :company_id, :from_date, :to_date, :reason, :person, :car_no, :car_type, :car_color, :ref_no, :note, :created_at, :updated_at
json.url gatepass_url(gatepass, format: :json)