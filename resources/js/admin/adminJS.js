require('../bootstrap.js');
require('./admin');
window.Vue = require('vue');

import Vue from 'vue'

//moment js for date and time format
import moment from 'moment'
Vue.filter('myDate', function (created) {
  return moment(created).format("MMMM Do YYYY");
})
//capitalize words
Vue.filter('capitalize', function (value) {
  if (!value) return ''
  value = value.toString()
  return value.charAt(0).toUpperCase() + value.slice(1)
})

import VueRouter from 'vue-router'
Vue.use(VueRouter)

import swal from 'sweetalert2/dist/sweetalert2.all.min.js'
window.swal = swal

const toast = swal.mixin({
  toast: true,
  position: 'top-end',
  showConfirmButton: false,
  timer: 2000
});
window.toast=toast

import VueProgressBar from 'vue-progressbar'
const options = {
  color: '#eeeeee',
  failedColor: 'red',
  thickness: '5px',
  transition: {
    speed: '0.9s',
    opacity: '0.1s',
    termination: 300
  },
  autoRevert: true,
  location: 'top',
  inverse: false,
}
Vue.use(VueProgressBar, options)

import { Form, HasError, AlertError } from 'vform' // v-form library
Vue.component(HasError.name, HasError)
Vue.component(AlertError.name, AlertError)
window.Form =Form;

// Vue.component('pagination', require('laravel-vue-pagination'));

let routes = [
  //intro routes
  { path: '/Home',component: require("../admin-components/home.vue").default  },
  { path: '/admin/users',component: require("../admin-components/users.vue").default },
  { path: '/admin/users',component: require("../admin-components/users.vue").default },
  { path: '/admin/profiles',component: require("../admin-components/profiles.vue").default },
  { path: '/admin/tracks',component: require("../admin-components/tracks.vue").default },
  { path: '/admin/courses',component: require("../admin-components/courses.vue").default },
  { path: '/admin/lessons',component: require("../admin-components/lessons.vue").default },
  { path: '/admin/exams',component: require("../admin-components/exams.vue").default },
  { path: '/admin/questions',component: require("../admin-components/questions.vue").default },
  { path: '/admin/articles',component: require("../admin-components/articles.vue").default },
  { path: '/admin/comments',component: require("../admin-components/comments.vue").default },
  { path: '/admin/replies', component: require("../admin-components/replies.vue").default },
  { path: '/admin/course-achivments',component: require("../admin-components/course-achivments.vue").default },
  { path: '/admin/course-details',component: require("../admin-components/course-details.vue").default },
  { path: '/admin/track-achivments',component: require("../admin-components/track-achivments.vue").default },
  { path: '/admin/suggestions',component: require("../admin-components/suggestions.vue").default },
  { path: '/admin/watch-later',component: require("../admin-components/watch-later.vue").default },
  { path: '/admin/user-profiles',component: require("../admin-components/user-profiles.vue").default },
  { path: '/admin/user-tracks',component: require("../admin-components/user-tracks.vue").default },
  { path: '/admin/user-courses',component: require("../admin-components/user-courses.vue").default },
  { path: '/admin/user-lessons',component: require("../admin-components/user-lessons.vue").default },
  { path: '/admin/user-exams',component: require("../admin-components/user-exams.vue").default },
  { path: '/admin/user-course-achivment',component: require("../admin-components/user-course-achivment.vue").default },
  { path: '/admin/user-track-achivment',component: require("../admin-components/user-track-achivment.vue").default },
  { path: '*',component: require("../components/Error/NotFound.vue").default }
]

const router = new VueRouter({
  mode: 'history',
  routes,
  scrollBehavior (to, from, savedPosition) {
    return { x: 0, y: 0 }
  } 
})

//Vue.component('example-component', require('../components/ExampleComponent.vue').default);

const app = new Vue({
    el: '#app',
    router
});
