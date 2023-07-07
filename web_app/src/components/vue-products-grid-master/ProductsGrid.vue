<template>
<div class="container">
  <Grid :length="products.length" :pageSize="10" :pageProvider="pageProvider" class="grid">
    <template v-slot:placeholder="{ style, index }">
      <div class="item" :style="style">
        <img :src="products[index].Image" alt="https://i.postimg.cc/jdCTJHbh/placeholder-image.png" class="product-image" />
        <h2>{{ products[index].Name }}</h2>
        <div class="product-price">Ksh {{ products[index].Price }}</div>
      </div>
    </template>

  </Grid>
</div>
</template>

<script>
import Grid from "vue-virtual-scroll-grid";
import axios from "axios";

export default {
  name: "Home",
  components: { Grid },
  data() {
    return {
      products: []
    };
  },
  methods: {
    // Fetch products from the API
    fetchProducts() {
      axios
        .get("http://127.0.0.1:5000/api/products")
        .then(response => {
          this.products = response.data;
        })
        .catch(error => {
          console.error(error);
        });
    },
    // Return items for the given page
    pageProvider(pageNumber, pageSize) {
      const start = (pageNumber - 1) * pageSize;
      const end = start + pageSize;
      return Promise.resolve(this.products.slice(start, end));
    }
  },
  mounted() {
    this.fetchProducts();
  }
};
</script>

<style scoped>
.container {
  padding-left: 30px;
  display: absolute;
  left: -20%;
  flex-direction: column;
  align-items: center;
  z-index: 100;
}

.grid {
  display: grid;
  align-items: center;
  flex-direction: row;
  grid-gap: 10px;
  grid-template-columns: repeat(1, 1fr);
}

@media (min-width: 768px) {
  .grid {
    grid-template-columns: repeat(2, 1fr);
  }
}
@media (min-width: 992px) {
  .grid {
    grid-template-columns: repeat(2, 1fr);
  }
}
@media (min-width: 1280px) {
  .grid {
    grid-template-columns: repeat(2, 1fr);
  }
}
@media (min-width: 1440px) {
  .grid {
    grid-template-columns: repeat(3, 1fr);
  }
}
@media (min-width: 1650px) {
  .grid {
    grid-template-columns: repeat(3, 1fr);
  }
}
@media (min-width: 1890px) {
  .grid {
    grid-template-columns: repeat(4, 1fr);
  }
}
@media (min-width: 2530px) {
  .grid {
    grid-template-columns: repeat(6, 1fr);
  }
}

.item {
  background-color: lightgray;
  padding: 20px 20px;
  text-align: center;
  width: 400px;
  border-radius: 20px;
  cursor: pointer;
  transition: transform 0.3s ease;
}

.item:hover {
  transform: scale(1.2);
}

.product-item {
  background-color: lightgray;
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 20px;
  text-align: center;
}

.product-image {
  width: 100%;
  max-height: 300px;
  object-fit: contain;
}

.product-details {
  flex-grow: 1;
}

.product-name {
  font-weight: bold;
}

.product-price {
  margin-top: 10px;
}
</style>
