<template>
  <nav>
    <img src="./assets/logo.png" class="logo" alt="logo">
    <router-link to="/" v-if="isWideScreen">Home</router-link> 
    <router-link to="/about" v-if="isWideScreen">About Us</router-link>
    <router-link to="/about" v-if="isWideScreen">Store</router-link>
    <div  class="cart">
      <p>{{ this.$store.state.totalItems }}</p>
      <img class="icon" @click="handleCart()" src="./assets/icons/cart-shopping-solid.svg"/> 
      <Cart v-if="showCart"/>
    </div>
    <a  v-if="isWideScreen" @click="handleLogIn">Log In</a>
  </nav>
  <LoginForm v-if="showLogin"/>
  <router-view/>
</template>

<script>
import { ref, onMounted, onBeforeUnmount } from "vue";
import Hamburger from './components/Hamburger.vue';
import SignupForm from './components/forms/SignupForm.vue';
import LoginForm from './components/forms/LoginForm.vue';
import Cart from './components/Cart.vue';

export default {
  name: 'App',
  components: {
    Hamburger, SignupForm, Cart, LoginForm
  },
  setup() {
    const isWideScreen = ref(true);
    const showLogin = ref(false);
    const showCart = ref(false);

    const handleResize = () => {
      isWideScreen.value = window.innerWidth > 1080; // Adjust the width condition here as well
    };

    const checkScreenWidth = () => {
      isWideScreen.value = window.innerWidth > 1080; // Adjust the width condition here as well
    };

    onMounted(() => {
      window.addEventListener('resize', handleResize);
      checkScreenWidth(); // Check screen width on component load
    });

    onBeforeUnmount(() => {
      window.removeEventListener('resize', handleResize);
    });

    return {
      isWideScreen, showLogin, showCart
    };
  },
  methods: {
    handleLogIn() {
      console.log('click')
      this.showLogin = !this.showLogin
    },
    handleCart() {
      this.showCart = !this.showCart
    }
  }
};
</script>


<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@100;300;400;800&display=swap');


#app {
  font-family: Poppins, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

body {
  background-image: url("./assets/background.jpg");
  background-repeat: no-repeat;
  background-size: cover;
  width: 100vw;
  overflow-y: scroll; /* Only show vertical scrollbar */
  overflow-x: hidden; /* Hide horizontal scrollbar */
}

.icon {
  width: 60px;
  height: 25px;
  filter: brightness(0) invert(1);
}
nav {
  position: fixed;
  padding: 20px;
  padding-inline-start: 0;
  justify-content: space-between;
  align-items: center;
  width: 80vw;
  display: flex;
  top: -4%;
  z-index: 10000;
  margin: 0px 10vw;
  background-color: rgba(1, 7, 36, 0.788);
  border-radius: 10px;
}

@media screen and (max-width: 1080px) {
  nav {
    left: -8.5%;
    width: 95vw;
  }

}

nav .logo{
  width: 200px;
  filter: brightness(0) invert(1);
}

nav a {
  font-weight: bold;
  color: #ffffff;
  padding-top: 20px;
  text-decoration: none;
  cursor: pointer;
}

nav a.router-link-exact-active {
  color: crimson;
  text-decoration: none;
}

.hamburger {
  padding-top: 25px;
    padding-left: 1.5rem;
}

.hamburger a {
    padding: 0;
    width: 57px;
    height: 57px;
    display: flex;
    justify-content: center;
    align-items: center;
    border-radius: 50%;
    background-color: grey;
    backdrop-filter: blur(10px);
    -webkit-backdrop-filter: blur(10px);
}

.hamburger .bar{
    position: relative;
    width: 52px;
    height: 3px;
    border-radius: 2px;
    background-color: white;
}

.hamburger .bar::before, .hamburger .bar::after{
    content: "";
    position: absolute;
    left: 50%;
    transform: translateX(-50%);
    width: 60%;
    height: 100%;
    background-color: inherit;
    border-radius: 2px;
}

.hamburger .bar::before{
    top: -9.5px;
}
.hamburger .bar::after{
    top: 10.5px;
}

.cart {
  padding-top: 10px;
  padding-bottom: 0px;
  color: white;
}
.cart p{
  padding-top: 0px;
}

.forms {
  padding-top: 100px;
  display: relative;
}

.products {
  z-index: 1000;
}

</style>
