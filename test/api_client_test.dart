import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:myportofolio_mobile/models/project.dart';
import 'package:myportofolio_mobile/services/api_client.dart';

void main() {
  test('getProjects parses JSON list into Project models', () async {
    final mockClient = MockClient((request) async {
      expect(request.url.path, '/api/v1/projects/');
      expect(request.method, 'GET');
      return http.Response(
        jsonEncode([
          {
            'id': '1',
            'title': 'OneNightFit',
            'description': 'Clothing rental platform',
            'tech_stack': 'Django, Flutter',
            'project_url': 'https://github.com/kayla/onenightfit',
            'project_image_url': '',
          }
        ]),
        200,
      );
    });

    final api = ApiClient(client: mockClient, baseUrl: 'http://test.local');
    final projects = await api.getProjects();

    expect(projects.length, 1);
    expect(projects.first.title, 'OneNightFit');
    expect(projects.first.techStack, 'Django, Flutter');
  });

  test('obtainToken returns token string on 200 OK', () async {
    final mockClient = MockClient((request) async {
      expect(request.url.path, '/api/v1/auth/token/');
      expect(request.method, 'POST');
      return http.Response(jsonEncode({'token': 'secret-token-123'}), 200);
    });

    final api = ApiClient(client: mockClient, baseUrl: 'http://test.local');
    final token = await api.obtainToken('kayla', 'password123');

    expect(token, 'secret-token-123');
  });

  test('createProject sends Authorization Token header', () async {
    final mockClient = MockClient((request) async {
      expect(request.url.path, '/api/v1/projects/');
      expect(request.method, 'POST');
      expect(request.headers['Authorization'], 'Token secret-token-123');

      final body = jsonDecode(request.body) as Map<String, dynamic>;
      expect(body.containsKey('id'), isFalse);
      expect(body['title'], 'MyPortfolio');

      return http.Response(
        jsonEncode({
          'id': '2',
          ...body,
        }),
        201,
      );
    });

    final api = ApiClient(client: mockClient, baseUrl: 'http://test.local');
    final created = await api.createProject(
      const Project(
        title: 'MyPortfolio',
        description: 'Personal portfolio',
        techStack: 'Flutter, DRF',
        projectUrl: 'https://github.com/kayla/myportofolio',
      ),
      token: 'secret-token-123',
    );

    expect(created.id, '2');
    expect(created.title, 'MyPortfolio');
  });
}