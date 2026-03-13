import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";

const firebaseConfig = {
  apiKey: "AIzaSyAy7c3QIaASON9BuKjIN8pKjw2mJw43OIQ",
  authDomain: "earnpaisatoday.firebaseapp.com",
  databaseURL: "https://earnpaisatoday-default-rtdb.asia-southeast1.firebasedatabase.app",
  projectId: "earnpaisatoday",
  storageBucket: "earnpaisatoday.firebasestorage.app",
  messagingSenderId: "473043945290",
  appId: "1:473043945290:web:bb051771ca12d5ce60a3b3",
  measurementId: "G-Q9D6B4SFCM"
};

const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);
