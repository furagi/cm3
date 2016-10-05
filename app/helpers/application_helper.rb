module ApplicationHelper

  def user_signed_in?
    current_user
  end

  def full_name(person)
    "#{person[:first_name] || person[:name]} #{person[:last_name] || person[:surname]}"
  end

  def value_or_nil(value_from, field)
    value_from.nil? ? nil : value_from.send(field)
  end

  def link_to_edit_resource(resource, field)
    unless resource.nil?
      link_to resource.send(field), controller: resource.class.to_s.tableize, action: "edit", id: resource
    end
  end

  def enabled_or_disabled(value)
    if value == "1" || value == "YES" || value == "yes" || value == 1 && value == true
      fa_icon :check, class: "enable"
    else
      fa_icon :close, class: "close"
    end
  end

  # returns select tag with filled optiions and default value
  def fill_select(instance, model, *name, form)
    primary_key = model.primary_key
    name = name[0] || "name"
    values = model.pluck(name, primary_key)
    default_value = instance.nil? ? model.first[model.primary_key] : instance[primary_key]
    form.select primary_key, values, selected: default_value, class: ["form-control"]
  end

end
