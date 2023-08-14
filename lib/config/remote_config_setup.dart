import 'package:firebase_remote_config/firebase_remote_config.dart';

class AppUrls {
  static String? showBgImage;
}

Future<void> remoteConfig() async {
  final remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.setConfigSettings(RemoteConfigSettings(fetchTimeout: const Duration(minutes: 1), minimumFetchInterval: const Duration(hours: 1)));
  await remoteConfig.fetchAndActivate();

  AppUrls.showBgImage = remoteConfig.getString('SHOW_BG_IMAGE');
  print(AppUrls.showBgImage);
  return;
}