import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import 'vue3-carousel/dist/carousel.css'
import { Carousel, Slide, Pagination, Navigation } from 'vue3-carousel'

createApp(App).component('Carousel', Carousel).component('Slide', Slide).component('Pagination', Pagination).component('Navigation', Navigation).use(router).mount('#app')
