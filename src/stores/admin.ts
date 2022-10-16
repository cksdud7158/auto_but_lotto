import { defineStore } from 'pinia';
import { useSessionStorage } from '@vueuse/core';

export const useAdminStore = defineStore('admin', () => {
  const admin = useSessionStorage('admin', {});

  return { admin };
});
