import { createStore } from 'vuex';

export default createStore({
  state() {
    return {
      cartItems: [],
      totalItems: 0,
      userid: null,
      username: null,
      usermail: null,
    };
  },
  mutations: {
    addToCart(state, item) {
      state.cartItems.push(item);
      state.totalItems++;
    },
    clearCartItems(state) {
      state.cartItems = [];
      state.totalItems = 0;
    },
    incrementCartItemQuantity(state, itemId) {
        const cartItem = state.cartItems.find(item => item.id === itemId);
        if (cartItem) {
          cartItem.quantity++;
          state.totalItems++;
        }
    },
    decrementCartItemQuantity(state, itemId) {
        const cartItem = state.cartItems.find(item => item.id === itemId);
        const index = state.cartItems.findIndex(item => item.id === itemId);
        if (cartItem) {
          if (cartItem.quantity === 1){
            state.cartItems.splice(index,1);
            state.totalItems--;
          }
          else{
            cartItem.quantity--;
            state.totalItems--;
          }
        }
    },
    setUser(state, payload) {
      console.log(payload.id, payload.username, payload.usermail);
      state.userid = payload.id;
      state.username = payload.username;
      state.usermail = payload.usermail;
    },
  }
});
