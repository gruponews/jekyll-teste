module Reading
  class Generator < Jekyll::Generator
    VERSION = '0.1.0'

    def generate(site)
      site.collections.each do |name, collection|
        if name == 'eventos'
          site.data['upcomingEvents'] = collection.docs.select { |event|

            date = event.data['event']['event_start_date']
            time = (event.data['event']['event_start_time'] == 0.0 ? '00:00:00': event.data['event']['event_start_time'])
            datetime = date.to_s + 'T' + time.to_s + '-03:00'
            Jekyll.logger.info(date)
            Jekyll.logger.info(time)
            Jekyll.logger.info(Time.now)
            Jekyll.logger.info( DateTime.strptime(datetime, '%Y-%m-%dT%H:%M:%S%z'))

            DateTime.strptime(datetime, '%Y-%m-%dT%H:%M:%S%z') >= Time.now
          }
        end
      end
    end

  end
end
