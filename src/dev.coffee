
if process?
	nwgui = require 'nw.gui'
	nwwin = nwgui.Window.get()
	
	# Get rid of the shitty broken error handler
	process.removeAllListeners "uncaughtException"
	window.CRASHED = false
	process.on "uncaughtException", (e)->
		#console.error "Got exception:", e
		console.warn "Stopping main animation loop" unless window.CRASHED
		window.CRASHED = true
		nwwin.showDevTools()

	# Live reload
	chokidar = require 'chokidar'
	watcher  = chokidar.watch('.', ignored: /node_modules|\.git/)
	watcher.on 'change', (path)->
		watcher.close()
		console.log 'change', path
		nwwin.closeDevTools()
		location?.reload()


window.onerror = (e)->
	console?.warn? "Stopping main animation loop" unless window.CRASHED
	console?.error? "Got exception:", e
	window.CRASHED = true
