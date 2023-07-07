<template>
  <form @submit.prevent="registerUser">
    <h2>Register</h2>
    <label for="username">Username:</label>
    <input type="text" id="username" v-model="username" required>

    <label for="email">Email:</label>
    <input type="email" id="email" v-model="email" required>

    <label for="phone">Phone:</label>
    <input type="text" id="phone" v-model="phone" required>

    <label for="address">Address:</label>
    <input type="text" id="address" v-model="address" required>

    <label for="pin">Pin:</label>
    <input type="text" id="pin" v-model="pin" required>

    <label for="date_of_birth">Date of Birth:</label>
    <input type="date" id="date_of_birth" v-model="dateOfBirth" required>

    <label for="password">Password:</label>
    <input type="password" id="password" v-model="password" required>

    <button type="submit">Register</button>
  </form>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      username: '',
      email: '',
      phone: '',
      address: '',
      pin: '',
      dateOfBirth: '',
      password: ''
    };
  },
  methods: {
    registerUser() {
      const formData = {
        username: this.username,
        email: this.email,
        phone: this.phone,
        address: this.address,
        pin: this.pin,
        date_of_birth: this.dateOfBirth,
        password: this.password
      };

      axios.post('http://127.0.0.1:5000/register', formData)
        .then(response => {
          // Handle success response
          console.log(response.data);
          // Redirect to success page or perform further actions
        })
        .catch(error => {
          // Handle error response
          console.error(error);
        });
    }
  }
};
</script>

<style>
button{
  border-radius: 20px;
  width: 100px;
  height: 40px;
  background-color: rgba(1, 7, 36, 0.788);
  color: white;
  align-self: center;
}

</style>
