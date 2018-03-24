class Notifications
  constructor: ->
    @notifications = $("[data-behavior = 'notifications']")
    @setup() if @notifications.length > 0

  setup: ->
    $.ajax(
      url: "/notifications.json"
      datatype: "JSON"
      method: "GET"
      success: @handleSuccess
    )

  handleSuccess: (data) =>
    console.log(data)
    items = $.map data, (notification) ->
      "<li><a href='#{notification.url}'>#{notification.actor} #{notification.action} #{notification.notifiable.type}</a></li>"
    $("[data-behavior='unread-count']").text(items.length)
    $("[data-behavior='notification-items']").html(items)
jQuery ->
  new Notifications
