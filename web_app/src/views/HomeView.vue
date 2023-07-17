<template>
  <div class="home">
    <img class="background2" src="../assets/bg2.png">
    <div class="search">
      <input type="text">
      <button>Search</button>
    </div>
  </div>
  <div class="layer"></div>
  <div class="carosel">
    <ProductsCarousel class=products></ProductsCarousel>
  </div>
  <div class="grid">
    <ProductsGrid>
    </ProductsGrid>
  </div>
</template>

<script>
// @ is an alias to /src
import { ref, onMounted } from 'vue';
import axios from 'axios';
import ProductsCarousel from '../components/ProductsCarousel.vue'
import ProductsGrid from '../components/vue-products-grid-master/ProductsGrid.vue'

export default {
  components: {
    ProductsGrid,ProductsCarousel
  },
};
</script>

<style>
.background2{
  position: absolute;
  top: -10%;
  left: 0%;
  height: 65vh;
  z-index: -10;
}
.layer {
  position: absolute;
  top: +50%;
  left: 0;
  width: 100%;
  height: 74vh;
  z-index: -5;
  background-color: white;
  opacity: 1;
  }

 .search {
  display: block;
  position: absolute;
  vertical-align: center;
  top: +35%;
  left: +50%;
  z-index: 2;
 }

 .search input{
  border-radius: 20px;
  width: 500px;
  height: 40px;
  border-color: rgba(1, 7, 36, 0.788);
 }

 .search button{
  border-radius: 20px;
  width: 100px;
  height: 40px;
  background-color: rgba(1, 7, 36, 0.788);
  color: white;
 }

@media screen and (max-width: 1080px) {
  .background2 {
    left: -40%;
    top: -10%;
    z-index: -5;
  }
  .carosel {
    position: absolute;
    padding-top: 300px;
  }
  .search{
    left:+10%;
    top: 40%;
  }
  .search input{
    width: 300px;
  }
}

.carosel{
  position: initial;
  padding-top: 500px;
  height: 30%;
  text-align: left;
}

.header2{
  padding-left: 150px;
  z-index: 100;
}

.grid{
  width:100vw;
  position: initial;
  z-index: 1000;
}
</style>