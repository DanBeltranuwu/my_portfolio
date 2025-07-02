import 'package:cloud_firestore/cloud_firestore.dart';
import '../data/social_networks.dart';

class SocialNetworksService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static const String _collectionName = 'social_networks';

  /// Fetch social networks from Firestore
  static Future<List<SocialNetwork>> getSocialNetworks() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
          .collection(_collectionName)
          .orderBy('order', descending: false)
          .get();

      return snapshot.docs
          .map((QueryDocumentSnapshot<Map<String, dynamic>> doc) {
        Map<String, dynamic> data = doc.data();
        return SocialNetwork(
          name: data['name'] ?? '',
          url: data['url'] ?? '',
          icon: data['icon'] ?? 'link',
          color: data['color'] ?? '#666666',
        );
      }).toList();
    } on Exception catch (e) {
      print('Error fetching social networks: $e');
      // Return empty list or fallback to static data
      return <SocialNetwork>[];
    }
  }

  /// Add a new social network to Firestore
  static Future<void> addSocialNetwork(SocialNetwork network) async {
    try {
      await _firestore.collection(_collectionName).add(<String, dynamic>{
        'name': network.name,
        'url': network.url,
        'icon': network.icon,
        'color': network.color,
        'order': DateTime.now().millisecondsSinceEpoch,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } on Exception catch (e) {
      print('Error adding social network: $e');
      rethrow;
    }
  }

  /// Update an existing social network
  static Future<void> updateSocialNetwork(
    String documentId,
    SocialNetwork network,
  ) async {
    try {
      await _firestore
          .collection(_collectionName)
          .doc(documentId)
          .update(<Object, Object?>{
        'name': network.name,
        'url': network.url,
        'icon': network.icon,
        'color': network.color,
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } on Exception catch (e) {
      print('Error updating social network: $e');
      rethrow;
    }
  }

  /// Delete a social network
  static Future<void> deleteSocialNetwork(String documentId) async {
    try {
      await _firestore.collection(_collectionName).doc(documentId).delete();
    } on Exception catch (e) {
      print('Error deleting social network: $e');
      rethrow;
    }
  }

  /// Stream social networks for real-time updates
  static Stream<List<SocialNetwork>> getSocialNetworksStream() =>
      _firestore.collection(_collectionName).snapshots().map(
            (QuerySnapshot<Map<String, dynamic>> snapshot) => snapshot.docs
                .map((QueryDocumentSnapshot<Map<String, dynamic>> doc) {
              Map<String, dynamic> data = doc.data();
              return SocialNetwork(
                name: data['name'] ?? '',
                url: data['url'] ?? '',
                icon: data['icon'] ?? 'link',
                color: data['color'] ?? '#666666',
              );
            }).toList(),
          );
}
