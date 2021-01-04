import TurbolinksAdapter from 'vue-turbolinks'
import Vue from 'vue/dist/vue.esm'
import App from '../app.vue'

Vue.use(TurbolinksAdapter)

document.addEventListener('turbolinks:load', () => {
  new Vue ({
    el: '#app',
    data: {
        message: "Can you say hello?"
    },
    components: { App }
  })
})
