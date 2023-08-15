import 'package:chapter4/access_token_provider.dart';
import 'package:chapter4/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:chapter4/github_login.dart';
import 'github_oauth_credentials.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(
    child: App(),
  ));
}

class App extends ConsumerStatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final accessToken = await SecureStorage.getAccessToken();
      if (accessToken != null) {
        final AccessTokenNotifier = ref.read(accessTokenProvider.notifier);
        AccessTokenNotifier.setToken(accessToken);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GitHub Client',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(
          title:
              'GitHub Client'), //const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return GithubLogin(
        builder: (context, httpClient) {
          return Scaffold(
            appBar: AppBar(title: Text(title)),
            body: const Center(child: Text('You are logged in to GitHub!')),
          );
        },
        githubClientId: githubClientId,
        githubClientSecret: githubClientSecret,
        githubScopes: githubScopes);
  }
}
