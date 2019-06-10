const mix = require('laravel-mix');

/*
 |--------------------------------------------------------------------------
 | Mix Asset Management
 |--------------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your Laravel application. By default, we are compiling the Sass
 | file for the application as well as bundling up all the JS files.
 |
 */

mix.js('resources/js/user/userJS.js', 'public/js/user')
   .js('resources/js/admin/adminJS.js', 'public/js/admin')
   .sass('resources/sass/user/userCSS.scss', 'public/css/user')
   .sass('resources/sass/admin/adminCSS.scss', 'public/css/admin');
