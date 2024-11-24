import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> updateBook(String id, String title, String author, String description) async {
  final response = await http.put(
    Uri.parse('https://events.hmti.unkhair.ac.id/api/books/$id'),
    headers: {'Content-Type': 'application/json'},
    body: json.encode({'title': title, 'author': author, 'description': description}),
  );
  if (response.statusCode != 200) {
    throw Exception('Gagal memperbarui buku');
  }
}