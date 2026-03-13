#!/bin/bash
# 🌟 EarnPaisaToday All-in-One Setup + Deploy Script for Termux

BASE_DIR=~/EarnPaisaToday

echo "🚀 Starting full EarnPaisaToday setup..."

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
  <link rel="stylesheet" href='../assets/css/style.css'>
</head>
<body>
  <h1>$page page</h1>
</body>
</html>
EOL
done

# 5️⃣ Create sample CSS file
echo "🎨 Creating CSS..."
cat <<EOL > $BASE_DIR/assets/css/style.css
body { font-family: Arial, sans-serif; background: #f8f8f8; margin: 0; padding: 20px; }
h1 { color: #333; text-align: center; }
EOL

# 6️⃣ Create Firebase config JS
echo "🔧 Creating Firebase config..."
cat <<EOL > $BASE_DIR/assets/js/firebase.js
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
EOL

# 7️⃣ Create empty JS files for other modules
echo "📜 Creating JS files..."
js_files=(auth dashboard offers referral withdraw admin spin videos)
for file in "${js_files[@]}"; do
    touch $BASE_DIR/assets/js/$file.js
done

# 8️⃣ Create sample data file
echo "💾 Creating offers.json..."
cat <<EOL > $BASE_DIR/assets/data/offers.json
[]
EOL

# 9️⃣ Firebase init & deploy
cd $BASE_DIR
echo "🔑 Login to Firebase (interactive)..."
firebase login

if [ ! -f "$BASE_DIR/firebase.json" ]; then
    echo "⚡ Initializing Firebase Hosting..."
    firebase init hosting --project earnpaisatoday --public public --single --non-interactive
fi

echo "🚀 Deploying to Firebase Hosting..."
firebase deploy --only hosting

echo "✅ All done! Check live site at: https://earnpaisatoday.web.app or https://earnpaisatoday.firebaseapp.com"
