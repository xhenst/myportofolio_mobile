import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/screens/menu.dart';
import 'package:myportofolio_mobile/services/api_client.dart';
import 'package:myportofolio_mobile/services/auth_state.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp(apiClient: ApiClient()));
}

class MyApp extends StatelessWidget {
  const MyApp({this.apiClient, super.key});

  final ApiClient? apiClient;

  @override
  Widget build(BuildContext context) {
    final client = apiClient ?? ApiClient();
    return MultiProvider(
      providers: [
        Provider<ApiClient>.value(value: client),
        ChangeNotifierProvider(
          create: (_) => AuthState(client),
        ),
      ],
      child: MaterialApp(
        title: 'MyPortfolio',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF34304D),
            primary: const Color(0xFF34304D),
            secondary: const Color(0xFF7B61FF),
            tertiary: const Color(0xFFE6E1F9),
          ),
        ),
        home: const MyHomePage(),
      ),
    );
  }
}