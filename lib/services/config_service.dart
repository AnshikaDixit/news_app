import 'package:firebase_remote_config/firebase_remote_config.dart';

void fetchRemoteConfig() async {
  final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;

  // Set default values
  await remoteConfig.setDefaults(<String, dynamic>{
    'country_code': 'US', // Default country code
  });

  try {
    await remoteConfig.fetchAndActivate();
    String countryCode = remoteConfig.getString('country_code');
    print('Country code: $countryCode');
  } catch (e) {
    print('Failed to fetch remote config: $e');
  }
}
