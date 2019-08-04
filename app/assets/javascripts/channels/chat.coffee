App.chat = App.cable.subscriptions.create "ChatChannel",
  connected: ->
    
  disconnected: ->

  received: (data) ->
    console.log(data)
    art = document.createElement("article")
    
    span_user = document.createElement("span")
    span_user.innerText = "<#{data["user"]}> : "
    art.append(span_user)

    span_message = document.createElement("span")
    span_message.innerText = data["message"];
    art.append(span_message);

    
    chat = document.querySelector("#chat")
    chat.append(art)
    chat.scrollTop = chat.scrollHeight;

  send_message: (data) ->
    @perform "send_message", message:data