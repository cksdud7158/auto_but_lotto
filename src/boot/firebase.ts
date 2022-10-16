import { firebaseConfig } from 'app/firebase.config';
import { initializeApp } from 'firebase/app';
import { boot } from 'quasar/wrappers';

import { GoogleAuth } from 'boot/firebase/GoogleAuth';

// firebase 초기화
export const firebaseApp = initializeApp(firebaseConfig);

export default boot(async ({ app }) => {
  await GoogleAuth.Instance.init(firebaseApp);

  app.provide('$auth', GoogleAuth.Instance);
});
