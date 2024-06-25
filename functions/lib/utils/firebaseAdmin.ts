import admin = require('firebase-admin');
import { applicationDefault } from 'firebase-admin/app';
import { getAuth } from 'firebase-admin/auth';
import { getMessaging } from 'firebase-admin/messaging';

admin.initializeApp({
  credential: applicationDefault(),
  databaseURL: "https://bioni-avocado.firebaseio.com"
});

const db = admin.firestore();

export { admin, db, getAuth, getMessaging };
