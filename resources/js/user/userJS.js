require('../bootstrap.js');
require('./user');
window.Vue = require('vue');

import Vue from 'vue'

//youtube embed video api
import VueYouTubeEmbed from 'vue-youtube-embed'
Vue.use(VueYouTubeEmbed)

//nicescroll
// import vueNiceScrollbar from 'vue-nice-scrollbar'
// Vue.use(vueNiceScrollbar)

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

Vue.component('pagination', require('laravel-vue-pagination'));

let routes = [
  //intro routes
  { path: '/Home', component: require("../components/User/Intro/CourseIntro.vue").default },  
  { path: '/ideintro', component: require("../components/User/Intro/IdeIntro.vue").default },
  { path: '/academicintro', component: require("../components/User/Intro/AcademicIntro.vue").default },
  { path: '/communityintro', component: require("../components/User/Intro/CommunityIntro.vue").default },  
  { path: '/examintro', component: require("../components/User/Intro/ExamIntro.vue").default },
  //profile route part
  { path: '/profile', component: require("../components/User/Profile/profile.vue").default },
  { path: '/print/achivment/:aid', component: require("../components/User/Profile/AchivmentPrint.vue").default },
  //browse route part  
  { path: '/browse/courses', component: require("../components/User/courses.vue").default },
  { path: '/browse/course-details/:cid', component: require("../components/User/CourseDetails.vue").default },
  { path: '/browse/playlist/course/:cid/lesson/:lid', component: require("../components/User/LessonsPlaylist.vue").default },
  
   //academic route part
  { path: '/academic/tracks', component: require("../components/User/Academic/tracks.vue").default },
  { path: '/academic/track/:tid/courses', component: require("../components/User/Academic/TrackCourses.vue").default },
  { path: '/academic/playlist/track/:tid/course/:cid/lesson/:lid', component: require("../components/User/Academic/AcademicPlaylist.vue").default },
  //community route part
  { path: '/community/articles', component: require("../components/User/Community/articles.vue").default },
  { path: '/community/articles/track/:tid', component: require("../components/User/Community/TrackArticles.vue").default },
  { path: '/community/article/:aid', component: require("../components/User/Community/ShowArticle.vue").default },
  //exam route part
  { path: '/exams', component: require("../components/User/Exam/exams.vue").default },

  { path: '*', component: require("../components/Error/NotFound.vue").default }
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
