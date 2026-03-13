#!/bin/bash

echo "🔥 Creating EarnPaisaToday project structure..."

# Root folder
mkdir -p EarnPaisaToday
cd EarnPaisaToday || exit

# Public pages
mkdir -p public
cd public || exit
for page in index login signup dashboard offers videos spin-wheel withdraw referral leaderboard support settings admin privacy terms about; do
  echo "<!DOCTYPE html>
<html lang='en'>
<head>
  <meta charset='UTF-8'>
  <meta name='viewport' content='width=device-width, initial-scale=1.0'>
  <title>$page | EarnPaisaToday</title>
  <link rel='stylesheet' href='../assets/css/style.css'>
</head>
<body>
  <h1>$page page</h1>
</body>
</html>" > "$page.html"
done
cd ..

# Assets folder
mkdir -p assets/css assets/js assets/data assets/img

# CSS starter file
echo "/* Main stylesheet */" > assets/css/style.css

# Firebase config
echo "// Firebase config
import { initializeApp } from 'firebase/app';
import { getAnalytics } from 'firebase/analytics';

const firebaseConfig = {
  apiKey: 'YOUR_API_KEY',
  authDomain: 'YOUR_PROJECT_ID.firebaseapp.com',
  databaseURL: 'YOUR_DATABASE_URL',
  projectId: 'YOUR_PROJECT_ID',
  storageBucket: 'YOUR_PROJECT_ID.appspot.com',
  messagingSenderId: 'YOUR_SENDER_ID',
  appId: 'YOUR_APP_ID',
  measurementId: 'YOUR_MEASUREMENT_ID'
};

const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);

export default app;" > assets/js/firebase.js

# Starter JS files
for jsfile in auth dashboard offers referral withdraw admin spin videos; do
  echo "// $jsfile.js placeholder" > "assets/js/$jsfile.js"
done

# Placeholder JSON
echo "[]" > assets/data/offers.json

# Firebase config files
echo "{ \"hosting\": { \"public\": \"public\" } }" > firebase.json
echo "{ \"projects\": { \"default\": \"YOUR_PROJECT_ID\" } }" > .firebaserc

# Package.json
echo "{
  \"name\": \"EarnPaisaToday\",
  \"version\": \"1.0.0\",
  \"scripts\": {
    \"start\": \"firebase serve\",
    \"deploy\": \"firebase deploy\"
  },
  \"dependencies\": {}
}" > package.json

echo "✅ EarnPaisaToday project created successfully!"
