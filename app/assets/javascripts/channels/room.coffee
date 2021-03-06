document.addEventListener 'turbolinks:load', ->
  App.room = App.cable.subscriptions.create { channel: "RoomChannel", room_id: $('#messages').data('room_id') },
    connected: ->

    disconnected: ->

    received: (data) ->
      show_user = $('#show_user').data('show_user')
      if data['chat_user'] == show_user.toString()
        $('#messages').append data['message_right']
      else
        $('#messages').append data['message_left']
      $("#chat_area").scrollTop( $("#chat_area")[0].scrollHeight )

    speak: (message) ->
      @perform 'speak', message: message

  $(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
    if event.ctrlKey && event.keyCode is 13 # return = send
      App.room.speak event.target.value
      event.target.value = ''
      event.preventDefault()

  $(document).on 'click', '.chat_button', ->
    App.room.speak $('[data-behavior~=room_speaker]').val()
    $('[data-behavior~=room_speaker]').val('')
    event.preventDefault()

  $(window).load ->
    $("#chat_area").scrollTop($("#chat_area")[0].scrollHeight);
