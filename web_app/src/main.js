import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import 'vue3-carousel/dist/carousel.css'
import { Carousel, Slide, Pagination, Navigation } from 'vue3-carousel'
import store from './store';

const app = createApp(App);

app.use(store);
app.use(router);
app.component('Carousel', Carousel);
app.component('Slide', Slide);
app.component('Pagination', Pagination);
app.component('Navigation', Navigation);

app.mount('#app');