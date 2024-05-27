import admin = require('firebase-admin');
import { applicationDefault } from 'firebase-admin/app';
import { getAuth } from 'firebase-admin/auth';

admin.initializeApp({
  credential: applicationDefault(),
  databaseURL: "https://bioni-avocado.firebaseio.com"
});

const db = admin.firestore();

export { admin, db, getAuth };
