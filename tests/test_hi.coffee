testSupport = require('./test_support.coffee')

helper = testSupport.helper('hi')

expect = require('chai').expect

describe 'hello-world', ->

  beforeEach ->
    @room = helper.createRoom()
    @utils = testSupport.roomUtils(@room)

  afterEach ->
    @room.destroy()

  it 'should reply to user', ->
    @utils.say('@hubot hi', user: 'alice').then =>
      expect(@utils.getFirstResponse()).to.eql '@alice hi'
