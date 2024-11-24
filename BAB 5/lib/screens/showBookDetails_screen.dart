import 'package:babv/fetch/getBookById.dart';
import 'package:babv/models/book.dart';
import 'package:babv/screens/updateBook_screen.dart';
import 'package:flutter/material.dart';

class BookDetailPage extends StatefulWidget {
  final String bookId;
  final VoidCallback onBookUpdated;

  const BookDetailPage({required this.bookId, required this.onBookUpdated, super.key});

  @override
  _BookDetailPageState createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  late Future<Book> _bookFuture;

  @override
  void initState() {
    super.initState();
    _bookFuture = fetchBookById(widget.bookId);
  }

  void _refreshBook() {
    setState(() {
      _bookFuture = fetchBookById(widget.bookId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Buku'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, true); // Kembali ke halaman sebelumnya
          },
        ),
      ),
      body: FutureBuilder<Book>(
        future: _bookFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final book = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(book.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(book.author, style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 16),
                Text(book.description),
                const SizedBox(height: 16),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditBookPage(
                              book: book,
                              onBookUpdated: () {
                                _refreshBook(); // Refresh data setelah edit.
                              },
                            ),
                          ),
                        );
                      },
                      child: const Text('Edit'),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
