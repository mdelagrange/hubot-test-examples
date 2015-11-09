Helper = require 'hubot-test-helper'

exports.helper = (script) ->
  return new Helper("#{__dirname}/../scripts/#{script}.coffee")

class RoomUtils
  constructor: (@room) ->

  say: (message, opts) ->
    opts ?= {}
    user = (if opts['user'] then opts['user'] else 'user1')
    return @room.user.say(user, message)

exports.roomUtils = (room) ->
  new RoomUtils(room)
