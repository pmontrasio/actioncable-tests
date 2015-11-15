App.web_notifications = App.cable.subscriptions.create "WebNotificationsChannel",
  received: (data) ->
    $(".#{data["mode"]}").html(data["body"])
