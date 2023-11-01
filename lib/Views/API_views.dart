import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Controller/API_controller.dart';
import '../Models/API_models.dart';

class BooksView extends StatefulWidget {
  @override
  _BooksViewState createState() => _BooksViewState();
}

class _BooksViewState extends State<BooksView> {
  late Future<List<Book>> futureBooks;

  @override
  void initState() {
    super.initState();
    final controller = BooksController(
      "EmNpuEG2ky9TrMmGCaxLuZgoTfQ44qUw",
      "https://api.nytimes.com/svc/books/v3/lists/current/hardcover-fiction.json?api-key=EmNpuEG2ky9TrMmGCaxLuZgoTfQ44qUw",
    );
    futureBooks = controller.fetchBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Tambahkan logika untuk kembali ke halaman sebelumnya
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: Image.asset(
            'assets/Images/nyc.png',
            width: 120, // Sesuaikan lebar gambar sesuai kebutuhan
            height: 80, // Sesuaikan tinggi gambar sesuai kebutuhan
          ),
        ),
      body: FutureBuilder<List<Book>>(
        future: futureBooks,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    _launchAmazonUrl(snapshot.data![index].amazonUrl);
                  },
                  child: ListTile(
                    title: Text(snapshot.data![index].title),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Author: ${snapshot.data![index].author}'),
                        Text('Publisher: ${snapshot.data![index].publisher}'),
                        Text('Weeks on List: ${snapshot.data![index].weeksOnList}'),
                      ],
                    ),
                    leading: Image.network(
                      snapshot.data![index].imageUrl,
                      width: 100,
                      height: 400,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  // Function to launch Amazon URL
  void _launchAmazonUrl(String amazonUrl) async {
    if (await canLaunch(amazonUrl)) {
      await launch(amazonUrl);
    } else {
      throw 'Could not launch $amazonUrl';
    }
  }
}
