module Admin::AdminHelper
  def format_date time_with_zone
    time_with_zone.in_time_zone('America/Chicago').to_date.to_s :long
  end

  def simple_form_sort(form, collection)
    form.input :sort,
                required: false,
                collection: collection,
                selected: -> (sort) {
                  if params.fetch(form.object_name.to_sym, {})[:sort] == sort
                    true
                  else
                    collection.first == sort
                  end
                },
                as: :select
  end

  def simple_form_ternary(form, name, collection)
    form.input name,
               required: false,
               collection: collection,
               checked: -> (item) {
                 if items = params.fetch(form.object_name, {})[name]
                   items.include?(item)
                 else
                   collection.last == item
                 end
               },
               as: :radio_buttons
    end
end
