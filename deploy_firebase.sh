#!/bin/bash

# 🌐 EarnPaisaToday Firebase Hosting Deploy Script
BASE_DIR=~/EarnPaisaToday

echo "🚀 Starting Firebase Hosting setup..."

# 1️⃣ Install Node.js & npm (agar Termux me installed nahi)
if ! command -v node &> /dev/null
then
    echo "📦 Installing Node.js..."
    pkg install nodejs -y
fi

# 2️⃣ Install Firebase CLI globally
if ! command -v firebase &> /dev/null
then
    echo "⚡ Installing Firebase CLI..."
    npm install -g firebase-tools
fi

# 3️⃣ Login to Firebase
echo "🔑 Login to your Firebase account..."
firebase login

# 4️⃣ Initialize Firebase Hosting (agar firebase.json nahi hai)
if [ ! -f "$BASE_DIR/firebase.json" ]; then
    cd $BASE_DIR
    firebase init hosting --project earnpaisatoday --public public --single --non-interactive
fi

# 5️⃣ Deploy to Firebase Hosting
cd $BASE_DIR
echo "🚀 Deploying to Firebase Hosting..."
firebase deploy --only hosting

echo "✅ Deployment complete!"
echo "🌐 Check your live site at: https://earnpaisatoday.web.app or https://earnpaisatoday.firebaseapp.com"
