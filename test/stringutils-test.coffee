chai        = require 'chai'
stringutils = require '../src/stringutils'

expect      = chai.expect

describe "Stringutils module", ->

  it "should concat strings", (done) ->
    str1 = "foo"
    str2 = "foo"
    expect(stringutils.concat str1, str2).to.equal("foofoo")
    done()

  it "should index a string", (done) ->
    string = "foobar"
    expect(stringutils.index string, string).to.equal(0)
    done()

