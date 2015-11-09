Helper = require('hubot-test-helper')
# helper loads all scripts passed a directory

# helper loads a specific script if it's a file
helper = new Helper('../scripts/hi.coffee')

expect = require('chai').expect

describe 'hello-world', ->

  beforeEach ->
    @room = helper.createRoom()

  afterEach ->
    @room.destroy()

  it 'should reply to user', ->
    @room.user.say('alice', '@hubot hi').then =>
      expect(@room.messages).to.eql [
        ['alice', '@hubot hi']
        ['hubot', '@alice hi']
      ]
