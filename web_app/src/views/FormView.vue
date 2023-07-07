<template>
  <div class="form">
  <SignupForm class="forms"/>
  </div>
</template>

<script>
import SignupForm from '../components/forms/SignupForm.vue';


export default {
  name: 'App',
  components: {
    SignupForm
  },
}

</script>