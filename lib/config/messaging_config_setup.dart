import 'package:firebase_messaging/firebase_messaging.dart';

class MessagingConfig {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();

    print('Token: $fCMToken');
  }
}