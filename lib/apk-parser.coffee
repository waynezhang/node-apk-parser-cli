#! /usr/bin/env coffee

parser     = require 'apk-parser'
prettyjson = require 'prettyjson'

args = process.argv.slice 2

if args.length == 0
  scriptname = __filename.replace "#{ __dirname }/", ''
  scriptname = scriptname.split('-')[0]
  console.log "#{ scriptname } filename"
  process.exit 1

apk = args[0]

parser apk, (err, data) ->
  if err then throw err

  str = prettyjson.render data, {
    keysColor: 'grey',
    numberColor: 'green',
    dashColor: 'white',
    stringColor: 'cyan'
  }
  console.log str
