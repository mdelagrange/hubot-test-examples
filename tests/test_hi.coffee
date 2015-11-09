Helper = require('hubot-test-helper')
# helper loads all scripts passed a directory

# helper loads a specific script if it's a file
helper = new Helper('../scripts/hi.coffee')

co     = require('co')
expect = require('chai').expect

describe 'hello-world', ->

  beforeEach ->
    @room = helper.createRoom()

  afterEach ->
    @room.destroy()

  context 'user says hi to hubot', ->
    beforeEach ->
      co =>
        yield @room.user.say 'alice', '@hubot hi'
        yield @room.user.say 'bob',   '@hubot hi'

    it 'should reply to user', ->
      expect(@room.messages).to.eql [
        ['alice', '@hubot hi']
        ['hubot', '@alice hi']
        ['bob',   '@hubot hi']
        ['hubot', '@bob hi']
      ]
