import 'dart:convert';
import 'package:babv/models/book.dart';
import 'package:http/http.dart' as http;

Future<Book> fetchBookById(String id) async {
  final response = await http.get(Uri.parse('https://events.hmti.unkhair.ac.id/api/books/$id'));
  if (response.statusCode == 200) {
    return Book.fromJson(json.decode(response.body));
  } else if (response.statusCode == 404) {
    throw Exception('Buku tidak ditemukan');
  } else {
    throw Exception('Gagal memuat detail buku');
  }
}