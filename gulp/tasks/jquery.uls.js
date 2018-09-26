import gulp from 'gulp';
import config from '../config.js';

//--------------------------------------------------------
// Concatenate jquery-uls libraries
//--------------------------------------------------------
const jqueryUlsPath = [
  'node_modules/@bower_components/jquery/dist/jquery.js'
  ];

gulp.task('jquery-uls', () => {
  return gulp.src(jqueryUlsPath)
    .pipe(gulp.dest(`${config.outputPath}/${config.jsDirectory}`));
});
