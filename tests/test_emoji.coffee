testSupport = require('./test_support.coffee')
expect = require('chai').expect

helper = testSupport.helper('emoji')


describe 'emoji', ->

  room = null

  beforeEach ->
    @room = helper.createRoom()
    @utils = testSupport.roomUtils(@room)
    room = @room

  afterEach ->
    @room.destroy()

  describe 'random emoji', ->
    it 'should return an emoji', ->
      @utils.say('emoji').then =>
        assertEmoji 1

    it 'should return 1 emoji', ->
      @utils.say('1 emoji').then =>
        assertEmoji 1

    it 'should return 3 emoji', ->
      @utils.say('3 emoji').then =>
        assertEmoji 3

    it 'literally returns zero emoji', ->
      @utils.say('0 emoji').then =>
        expect(@room.messages).to.eql [
          ['user1', '0 emoji']
          ['hubot', ':zero:']
        ]

  assertEmoji = (num) ->
    pat = ':[^:]+:'
    exp = '^'
    exp += pat for [1..num]
    exp += '$'
    regex = new RegExp exp
    sent = room.messages[1][1]
    match = sent.match regex
    expect(match, "Message '#{sent}' did not return #{num} emoji.").to.be.ok
