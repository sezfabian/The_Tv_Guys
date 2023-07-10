<template>
  <div class="cart">
    <h3>My Cart</h3>
    <ul>
      <li v-for="item in cartItems" :key="item.id">
        {{ item.quantity }} - {{ item.name }} @ {{ item.price }} - Ksh {{ item.quantity * item.price }}
        <button @click="incrementQuantity(item)">+</button>
        <button @click="decrementQuantity(item)">-</button> 
      </li>
    </ul>
     <p>Total Quantity: {{ totalQuantity }}</p>
     <p>Total Cash: Ksh {{ totalCash }}</p>
    <button @click="clearCart">Clear Cart</button>
  </div>
</template>

<script>
export default {
  computed: {
    cartItems() {
      return this.$store.state.cartItems;
    },
    totalQuantity() {
      return this.cartItems.reduce((total, item) => total + item.quantity, 0);
    },
    totalCash() {
      return this.cartItems.reduce((total, item) => total + item.quantity * item.price, 0);
    }
  },
  methods: {
    clearCart() {
      this.$store.commit('clearCartItems');
    },
    incrementQuantity(item) {
      this.$store.commit('incrementCartItemQuantity', item.id);
    },
    decrementQuantity(item) {
      this.$store.commit('decrementCartItemQuantity', item.id);
    }
  }
};
</script>

<style scoped>
.cart {
  position: absolute;
  align-content: space-between;
  top: 130px;
  right: 220px;
  background-color: rgba(1, 7, 36, 0.788);
  border-radius: 10px;
  padding: 10px;
  border: 1px solid #ccc;
  text-decoration: none;
}

.cart li {
    background: white;
    text-decoration-style: none;
    color: black;
    font-size: 20px;
}

button {
  margin-top: 10px;
}
</style>
