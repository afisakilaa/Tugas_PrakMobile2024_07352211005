import 'package:http/http.dart' as http;

Future<void> deleteBook(String id) async {
  final response = await http.delete(Uri.parse('https://events.hmti.unkhair.ac.id/api/books/$id'));
  if (response.statusCode != 204) {
    throw Exception('Gagal menghapus buku');
  }
}