class Book {
  final String id;
  final String title;
  final String author;
  final String description;

  Book({required this.id, required this.title, required this.author, required this.description});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id']?.toString() ?? '',
      title: json['title'] ?? 'tidak ada judul',
      author: json['author']?? 'tidak diketahui',
      description: json['description']?? 'tidak ada deskripsi',
    );
  }
}