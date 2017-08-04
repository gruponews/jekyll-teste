module Reading
  class Generator < Jekyll::Generator
    VERSION = '0.1.0'

    def generate(site)
      site.collections.each do |name, collection|
        if name == 'eventos'
          site.data['upcomingEvents'] = collection.docs.select { |event|
            # Jekyll.logger.info(event.data['title'])

            date = event.data['event']['event_start_date']
            time = (event.data['event']['event_start_time'] == 0.0 ? '00:00:00': event.data['event']['event_start_time'])
            dateUnix = date.to_s + 'T' + time.to_s + '-03:00'
            datetime = Time.parse(dateUnix)
            datetime.utc >= Time.now.utc
          }
        end
      end
    end
  end
end
