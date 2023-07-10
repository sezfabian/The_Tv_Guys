import { createStore } from 'vuex';

export default createStore({
  state() {
    return {
      cartItems: [],
      totalItems: 0
    };
  },
  mutations: {
    addToCart(state, item) {
      state.cartItems.push(item);
    },
    clearCartItems(state) {
      state.cartItems = [];
    },
    incrementCartItemQuantity(state, itemId) {
        const cartItem = state.cartItems.find(item => item.id === itemId);
        if (cartItem) {
          cartItem.quantity++;
        }
    },
    decrementCartItemQuantity(state, itemId) {
        const cartItem = state.cartItems.find(item => item.id === itemId);
        const index = state.cartItems.findIndex(item => item.id === itemId);
        if (cartItem) {
          if (cartItem.quantity === 1){
            state.cartItems.splice(index,1);
          }
          else{
            cartItem.quantity--;
          }
        }
    }

  }
});
