import 'package:babv/fetch/deleteBook.dart';
import 'package:babv/fetch/getBook.dart';
import 'package:babv/models/book.dart';
import 'package:babv/screens/createBook_screen.dart';
import 'package:babv/screens/showBookDetails_screen.dart';
import 'package:flutter/material.dart';

class BookListPage extends StatefulWidget {
  const BookListPage({super.key});

  @override
  _BookListPageState createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  late Future<List<Book>> books;

  @override
  void initState() {
    super.initState();
    books = fetchBooks();
  }

  void refreshBooks() {
    setState(() {
      books = fetchBooks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Buku'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddBookPage(onBookAdded: refreshBooks)),
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<Book>>(
        future: books,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Tidak ada buku tersedia'));
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final book = snapshot.data![index];
              return ListTile(
                title: Text(book.title),
                subtitle: Text(book.author),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () async {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => const Center(child: CircularProgressIndicator()),
                    );
                    await deleteBook(book.id); // Hapus buku dari server
                    refreshBooks(); // Muat ulang data dari server
                    Navigator.pop(context); // Tutup dialog loading// Perbarui daftar buku setelah dihapus
                  },
                ),
                onTap: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookDetailPage(
                        bookId: book.id,
                        onBookUpdated: refreshBooks,
                      ),
                    ),
                  );

                  // Jika halaman detail mengembalikan `true`, refresh daftar buku
                  if (result == true) {
                    refreshBooks(); // Memuat ulang data setelah edit
                  }
                },
              );
            },
          );
        },
      ),
    );
  }
}