var gulp = require('gulp-help')(require('gulp'));
var npm = require('npm');

var babelify = require('babelify');
var browserify = require('browserify');
var buffer = require('vinyl-buffer');
var concat = require('gulp-concat');
var del = require('del');
var event_stream = require('event-stream');
var fontina = require('fontina');
var glob = require('glob');
var imagemin = require('gulp-imagemin');
var install = require('gulp-install');
var path = require('path');
var rename = require('gulp-rename');
var sass = require('gulp-sass');
var source = require('vinyl-source-stream');
var sourcemaps = require('gulp-sourcemaps');
var tap = require('gulp-tap');
var uglify = require('gulp-uglify');
var util = require('gulp-util');
var runSequence = require('run-sequence'); // Temporary solution until Gulp upgrade 4.x

var config = {
		package: {
				files: ['./bower.json', './package.json']
		},
		assets: {
				css: 'app/assets/stylesheets/',
				images:'app/assets/images/',
				icons: 'app/assets/icons/',
				fonts: 'app/assets/fonts/',
				javascript: 'app/assets/javascripts/',
				dist: 'public/assets/'
		},
		sass: {
				dev: {
						indentedSyntax: true,
						errLogToConsole: true,
						includePaths: ['node_modules/susy/sass/',
													 "node_modules/breakpoint-sass/stylesheets/"]
				},
				prod: {
						indentedSyntax: false,
						errLogToConsole: true,
						outputStyle: 'compressed',
						includePaths: ['node_modules/susy/sass/',
													 "node_modules/breakpoint-sass/stylesheets/"]
				}
		}
};

gulp.task('default', ['dev:compile', 'watch']);

gulp.task('watch', function() {
		gulp.watch('package.json', function() {
				runSequence('development:prune', 'development:install');
		});

		gulp.watch(config.assets.css + '**/*', function() {
				runSequence('clean:assets:css',
										'development:compile:css');
		});

		gulp.watch(config.assets.javascript + '**/*', function() {
				runSequence('clean:assets:javascript',
										'development:compile:javascript');
		});

		gulp.watch(config.assets.images + '**/*', function() {
				runSequence('clean:assets:images',
										'development:process:images');
		});

		gulp.watch(config.assets.icons + '**/*', function() {
				runSequence('clean:assets:icons',
										'development:process:icons');
		});

		gulp.watch(config.assets.fonts + '**/*', function() {
				runSequence('clean:assets:fonts',
										'development:process:fonts');
		});
});

gulp.task('dev:compile', ['development:install',
													'development:process:fonts',
													'development:process:images',
													'development:process:icons',
													'development:compile:css',
													'development:compile:javascript']);

gulp.task('prod:compile', ['production:install',
													 'production:process:fonts',
													 'production:process:images',
													 'production:process:icons',
													 'production:compile:css',
													 'production:compile:javascript']);

gulp.task('clean:assets', ['clean:assets:css',
													 'clean:assets:fonts',
													 'clean:assets:javascript',
													 'clean:assets:images',
													 'clean:assets:icons']);

gulp.task('development:install', function() {
		return gulp.src(config.package.files)
				.pipe(install());
});

gulp.task('development:prune', function() {
		return new Promise(function(res, rej) {
				npm.load(function(err, npm) {
						if (err) {
								rej(err);
						} else {
								res(npm);
						}
				});
		})
				.then(function(npm) {
						npm.commands.prune();
				})
				.catch(function(err) {
						util.log(err);
				});
});

gulp.task('production:install', function() {
		return gulp.src(config.package.files)
				.pipe(install({production: true}));
});

gulp.task('development:compile:css',
					['development:compile:sass', 'development:compile:scss']);

gulp.task('development:compile:sass', function() {
		return gulp.src(config.assets.css + '*.sass')
				.pipe(sourcemaps.init())
				.pipe(sass(config.sass.dev))
				.on('error', util.log)
				.pipe(sourcemaps.write())
				.pipe(gulp.dest(config.assets.dist));
});

gulp.task('development:compile:scss', function() {
		return gulp.src(config.assets.css + '*.scss')
				.pipe(sourcemaps.init())
				.pipe(sass(config.sass.dev))
				.on('error', util.log)
				.pipe(sourcemaps.write())
				.pipe(gulp.dest(config.assets.dist));
});

gulp.task('production:compile:css',
					['production:compile:sass', 'production:compile:scss']);

gulp.task('production:compile:sass', function() {
		return gulp.src(config.assets.css + '*.sass')
				.pipe(sass(config.sass.prod))
				.on('error', util.log)
				.pipe(gulp.dest(config.assets.dist));
});

gulp.task('production:compile:scss', function() {
		return gulp.src(config.assets.css + '*.scss')
				.pipe(sass(config.sass.prod))
        .on('error', util.log)
				.pipe(gulp.dest(config.assets.dist));
});

gulp.task('development:compile:javascript', function() {
		return glob(config.assets.javascript + '?(*.es6|*.js)', function(err, files) {
				var tasks = files.map(function(entry) {
						return compile_javascript(entry)
								.pipe(gulp.dest(config.assets.dist));
				});
				return event_stream.merge.apply(null, tasks);
		});
});

gulp.task('production:compile:javascript', function() {
		return glob(config.assets.javascript + '?(*.es6|*.js)', function(err, files) {
				var tasks = files.map(function(entry) {
						return compile_javascript(entry)
								.pipe(buffer())
								.pipe(uglify())
								.pipe(gulp.dest(config.assets.dist));
				});
				return event_stream.merge.apply(null, tasks);
		});
});

function compile_javascript(entry) {
		var filename = path.basename(entry);
		return browserify(entry, {debug: true,
															extensions: ['.js', '.es6']})
				.transform(babelify)
				.bundle()
				.on('error', util.log)
				.pipe(source(filename))
				.pipe(rename({extname: '.js'}));
}

gulp.task('development:process:images', function() {
		return process_images(config.assets.images + '*', config.assets.dist + '/images/');
});

gulp.task('production:process:images', function() {
		return process_images(config.assets.images + '*', config.assets.dist + '/images/');
});

gulp.task('development:process:icons', function() {
		return process_images(config.assets.icons + '*', config.assets.dist + '/icons/');
});

gulp.task('production:process:icons', function() {
		return process_images(config.assets.icons + '*', config.assets.dist + '/icons/');
});

function process_images(inpath, outpath) {
		return gulp.src(inpath)
				.pipe(imagemin())
				.pipe(gulp.dest(outpath));
}

gulp.task('development:process:fonts', process_fonts);
gulp.task('production:process:fonts', process_fonts);

function process_fonts() {
		return gulp.src(config.assets.fonts + '*')
				.pipe(tap(function(file, t){
						fontina(file.path, config.assets.dist + '/fonts/', {});
				}));
};

// Cleanup related tasks
gulp.task('clean:assets:fonts', function() {
		return del([config.assets.dist + 'fonts/*'], function(err, paths) {
				console.log('cleaned the following font files from the ' +
										config.assets.dist + ' directory:\n', paths.join('\n'));
		});
});

gulp.task('clean:assets:images', function() {
		return del([config.assets.dist + 'images/*'], function(err, paths) {
				console.log('cleaned the following images files from the ' +
										config.assets.dist + ' directory:\n', paths.join('\n'));
		});
});

gulp.task('clean:assets:icons', function() {
		return del([config.assets.dist + 'icons/*'], function(err, paths) {
				console.log('cleaned the following icons files from the ' +
										config.assets.dist + ' directory:\n', paths.join('\n'));
		});
});

gulp.task('clean:assets:css', function() {
		return del([config.assets.dist + '*.css'], function(err, paths) {
				console.log('cleaned the following css files from the ' +
										config.assets.dist + ' directory:\n', paths.join('\n'));
		});
});

gulp.task('clean:assets:javascript', function() {
		return del([config.assets.dist + '*.js'], function(err, paths) {
				console.log('cleaned the following javascript files from the ' +
										config.assets.dist + ' directory:\n', paths.join('\n'));
		});
});
