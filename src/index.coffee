path = require 'path'
child_process = require 'child_process'

jsonnetBinFilePath = path.resolve __filename, '../../bin/jsonnet'

_exec = (args, sync) ->
	args = Array.prototype.slice.call args
	if typeof args[0] is 'string'
		args[0] = "#{jsonnetBinFilePath} #{args[0]}"
	if sync
		child_process.execSync.apply child_process, args
	else
		child_process.exec.apply child_process, args

module.exports =
	exec: ->
		_exec arguments

	execSync: ->
		_exec arguments, true
