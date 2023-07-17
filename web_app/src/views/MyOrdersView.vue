<template>
  <div class="ordersview">
    <h1>My Orders</h1>
    <ul v-if="orders">
      <li v-for="order in orders" :key="order.id">
        <h3>Order ID: {{ order.id }}</h3>
        <h3>Order Date: {{ order.order_date }}</h3>
        <h3>Total Amount: {{ order.total_amount }}</h3>
        <h3 v-if="order.processed"> / Processed </h3>
        <h3 v-else> / Processing </h3>
        <ul>
          <li v-for="item in order.order_items" :key="item.id">
            <p>Product ID: {{ item.product_id }}</p>
            <p>Quantity: {{ item.quantity }}</p>
            <p>Price: {{ item.price }}</p>
          </li>
        </ul>
      </li>
    </ul>
    <p v-else>You have no orders</p>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      orders: [],
      products: [],
      product: {},
    };
  },
  computed: {
    userId() {
      return this.$store.state.userid;
    }
  },
  mounted() {
    this.fetchOrders(this.userId);
  },
  methods: {
    fetchOrders(UserId) {
      const apiUrl = `http://127.0.0.1:5000/api/orders/${UserId}`;
      axios
        .get(apiUrl)
        .then((response) => {
          this.orders = response.data;
        })
        .catch((error) => {
          console.error('Error fetching orders:', error);
        });
    },
  },
};
</script>


<style>
.ordersview {
  position: relative;
  top: 150px;
  display: flex;
  flex-wrap: wrap;
  text-align: center;
  margin: auto;
  width: 50%;
  padding: 20px;
  border: 1px solid #ccc;
  border-radius: 10px;
  background-color: whitesmoke;
}

.ordersview li{
  display: flex;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  grid-gap: 10px; 
}
</style>