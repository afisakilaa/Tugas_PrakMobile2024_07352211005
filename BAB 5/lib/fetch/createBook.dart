import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> addBook(String title, String author, String description) async {
  final response = await http.post(
    Uri.parse('https://events.hmti.unkhair.ac.id/api/books'),
    headers: {'Content-Type': 'application/json'},
    body: json.encode({'title': title, 'author': author, 'description': description}),
  );
  if (response.statusCode != 201) {
    throw Exception('Gagal menambahkan buku');
  }
}