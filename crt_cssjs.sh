#
# sass develop template 
#
mkdir dist src public test;
mkdir dist/assets;
for F in 'css' 'js' 'images' 'fonts'
do
	mkdir "dist/assets/$F"
done

for F in 'scss' 'js'
do
	mkdir "src/$F"
done

for F in 'css' 'js' 'images' 'fonts'
do
	mkdir "public/$F"
done

touch index.html index.js;
touch src/scss/app.scss;

touch README.md

# git init
git init
currentFolderName=${PWD##*/}  
cat > package.json <<EOL
{
  "name": "${currentFolderName}",
  "version": "1.0.0",
  "description": "my own css, collect css class and test",
  "main": "gulpfile.js",
  "devDependencies": {
  "browser-sync": "^2.18.12",
  "gulp": "^3.9.1",
  "gulp-autoprefixer": "^3.1.0",
  "gulp-load-plugins": "^1.1.0",
  "gulp-sass": "^2.1.0",
  "gulp-rename" : "^1.2.2"
},
"scripts": {
  "start": "gulp",
  "build": "gulp sass"
},
"license": "MIT",
"private": true,"dependencies": {
  "gulp-autoprefixer": "^3.1.0"
}
}
EOL
npm install -g gulp;
npm install;
cat > gulpfile.js <<EOL
// 2017-07-06
//1. gulp rename 이 필요함
// npm install gulp-rename
//2. gulp browserSync 가 필요함.
// npm install browser-sync gulp --save-dev (https://browsersync.io/docs/gulp)

var gulp = require('gulp');
var $    = require('gulp-load-plugins')();
var browserSync = require('browser-sync').create();
//var rename = require("gulp-rename");
//var gulpCopy = require('gulp-copy');
//var del = require('del');

var sassPaths = [
];

//compile sass
gulp.task('sass', function() {
  return gulp.src('src/scss/app.scss')
    .pipe($.sass({
      includePaths: sassPaths,
      outputStyle: 'nested' // nested,compressed
    })
    .on('error', $.sass.logError))
    .pipe($.autoprefixer({
      browsers: ['last 2 versions', 'ie >= 9']
    }))
    .pipe(gulp.dest('dist/assets/css'));
});

gulp.task('default', ['sass'], function() {
  browserSync.init({
       server: "./"
   });
  gulp.watch(['src/scss/**/*.scss'], ['sass']);
  gulp.watch(['dist/assets/css/*.css','*.html']).on('change', browserSync.reload);
});
EOL

