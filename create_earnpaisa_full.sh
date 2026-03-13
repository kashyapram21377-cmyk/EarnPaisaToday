#!/bin/bash
# 🚀 EarnPaisaToday Full Real App Setup + Firebase Deployment

BASE_DIR=~/EarnPaisaToday

echo "🌟 Starting full EarnPaisaToday setup..."

# 1️⃣ Install Node.js & npm if not installed
if ! command -v node &> /dev/null; then
    echo "📦 Installing Node.js..."
    pkg install nodejs -y
fi

# 2️⃣ Install Firebase CLI if not installed
if ! command -v firebase &> /dev/null; then
    echo "⚡ Installing Firebase CLI..."
    npm install -g firebase-tools
fi

# 3️⃣ Create project folder structure
echo "📂 Creating project folders..."
mkdir -p $BASE_DIR/public
mkdir -p $BASE_DIR/assets/{css,js,data,img}

# 4️⃣ Create HTML pages
echo "📝 Creating HTML files..."
pages=(index login signup dashboard offers videos spin-wheel withdraw referral leaderboard support settings admin privacy terms about)
for page in "${pages[@]}"; do
    cat <<EOL > $BASE_DIR/public/$page.html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>$page | EarnPaisaToday</title>
  <link rel="stylesheet" href="../assets/css/style.css">
</head>
<body>
  <h1>$page page</h1>
  <script type="module" src="../assets/js/firebase.js"></script>
  <script type="module" src="../assets/js/$page.js"></script>
</body>
</html>
EOL
done

# 5️⃣ Create CSS
echo "🎨 Creating CSS..."
cat <<EOL > $BASE_DIR/assets/css/style.css
body { font-family: Arial, sans-serif; background: #f8f8f8; margin:0; padding:0; }
h1 { color: #333; text-align: center; margin-top:50px; }
button { padding:10px 20px; margin:10px; cursor:pointer; }
input { padding:8px; margin:5px; width:200px; }
EOL

# 6️⃣ Firebase config JS
echo "🔧 Creating Firebase config..."
cat <<EOL > $BASE_DIR/assets/js/firebase.js
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
import { getAuth } from "firebase/auth";
import { getDatabase } from "firebase/database";

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

export const app = initializeApp(firebaseConfig);
export const analytics = getAnalytics(app);
export const auth = getAuth(app);
export const database = getDatabase(app);
EOL

# 7️⃣ JS files with basic real code
echo "📜 Creating JS modules..."

# auth.js
cat <<'EOL' > $BASE_DIR/assets/js/auth.js
import { auth } from './firebase.js';
import { createUserWithEmailAndPassword, signInWithEmailAndPassword } from "firebase/auth";

// Signup
export function signup(email, password) {
    createUserWithEmailAndPassword(auth, email, password)
    .then(userCredential => alert("Signup successful!"))
    .catch(error => alert(error.message));
}

// Login
export function login(email, password) {
    signInWithEmailAndPassword(auth, email, password)
    .then(userCredential => alert("Login successful!"))
    .catch(error => alert(error.message));
}
EOL

# dashboard.js
cat <<'EOL' > $BASE_DIR/assets/js/dashboard.js
console.log("Dashboard loaded");
// Here you can fetch user data from Firebase Realtime Database or Firestore
EOL

# offers.js
cat <<'EOL' > $BASE_DIR/assets/js/offers.js
console.log("Offers page loaded");
// You can load offers from offers.json or Firebase
EOL

# referral.js
cat <<'EOL' > $BASE_DIR/assets/js/referral.js
console.log("Referral page loaded");
// Generate referral link using Firebase UID
EOL

# withdraw.js
cat <<'EOL' > $BASE_DIR/assets/js/withdraw.js
console.log("Withdraw page loaded");
// Handle withdraw requests using Firebase Database
EOL

# spin.js
cat <<'EOL' > $BASE_DIR/assets/js/spin.js
console.log("Spin Wheel page loaded");
// Implement spin wheel logic
EOL

# videos.js
cat <<'EOL' > $BASE_DIR/assets/js/videos.js
console.log("Videos page loaded");
// Load video links from Firebase or JSON
EOL

# create empty JS for other pages
for file in leaderboard support settings admin index signup login about privacy terms; do
    touch $BASE_DIR/assets/js/$file.js
done

# 8️⃣ Sample data file
echo "💾 Creating offers.json..."
cat <<EOL > $BASE_DIR/assets/data/offers.json
[
  {"id":1,"title":"Offer 1","reward":10},
  {"id":2,"title":"Offer 2","reward":20}
]
EOL

# 9️⃣ Firebase Hosting init & deploy
cd $BASE_DIR
echo "🔑 Login to Firebase (interactive)..."
firebase login

if [ ! -f "$BASE_DIR/firebase.json" ]; then
    echo "⚡ Initializing Firebase Hosting..."
    firebase init hosting --project earnpaisatoday --public public --single --non-interactive
fi

echo "🚀 Deploying to Firebase Hosting..."
firebase deploy --only hosting

echo "✅ All done! Live site: https://earnpaisatoday.web.app"
