import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../Models/API_models.dart';

//Inisialisasi kelas controller untuk memanggil API
// class ApiService extends GetxController {
//   RxBool isLoading = true.obs;
//   RxString error = ''.obs;
//   //Menggunakan required untuk memberikan inputan pada GetX agar tidak kosong semisal tidak ada data
//   Rx<Welcome> welcome = Welcome(userId: 0, id: 0, title: '', completed: false).obs;

//   @override
//   void onInit() {
//     super.onInit();
//     fetchDataFromApi();
//   }

//   //Memanggil data dengan JSON dan URL yang ditentukan
//   Future<void> fetchDataFromApi() async {
//     try {
//       final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/5'));

//       if (response.statusCode == 200) {
//         welcome(Welcome.fromJson(json.decode(response.body)));
//       } else {
//         error('Failed to load data');
//       }
//     } catch (e) {
//       error('Failed to load data: $e');
//     } finally {
//       isLoading(false);
//     }
//   }
// }

import 'dart:convert';
import 'package:http/http.dart' as http;

class BooksController {
  final String apiKey;
  final String apiEndpoint;

  BooksController(this.apiKey, this.apiEndpoint);

  Future<List<Book>> fetchBooks() async {
    final nytEndpoint = "https://api.nytimes.com/svc/books/v3/lists/current/hardcover-fiction.json?api-key=EmNpuEG2ky9TrMmGCaxLuZgoTfQ44qUw";
    final response = await http.get(Uri.parse(nytEndpoint));

    if (response.statusCode == 200) {
      return parseBooks(response.body);
    } else {
      throw Exception('Failed to load books');
    }
  }

  List<Book> parseBooks(String responseBody) {
    final data = json.decode(responseBody);
    final parsed = data["results"]["books"].cast<Map<String, dynamic>>();
    return parsed.map<Book>((json) => Book.fromJson(json)).toList();
  }
}



