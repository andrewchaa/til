**Getting started**

```
npm install --global gulp-cli
npm install --save-dev gulp-sass
```

```javascript
var gulp = require('gulp');
var sass = require('gulp-sass');

gulp.task('sass', function () {
  return gulp.src('./Sushiwa/Content/sass/**/*.sass')
    .pipe(sass().on('error', sass.logError))
    .pipe(gulp.dest('./Sushiwa/Content/css'));
});

gulp.task('sass:watch', function () {
  gulp.watch('./Sushiwa/Content/sass/**/*.sass', ['sass'])
});

gulp.task('default', ['sass']);
```
