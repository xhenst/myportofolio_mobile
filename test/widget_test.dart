import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:myportofolio_mobile/main.dart';
import 'package:myportofolio_mobile/screens/menu.dart';
import 'package:myportofolio_mobile/services/api_client.dart';

void main() {
  testWidgets('MyApp renders home screen smoke test', (tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(tester.view.resetPhysicalSize);

    final mockClient = MockClient((_) async => http.Response(jsonEncode([]), 200));
    await tester.pumpWidget(
      MyApp(apiClient: ApiClient(client: mockClient, baseUrl: 'http://test.local')),
    );

    expect(find.byType(MyHomePage), findsOneWidget);
    expect(find.text('Lihat Proyek'), findsOneWidget);
  });
}