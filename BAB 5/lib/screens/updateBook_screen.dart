import 'package:babv/fetch/updateBook.dart';
import 'package:babv/models/book.dart';
import 'package:flutter/material.dart';


class EditBookPage extends StatefulWidget {
  final Book book;
  final VoidCallback onBookUpdated;

  const EditBookPage({required this.book, required this.onBookUpdated, super.key});

  @override
  _EditBookPageState createState() => _EditBookPageState();
}

class _EditBookPageState extends State<EditBookPage> {
  final _formKey = GlobalKey<FormState>();
  late String title;
  late String author;
  late String description;

  @override
  void initState() {
    super.initState();
    // Isi nilai awal form dengan data buku yang akan diedit
    title = widget.book.title;
    author = widget.book.author;
    description = widget.book.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Buku')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: title,
                decoration: const InputDecoration(labelText: 'Judul Buku'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Judul tidak boleh kosong';
                  }
                  return null;
                },
                onSaved: (value) => title = value!,
              ),
              TextFormField(
                initialValue: author,
                decoration: const InputDecoration(labelText: 'Penulis'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Penulis tidak boleh kosong';
                  }
                  return null;
                },
                onSaved: (value) => author = value!,
              ),
              TextFormField(
                initialValue: description,
                decoration: const InputDecoration(labelText: 'Deskripsi'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Deskripsi tidak boleh kosong';
                  }
                  return null;
                },
                onSaved: (value) => description = value!,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    await updateBook(widget.book.id, title, author, description);
                    widget.onBookUpdated();
                    Navigator.pop(context);
                  }
                },
                child: const Text('Simpan Perubahan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
