import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccessTokenNotifier extends StateNotifier<String?> {
  AccessTokenNotifier() : super(null);

  void setToken(String accessToken) {
    state = accessToken;
  }
}

final accessTokenProvider =
    StateNotifierProvider<AccessTokenNotifier, String?>((ref) {
  return AccessTokenNotifier();
});
