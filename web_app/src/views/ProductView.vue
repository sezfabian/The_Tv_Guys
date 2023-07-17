<template>
  <div class="product-view">
    <div class="product-image">
      <img :src="product.Image" alt="Product Image" />
    </div>
        <div class="product-details">
            <h2>{{ product.Name }}</h2>
            <h3 class="price">Ksh {{ product.Price }}.00</h3>
            <button @click="addToCart(product)" v-if="!inCart">Add to Cart</button>
            <button @click="removeFromCart" v-if="inCart">Remove from Cart</button>
        </div>
        <div class="buttons">
            <p>{{ product.Description }}</p>
            <p>Warranty: {{ product.Warranty }} Months</p>
        </div>
    </div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'ProductView',
  data() {
    return {
      product: {},
      editedProduct: {},
      inCart: false,
      editMode: false
    };
  },
  created() {
    const productId = this.$route.params.id;
    this.fetchProduct(productId);
  },
  methods: {
    fetchProduct(productId) {
      axios
        .get(`http://127.0.0.1:5000/edit_product/${productId}`)
        .then(response => {
          this.product = response.data;
          console.log(this.product.Name);
        })
        .catch(error => {
          console.error(error);
        });
    },
    // Add product to cart
    addToCart(product) {
      const existingItem = this.$store.state.cartItems.find(item => item.id === product.id);
      if (existingItem) {
        // Item already exists in cart, increment quantity
        this.$store.commit('incrementCartItemQuantity', existingItem.id);
      } else {
        // Item doesn't exist in cart, add as new item
        const cartItem = {
          id: product.id,
          name: product.Name,
          price: product.Price,
          quantity: 1
        };
        this.$store.commit('addToCart', cartItem);
    }
    },
    removeFromCart() {
      this.$store.commit('decrementCartItemQuantity', item.id);
    }
  }
};
</script>

<style>
.product-view {
  position: relative;
  top: 120px;
  padding: 100px 20px;
  display: inline-block;
  flex-direction: column;
  background: white;
  border-radius: 20px;
  width : 60vw;
}


.product-view img {
  width: 50vw;
}

</style>
