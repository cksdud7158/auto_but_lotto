<template>
  <q-layout view="lHh Lpr lFf">
    <q-header elevated>
      <q-toolbar>
        <q-btn
          flat
          dense
          round
          icon="menu"
          aria-label="Menu"
          @click="toggleLeftDrawer"
        />

        <q-toolbar-title>
          Auto buy Lotto
        </q-toolbar-title>

        <div>로그인 사용자</div>
      </q-toolbar>
    </q-header>

    <MainDrawer :propLeftDrawerOpen='leftDrawerOpen'  @DrawerClose='toggleLeftDrawer' />

    <q-page-container>
      <router-view />
    </q-page-container>
  </q-layout>
</template>

<script setup lang="ts">
import { ref } from 'vue';
import MainDrawer from 'components/MainLayout/MainDrawer.vue';




const leftDrawerOpen = ref(false)

const toggleLeftDrawer=()=> {
  leftDrawerOpen.value = !leftDrawerOpen.value
}
</script>
