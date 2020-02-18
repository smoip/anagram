import TurbolinksAdapter from 'vue-turbolinks'
import Vue from 'vue/dist/vue.esm'
import App from '../app.vue'
import axios from 'axios'
import VueAxios from 'vue-axios'

Vue.use(TurbolinksAdapter)
Vue.use(VueAxios, axios)

document.addEventListener('turbolinks:load', () => {
  const app = new Vue({
    el: '#main',
    components: { App }
  })
})
