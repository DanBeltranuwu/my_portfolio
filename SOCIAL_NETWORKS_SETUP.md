# Social Networks Bottom Bar Setup

## Overview
Your portfolio now includes a beautiful bottom bar that displays your social network links for easy contact. The bottom bar is fully customizable and responsive.

## Customization

### 1. Edit Social Networks
Open `lib/data/social_networks.dart` and update the `networks` list with your actual social network information:

```dart
static const List<SocialNetwork> networks = [
  SocialNetwork(
    name: 'LinkedIn',
    url: 'https://linkedin.com/in/YOUR_ACTUAL_PROFILE',
    icon: 'link',
    color: '#0077B5',
  ),
  SocialNetwork(
    name: 'GitHub',
    url: 'https://github.com/YOUR_ACTUAL_USERNAME',
    icon: 'code',
    color: '#333333',
  ),
  SocialNetwork(
    name: 'Email',
    url: 'mailto:your.actual.email@example.com',
    icon: 'email',
    color: '#EA4335',
  ),
  // Add more networks as needed...
];
```

### 2. Available Icons
You can use any of these icon names:
- `link` - LinkedIn icon
- `code` - GitHub icon
- `email` - Email icon
- `telegram` - Telegram icon
- `flutter_dash` - Twitter/X icon
- `web` - Website icon
- `person` - Person icon
- `work` - Work icon
- `school` - Education icon
- `chat` - Chat icon
- `phone` - Phone icon
- `location_on` - Location icon

### 3. Colors
Use hex color codes (e.g., '#0077B5' for LinkedIn blue). The colors will be automatically parsed and applied to the icons.

### 4. Adding New Networks
To add a new social network:

1. Add a new `SocialNetwork` object to the list
2. If you need a custom icon, add it to the `_getIconData` method in `lib/widgets/social_bottom_bar.dart`

## Features

- **Responsive Design**: The bottom bar adapts to different screen sizes
- **Hover Effects**: Icons have subtle hover animations
- **Tooltips**: Hover over icons to see network names
- **External Links**: Clicking icons opens links in external browser
- **Email Support**: Email links open the default email client
- **Customizable**: Easy to add, remove, or modify networks

## Styling

The bottom bar uses your app's theme colors and includes:
- Subtle shadows and borders
- Rounded corners
- Color-coded icons
- Consistent spacing and typography

## Example Customization

Here's an example with real social networks:

```dart
static const List<SocialNetwork> networks = [
  SocialNetwork(
    name: 'LinkedIn',
    url: 'https://linkedin.com/in/daniel-beltran-dev',
    icon: 'link',
    color: '#0077B5',
  ),
  SocialNetwork(
    name: 'GitHub',
    url: 'https://github.com/danielbeltran',
    icon: 'code',
    color: '#333333',
  ),
  SocialNetwork(
    name: 'Email',
    url: 'mailto:daniel@example.com',
    icon: 'email',
    color: '#EA4335',
  ),
  SocialNetwork(
    name: 'Portfolio',
    url: 'https://danielbeltran.dev',
    icon: 'web',
    color: '#4A4E69',
  ),
];
```

## Troubleshooting

- **Links not opening**: Make sure the URLs are valid and include the protocol (https://, mailto:, etc.)
- **Icons not showing**: Check that the icon name is one of the supported options
- **Colors not working**: Ensure color codes are in hex format (e.g., '#FF0000') 