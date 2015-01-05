
if process?
	
	# Get rid of the shitty broken error handler
	process.removeAllListeners "uncaughtException"
	window.CRASHED = false
	process.on "uncaughtException", (e)->
		#console.error "Got exception:", e
		console.warn "Stopping main animation loop" unless window.CRASHED
		window.CRASHED = true
		(require 'nw.gui').Window.get().showDevTools()

	# Live reload
	chokidar = require 'chokidar'
	watcher  = chokidar.watch('.', ignored: /node_modules/)
	watcher.on 'change', (path)->
		watcher.close()
		console.log 'change', path
		location?.reload()


window.onerror = (e)->
	console?.warn? "Stopping main animation loop" unless window.CRASHED
	console?.error? "Got exception:", e
	window.CRASHED = true
