import admin = require('firebase-admin');
import { applicationDefault } from 'firebase-admin/app';

admin.initializeApp({
  credential: applicationDefault(),
});

export default admin;

