# Description:
#   Impress your friends with a random emoji
#
# Dependencies:
#   emoji-random
#
# Configuration:
#   None
#
# Commands:
#   random emoji - give me a random emoji
#
# Author:
#   Hubot


emoji = require('emoji-random')

module.exports = (robot) ->
  robot.hear /(\d+)? ?emoji/i, (msg) ->
    times = msg.match[1]
    if times == '0'
      msg.send(':zero:')
    else
      times = parseInt(times) || 1
      resp = ''
      resp += emoji.random() for [1..times]
      msg.send(resp)
    return
