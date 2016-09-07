window.Chat =
  disableMessage: (e, messageId)->
    e.preventDefault()
    $.post "/admin/chat_promos/cancel_message?message_id=#{messageId}", (data)->
      $(e.target).parent().toggleClass("canceled", true)
