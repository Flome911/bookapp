class Book {
  final String? title;
  final String? author;
  final String? ISBN;
  final int? year;

  Book({this.title, this.author, this.ISBN, this.year});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: json["title"]?.toString(),
      author: json["author"]?.toString(),
      ISBN: json["ISBN"]?.toString(),
      year:
          json["year"] is int
              ? json["year"]
              : int.tryParse(json["year"]?.toString() ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
    "title": title,
    "author": author,
    "ISBN": ISBN,
    "year": year,
  };
}
