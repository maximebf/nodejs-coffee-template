
express = require 'express'
less = require 'less'
eco = require 'eco'

app = express.createServer()

#-----------------------------------------------------------------
# CONFIGURATION

app.configure ->
    app.use express.logger()
    app.use express.bodyDecoder()
    app.use express.compiler({
        src: __dirname + '/app/assets', 
        dest: __dirname + '/public',
        enable: ['less', 'coffeescript'] })
    app.use express.staticProvider(__dirname + '/public')
    
    app.set 'view engine', 'html'
    app.set 'views', './app/views'
    app.register '.html', 
        render: (str, options) ->
            eco.render str, options.locals

app.configure 'development', ->
    app.use express.errorHandler({ dumpExceptions: true, showStack: true })

app.configure 'production', ->
    app.use express.errorHandler()

#-----------------------------------------------------------------
# OPTIONS

argv = []
options = {}
for arg in process.argv
    if arg.substr(0, 2) == '--'
        parts = arg.split '='
        options[parts[0].substr(2).replace('-', '_')] = parts[1] || true
    else
        argv.push arg

#-----------------------------------------------------------------
# START

require('./app/actions').actions app, argv, options
port = options.port || 8080
console.log 'Starting server on port ' + port
app.listen port

