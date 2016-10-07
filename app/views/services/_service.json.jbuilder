json.extract! service, :id, :service_category
json.start service.scheduled_time
json.title "#{service.service_category.name}\n#{service.employee.name}"
json.url service_url(service, format: :html)
