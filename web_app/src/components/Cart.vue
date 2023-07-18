<template>
  <div class="cart">
    <div class='title'>
      <h3> User: {{ user }} Cart Items : {{ totalQuantity }}</h3>
    </div>
    <ul>
      <li v-for="item in cartItems" :key="item.id">
        <p>{{ item.quantity }} x {{ item.name }} @ {{ item.price }} -&nbsp;<span style="color: red;"> <b>Ksh {{ item.quantity * item.price }}</b> </span></p>
        <button @click="incrementQuantity(item)">+</button>
        <button @click="decrementQuantity(item)">-</button> 
      </li>
    </ul>
     <p>Total Cash: Ksh {{ totalCash }}</p>
    <button @click="clearCart">Clear Cart</button>
    <button @click="confirmOrder" v-if="userId">Place Order</button>
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
    },
    user() {
      return this.$store.state.username;
    },
    userId() {
      return this.$store.state.userid;
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
    },
    confirmOrder() {
      const confirmMessage = "Are you sure you want to place this order?";
      if (window.confirm(confirmMessage)) {
        const orderData = {
          user_id: this.userId,
          order_items: this.cartItems.map(item => ({
            product_id: item.id,
            quantity: item.quantity,
            price: item.price
          }))
        };
        // Send the order request to the server
        fetch('http://127.0.0.1:5000/api/orders', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify(orderData)
        })
          .then(response => response.json())
          .then(data => {
            // Handle the response data as needed
            console.log(data);
            // Clear the cart after successful order placement
            this.clearCart();
          })
          .catch(error => {
            console.error(error);
            // Handle the error
          });
      }
    }
  }
};
</script>

<style scoped>
.cart {
  color: black;
  position: absolute;
  align-content: space-between;
  top: 130px;
  right: 220px;
  background-color: whitesmoke;
  border-radius: 10px;
  padding: 10px;
  border: 1px solid #ccc;
  text-decoration: none;
}

.cart li {
    list-style: none;
    color: black;
    font-size: 20px;
}

button {
  margin-top: 0px;
  width: 150px;
  height: 40px;
}
</style>
