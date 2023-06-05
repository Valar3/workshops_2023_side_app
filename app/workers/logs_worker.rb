class LogsWorker
  include Sneakers::Worker

  from_queue 'basic_app_book_logs', exchange: 'basic_app', exchange_type: :direct, routing_key: 'basic_app.book_loans'

  def work(attributes)
    logs = JSON.parse(attributes)

    ::Log.create(user_id: logs['id'], data: logs)
  end

end
