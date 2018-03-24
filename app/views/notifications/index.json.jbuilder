json.array! @notifications do |notification|
  json.id notification.id
  json.recipient notification.recipient.name
  json.actor notification.actor.institution_name
  json.action notification.action
  json.notifiable do
    json.type "a #{notification.notifiable.class.to_s.underscore.humanize.downcase}"
  end #notification.notifiable
  json.url jobs_path(notification.notifiable)
end
