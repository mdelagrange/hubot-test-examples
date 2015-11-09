# Description:
#   Say hi.
#
# Commands:
#   hubot hi - Says hi
#
module.exports = (robot) ->
  robot.respond /hi$/i, (msg) ->
    msg.reply 'hi'
