import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/social_networks.dart';
import '../services/social_networks_service.dart';

class SocialBottomBar extends StatelessWidget {
  const SocialBottomBar({super.key});

  Future<void> _launchURL(String url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  IconData _getIconData(String iconName) {
    switch (iconName) {
      case 'link':
        return Icons.link;
      case 'code':
        return Icons.code;
      case 'email':
        return Icons.email;
      case 'telegram':
        return Icons.telegram;
      case 'flutter_dash':
        return Icons.flutter_dash;
      case 'web':
        return Icons.web;
      case 'person':
        return Icons.person;
      case 'work':
        return Icons.work;
      case 'school':
        return Icons.school;
      case 'chat':
        return Icons.chat;
      case 'phone':
        return Icons.phone;
      case 'location_on':
        return Icons.location_on;
      default:
        return Icons.link;
    }
  }

  Color _parseColor(String colorHex) {
    try {
      return Color(int.parse(colorHex.replaceAll('#', '0xFF')));
    } on Exception catch (e, _) {
      return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          border: Border(
            top: BorderSide(
              color: Theme.of(context).colorScheme.surface,
              width: 1,
            ),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Connect with me: ',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            StreamBuilder<List<SocialNetwork>>(
              stream: SocialNetworksService.getSocialNetworksStream(),
              builder: (
                BuildContext context,
                AsyncSnapshot<List<SocialNetwork>> snapshot,
              ) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (snapshot.hasError) {
                  return Text(
                    'Error loading social networks: ${snapshot.error}',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  );
                }

                List<SocialNetwork> networks =
                    snapshot.data ?? <SocialNetwork>[];

                if (networks.isEmpty) {
                  return Text(
                    'No social networks found',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  );
                }

                return Wrap(
                  spacing: 12,
                  runSpacing: 8,
                  alignment: WrapAlignment.center,
                  children: networks
                      .map(
                        (SocialNetwork network) => _buildSocialIcon(
                          context,
                          _getIconData(network.icon),
                          network.name,
                          network.url,
                          _parseColor(network.color),
                        ),
                      )
                      .toList(),
                );
              },
            ),
          ],
        ),
      );

  Widget _buildSocialIcon(
    BuildContext context,
    IconData icon,
    String tooltip,
    String url,
    Color color,
  ) =>
      Tooltip(
        message: tooltip,
        child: InkWell(
          onTap: () => _launchURL(url),
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: color.withValues(alpha: 0.3),
                width: 1.5,
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: color.withValues(alpha: 0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Icon(
              icon,
              color: color,
              size: 28,
            ),
          ),
        ),
      );
}
