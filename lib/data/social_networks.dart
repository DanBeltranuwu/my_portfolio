class SocialNetwork {
  const SocialNetwork({
    required this.name,
    required this.url,
    required this.icon,
    required this.color,
  });
  final String name;
  final String url;
  final String icon;
  final String color;
}

class SocialNetworks {
  static const List<SocialNetwork> networks = <SocialNetwork>[
    SocialNetwork(
      name: 'LinkedIn',
      url: 'https://linkedin.com/in/your-profile',
      icon: 'link',
      color: '#0077B5',
    ),
    SocialNetwork(
      name: 'GitHub',
      url: 'https://github.com/your-username',
      icon: 'code',
      color: '#333333',
    ),
    SocialNetwork(
      name: 'Email',
      url: 'mailto:your.email@example.com',
      icon: 'email',
      color: '#EA4335',
    ),
    SocialNetwork(
      name: 'Telegram',
      url: 'https://t.me/your-username',
      icon: 'telegram',
      color: '#0088CC',
    ),
    SocialNetwork(
      name: 'Twitter',
      url: 'https://twitter.com/your-username',
      icon: 'flutter_dash',
      color: '#1DA1F2',
    ),
    SocialNetwork(
      name: 'Portfolio',
      url: 'https://your-portfolio-website.com',
      icon: 'web',
      color: '#4A4E69',
    ),
  ];
}
