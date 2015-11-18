App.web_notifications = App.cable.subscriptions.create "WebNotificationsChannel",
  received: (data) ->
    rails_to_bootstrap = { "notice": "success", "info": "info", "alert": "warning", "error": "danger" }

    mode = rails_to_bootstrap[data["mode"]]
    body = """
      <div role="alert" class="alert alert-#{mode} alert-dismissible fade in">
        <button aria-label="Close" data-dismiss="alert" class="close" type="button"><span aria-hidden="true">×</span></button>
        #{data["body"]}
      </div>
    """
    $("#notifications").prepend(body)
