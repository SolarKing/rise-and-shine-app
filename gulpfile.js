var gulp = require('gulp');
var connect = require('gulp-connect');
var sass = require('gulp-sass');


gulp.task('html', function() {
  gulp.src('./*.html')
    .pipe(connect.reload());
});

gulp.task('sass', function() {

  var options = {
    // outputStyle: 'compressed',
    indentedSyntax: true
  }

  return gulp.src('./*.sass')
    .pipe(sass(options).on('error', sass.logError))
    .pipe(gulp.dest('./'))
    .pipe(connect.reload());
});

gulp.task('tag', function() {
  gulp.src('./components/*.tag')
    .pipe(connect.reload());
});

gulp.task("connect", function() {
  connect.server({
    livereload: true
  });
});

gulp.task('watch', function () {
  gulp.watch(['./*.html'], ['html']);
  gulp.watch(['./*.sass'], ['sass']);
  gulp.watch(['./components/*.tag'], ['tag']);
});

gulp.task('default', ['connect', 'watch']);
