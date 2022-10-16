<template>
  <q-drawer
    v-model="leftDrawerOpen"
    show-if-above
    bordered
  >
    <q-list>
      <q-item-label
        header
      >
        Essential Links
      </q-item-label>

      <q-item
        clickable
        tag="a"
        target="_blank"
      >


        <q-item-section>
          <q-item-label>111</q-item-label>
          <q-item-label caption>111</q-item-label>
        </q-item-section>
      </q-item>
    </q-list>
  </q-drawer>

</template>

<script setup lang='ts'>


import { computed } from 'vue';

const props = defineProps({
  propLeftDrawerOpen:Boolean
})

const emit = defineEmits<{(e:'DrawerClose'):void}>()

const leftDrawerOpen = computed({ get(){
  return props.propLeftDrawerOpen
  }, set(){
    emit('DrawerClose')
  } })


</script>

<style scoped>


</style>
