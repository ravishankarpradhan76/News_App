import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/news_article.dart';

class ApiService {
  static const String _baseUrl =
      'https://newsdata.io/api/1/news?apikey=pub_71555d506dbb2bcfa27d85f3fcc93d3a22808&language=en';

  Future<List<Results>> fetchNews() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl)).timeout(
            const Duration(seconds: 15),
          );

      if (response.statusCode == 200) {
        final Map<String, dynamic> decoded = json.decode(response.body);
        if (decoded['results'] != null && decoded['results'] is List) {
          final List<dynamic> data = decoded['results'];
          return data
              .whereType<Map<String, dynamic>>()
              .map((jsonItem) => Results.fromJson(jsonItem))
              .toList();
        }
        return [];
      } else if (response.statusCode == 429) {
        throw Exception('API rate limit reached. Please try again later.');
      } else {
        throw Exception('Failed to load news (Code: ${response.statusCode})');
      }
    } catch (e) {
      if (e is Exception) {
        rethrow;
      }
      throw Exception('Unexpected error: ${e.toString()}');
    }
  }
}
