import 'dart:convert';
import 'package:babv/models/book.dart';
import 'package:http/http.dart' as http;

Future<List<Book>> fetchBooks() async {
  final response = await http.get(Uri.parse('https://events.hmti.unkhair.ac.id/api/books'));
  if (response.statusCode == 200) {
    final List data = json.decode(response.body);
    return data.map((json) => Book.fromJson(json)).toList();
  } else {
    throw Exception('Gagal memuat daftar buku');
  }
}