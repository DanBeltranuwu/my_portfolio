# Firebase Setup for Social Networks

This guide will help you set up Firebase to use the social networks feature in your portfolio app.

## Prerequisites

1. A Firebase project (create one at https://console.firebase.google.com/)
2. Flutter SDK installed
3. Firebase CLI installed (`npm install -g firebase-tools`)

## Setup Steps

### 1. Install Dependencies

Run the following command to install the required Firebase packages:

```bash
flutter pub get
```

### 2. Configure Firebase for Web

1. Go to your Firebase Console
2. Select your project
3. Go to Project Settings > General
4. Scroll down to "Your apps" section
5. Click on the web app icon (</>) to add a web app
6. Register your app with a nickname
7. Copy the Firebase configuration object

### 3. Update Web Configuration

Replace the placeholder in `web/index.html` with your actual Firebase configuration:

```javascript
const firebaseConfig = {
  apiKey: "your-api-key",
  authDomain: "your-project.firebaseapp.com",
  projectId: "your-project-id",
  storageBucket: "your-project.appspot.com",
  messagingSenderId: "123456789",
  appId: "your-app-id"
};
```

### 4. Set Up Firestore Database

1. In Firebase Console, go to Firestore Database
2. Click "Create database"
3. Choose "Start in test mode" for development
4. Select a location for your database

### 5. Create Firestore Collection

1. In Firestore Database, click "Start collection"
2. Collection ID: `social_networks`
3. Add documents with the following structure:

```json
{
  "name": "LinkedIn",
  "url": "https://linkedin.com/in/your-profile",
  "icon": "link",
  "color": "#0077B5",
  "order": 1,
  "createdAt": "2024-01-01T00:00:00Z"
}
```

### 6. Sample Social Networks Data

Here are some sample documents you can add to your `social_networks` collection:

```json
{
  "name": "LinkedIn",
  "url": "https://linkedin.com/in/your-profile",
  "icon": "link",
  "color": "#0077B5",
  "order": 1
}
```

```json
{
  "name": "GitHub",
  "url": "https://github.com/your-username",
  "icon": "code",
  "color": "#333333",
  "order": 2
}
```

```json
{
  "name": "Email",
  "url": "mailto:your.email@example.com",
  "icon": "email",
  "color": "#EA4335",
  "order": 3
}
```

```json
{
  "name": "Telegram",
  "url": "https://t.me/your-username",
  "icon": "telegram",
  "color": "#0088CC",
  "order": 4
}
```

```json
{
  "name": "Portfolio",
  "url": "https://your-portfolio-website.com",
  "icon": "web",
  "color": "#4A4E69",
  "order": 5
}
```

### 7. Available Icons

The following icon names are supported:
- `link` - LinkedIn, general links
- `code` - GitHub, coding platforms
- `email` - Email
- `telegram` - Telegram
- `flutter_dash` - Twitter/X
- `web` - Portfolio website
- `person` - Personal profiles
- `work` - Work-related links
- `school` - Education links
- `chat` - Chat platforms
- `phone` - Phone number
- `location_on` - Location

### 8. Security Rules

Update your Firestore security rules in `firestore.rules`:

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /social_networks/{document} {
      allow read: if true;  // Anyone can read social networks
      allow write: if false; // Only allow writes through admin panel
    }
  }
}
```

### 9. Deploy Firestore Rules

```bash
firebase deploy --only firestore:rules
```

### 10. Test the Integration

1. Run your Flutter app: `flutter run -d chrome`
2. The social networks should now load from Firestore
3. Any changes you make in the Firestore console will be reflected in real-time

## Troubleshooting

### Common Issues

1. **Firebase not initialized**: Make sure you've added the correct Firebase configuration to `web/index.html`
2. **Permission denied**: Check your Firestore security rules
3. **No data showing**: Verify that your `social_networks` collection exists and has documents
4. **CORS errors**: Make sure your Firebase project is properly configured for web

### Debug Mode

To see detailed error messages, check the browser console (F12) for any Firebase-related errors.

## Next Steps

Once Firebase is set up, you can:
1. Add more social networks through the Firestore console
2. Create an admin panel to manage social networks
3. Add analytics to track which social links are clicked
4. Implement caching for better performance 