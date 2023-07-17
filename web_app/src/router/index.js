import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import FormView from '../views/FormView.vue'
import ProductView from '../views/ProductView.vue'
import MyOrdersView from '../views/MyOrdersView.vue'

const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView
  },
  {
    path: '/about',
    name: 'about',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/AboutView.vue')
  },
  {
    path: '/form',
    name: 'form',
    component: FormView
  },
  {
    path: '/product/:id', 
    name: 'ProductView',
    component: ProductView,
  },
  {
    path: '/myorders',
    name: 'MyOrdersView',
    component: MyOrdersView
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
