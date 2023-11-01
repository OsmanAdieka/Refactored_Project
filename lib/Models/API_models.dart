// //Inisialisasi kelas untuk data API
// class Welcome {
//   late int userId;
//   late int id;
//   late String title;
//   late bool completed;

//   Welcome({
//     required this.userId,
//     required this.id,
//     required this.title,
//     required this.completed,
//   });

// //Mengambil data API dari JSON sesuai template
//   factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
//         userId: json["userId"],
//         id: json["id"],
//         title: json["title"],
//         completed: json["completed"],
//       );

//   Map<String, dynamic> toJson() => {
//         "userId": userId,
//         "id": id,
//         "title": title,
//         "completed": completed,
//       };
// }

class Book {
  final String title;
  final String imageUrl;
  final String description;
  final String publisher;
  final int weeksOnList;
  final String author;
  final String amazonUrl;

  Book({
    required this.title, 
    required this.imageUrl, 
    required this.description, 
    required this.publisher, 
    required this.weeksOnList, 
    required this.author, 
    required this.amazonUrl
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: json['title'],
      imageUrl: json['book_image'],
      description: json['description'],
      publisher: json['publisher'], 
      weeksOnList: json['weeks_on_list'], 
      author: json['author'], 
      amazonUrl: json['amazon_product_url']
    );
  }
}