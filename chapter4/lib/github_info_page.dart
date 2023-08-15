import 'access_token_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GithubInfoPage extends ConsumerWidget {
  const GithubInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accessToken = ref.watch(accessTokenProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Github"),
      ),
      body: Column(children: [Text(accessToken ?? "トークンが空")]),
    );
  }
}
