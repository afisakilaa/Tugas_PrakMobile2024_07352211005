import 'package:babv/fetch/createBook.dart';
import 'package:flutter/material.dart';

class AddBookPage extends StatefulWidget {
  final VoidCallback onBookAdded;

  const AddBookPage({required this.onBookAdded, super.key});

  @override
  _AddBookPageState createState() => _AddBookPageState();
}

class _AddBookPageState extends State<AddBookPage> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String author = '';
  String description = '';
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Buku')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Judul Buku'),
                validator: (value) => value!.isEmpty ? 'Judul tidak boleh kosong' : null,
                onSaved: (value) => title = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Penulis'),
                validator: (value) => value!.isEmpty ? 'Penulis tidak boleh kosong' : null,
                onSaved: (value) => author = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Deskripsi'),
                validator: (value) => value!.isEmpty ? 'Deskripsi tidak boleh kosong' : null,
                onSaved: (value) => description = value!,
              ),
              const SizedBox(height: 16),
              isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          setState(() {
                            isLoading = true;
                          });
                          try {
                            await addBook(title, author, description);
                            widget.onBookAdded(); // Panggil callback untuk refresh daftar buku
                            Navigator.pop(context);
                          } catch (e) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Error'),
                                content: Text(e.toString()),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          } finally {
                            setState(() {
                              isLoading = false;
                            });
                          }
                        }
                      },
                      child: const Text('Tambah'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}



