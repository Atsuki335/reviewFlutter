import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccessTokenNotifier extends StateNotifier<String?> {
  AccessTokenNotifier() : super(null);

  void setToken(String accessToken) {
    state = accessToken;
  }
}

final AccessTokenProvider =
    StateNotifierProvider<AccessTokenNotifier, String?>((ref) {
  return AccessTokenNotifier();
});
