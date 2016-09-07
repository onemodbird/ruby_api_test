module Appo
  module Api
    class  Schedules < Grape::API
      content_type :ical, 'text/calendar'
      format :ical
      formatter :ical, -> (obj, env) { Appo::ICalendar.generate(obj) }

      resource "schedules" do

        desc "Return schedule in icalendar format"
        route_setting :track, event: :schedule_icalendar, data: [:type, :id]
        params do
          requires :type,
            type: String,
            values: Schedulable.allowed_types.map{ |type| type.to_s.downcase },
            allow_blank: false
          requires :id, type: String, allow_blank: false
        end
        get "icalendar" do
          p.type.capitalize.constantize.find(p.id).tap do |schedulable|
            filename = "#{schedulable.name.sub("#", "")}.ics"
            header "Content-Disposition", %(attachment; filename="#{filename}")
          end
        end

      end
    end
  end
end
