<template>
  <div class="login-form">
    <h2>Login</h2>
    <form @submit.prevent="login">
      <label for="email">Email</label>
      <input type="email" v-model="email" required>
      <label for="password">Password</label>
      <input type="password" v-model="password" required>
      <div v-if="passwordError" class="error">{{ passwordError }}</div>
      <button type="submit">Login</button>
      <p @click="this.$emit('loginFormClosed')">Don't have an account? <router-link to="/form">Sign up</router-link></p>
    </form>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      email: '',
      password: '',
      passwordError: null,
    };
  },
  methods: {
    login() {
      axios.post('http://127.0.0.1:5000/login', {
        email: this.email,
        password: this.password
      })
      .then(response => {
        // Handle successful login
        console.log(response.data);
        this.passwordError = null;
        console.log(response.data['name'])
        this.$store.commit('setUser', {
                     id: response.data['user_id'],
                     username: response.data['name'],
                     usermail: response.data['email']
              });
        this.$emit('loginFormClosed');
      })
      .catch(error => {
        // Handle login error
        console.error(error.response.data);
        this.passwordError = error.response.data['error'];
      });
    },
  }
};
</script>

.<style scoped>
.login-form {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 400px;
    background: white;
    border-radius: 10px;
    box-shadow: 0 2px 3px #ccc;
    padding: 20px;
    z-index: 10200;
}
</style>
