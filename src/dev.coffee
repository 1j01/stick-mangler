
# Get rid of the shitty broken error handler
process.removeAllListeners "uncaughtException"
window.CRASHED = false
process.on "uncaughtException", (e)->
	window.CRASHED = true
	console.error "Caught uncaught exception:", e
	(require 'nw.gui').Window.get().showDevTools()

# Live reload
chokidar = require 'chokidar'
watcher  = chokidar.watch('.', ignored: /node_modules/)
watcher.on 'change', (path)->
	watcher.close()
	console.log 'change', path
	location?.reload()
