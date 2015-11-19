gulp = require 'gulp'
coffee = require 'gulp-coffee'
through = require 'through2'

gulp.task 'compile', ->
	gulp.src('src/**/*.coffee')
		.pipe coffee()
		.pipe gulp.dest('lib')

gulp.task 'example', ->
	jsonnetExec = require './lib/index'
	gulp.src('example/src/exec.jsonnet')
		.pipe through.obj (file, enc, next) ->
			jsonnetExec.exec "#{file.path}", (error, stdout, stderr) =>
				throw error if error
				file.contents = new Buffer stdout
				file.path = file.path.replace /\.jsonnet$/, '.json'
				@push file
				next()
		.pipe gulp.dest('example/dest')
	gulp.src('example/src/exec-sync.jsonnet')
		.pipe through.obj (file, enc, next) ->
			stdout = jsonnetExec.execSync "#{file.path}"
			file.contents = stdout
			file.path = file.path.replace /\.jsonnet$/, '.json'
			@push file
			next()
		.pipe gulp.dest('example/dest')

gulp.task 'default', ['compile']
