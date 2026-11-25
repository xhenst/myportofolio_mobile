import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:myportofolio_mobile/main.dart';
import 'package:myportofolio_mobile/services/api_client.dart';

void main() {
  testWidgets('MyApp renders home screen smoke test', (tester) async {
    final mockClient = MockClient((_) async => http.Response(jsonEncode([]), 200));
    await tester.pumpWidget(
      MyApp(apiClient: ApiClient(client: mockClient, baseUrl: 'http://test.local')),
    );
    expect(find.text('My Portfolio'), findsWidgets);
  });
}