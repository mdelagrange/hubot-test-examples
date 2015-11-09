Helper = require 'hubot-test-helper'

exports.helper = (script) ->
  return new Helper("#{__dirname}/../scripts/#{script}.coffee")

class RoomUtils
  constructor: (@room) ->

  say: (message, opts) ->
    opts ?= {}
    user = (if opts['user'] then opts['user'] else 'user1')
    return @room.user.say(user, message)

  getFirstResponse: ->
    return @room.messages[1][1]

exports.roomUtils = (room) ->
  new RoomUtils(room)
