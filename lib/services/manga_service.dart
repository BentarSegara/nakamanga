import 'dart:convert';
import 'package:http/http.dart' as http;

class MangaService {
  static String baseUrl = '192.168.0.101:3000';

  static Future<List<dynamic>> getManga(String sort) async {
    final Uri url = Uri.http(baseUrl, '/api/manga', {"sort": sort});

    try {
      final response = await http.get(url);
      final Map<String, dynamic> jsonResponse = json.decode(response.body);

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonResponse['data'];
        return data;
      } else {
        throw ("${jsonResponse['error']}");
      }
    } catch (e) {
      throw ("Gagal mengambil data: $e");
    }
  }
}
