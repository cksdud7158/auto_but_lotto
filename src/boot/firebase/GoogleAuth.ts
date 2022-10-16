import {
  getAuth,
  GoogleAuthProvider,
  signInWithRedirect,
  onAuthStateChanged,
  setPersistence,
  browserSessionPersistence,
} from 'firebase/auth';
import { FirebaseApp } from '@firebase/app';
import { Auth } from '@firebase/auth';
import { useAdminStore } from 'stores/admin';

export class GoogleAuth {
  private app = {} as FirebaseApp;
  private googleAuthProvider = new GoogleAuthProvider();
  private auth = {} as Auth;

  private static _instance: GoogleAuth;

  //싱글톤 패턴
  static get Instance(): GoogleAuth {
    return this._instance || (this._instance = new this());
  }

  //싱글톤 패턴
  private constructor() {
    return;
  }

  async init(firebaseApp: FirebaseApp) {
    this.app = firebaseApp;
    this.auth = getAuth(firebaseApp);
    this.auth.useDeviceLanguage();
    const adminStore = useAdminStore();

    await onAuthStateChanged(this.auth, async (user) => {
      if (!user) {
        // provider 초기화
        this.googleAuthProvider.setCustomParameters({
          prompt: 'select_account',
        });
        this.googleAuthProvider.addScope('email');
        return;
      }

      console.log(user);
      // adminStore.admin = user;
    });
  }

  async signInWithRedirect() {
    try {
      // 세션
      await setPersistence(this.auth, browserSessionPersistence);
      await signInWithRedirect(this.auth, this.googleAuthProvider);
    } catch (e) {
      console.log(e);
    }
  }
}
