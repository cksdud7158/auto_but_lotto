<template>
  <div>
    mainLayout
    <q-btn @click="onLogin">login</q-btn>
  </div>
</template>

<script setup lang="ts">
import { inject } from 'vue';
import { GoogleAuth } from 'boot/firebase/GoogleAuth';
const $auth = inject<GoogleAuth>('$auth');

const onLogin = () => {
  $auth?.signInWithRedirect();
};
</script>
