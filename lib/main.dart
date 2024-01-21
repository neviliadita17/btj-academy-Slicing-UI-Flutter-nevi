import 'package:flutter/material.dart';
import 'DetailPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Post Test Flutter',
      home: HomePage(title: 'My Home Page'),
    );
  }
}

class HomePage extends StatelessWidget {
  final String title; // Deklarasikan title sebagai properti

  // Constructor untuk menginisialisasi title
  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      appBar: AppBar(
        backgroundColor: Color(0xFFF6F6F6),
        title: Row(
          children: [
            // Logo sebagai gambar dengan margin
            Padding(
              padding: const EdgeInsets.all(8.0), // Sesuaikan dengan kebutuhan margin
              child: Image.asset(
                'assets/img/logo.png',
                height: 40, // Sesuaikan dengan kebutuhan
                width: 91,  // Sesuaikan dengan kebutuhan
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          CardListItem(
            name: 'LARIKE',
            id: 'MLU0016',
            distance: '14230 Km',
          ),
          CardListItem(
            name: 'TABUAH ELOK',
            id: 'KLB00615',
            distance: '12188 Km',
          ),
        ],
      ),
    );
  }
}

class CardListItem extends StatelessWidget {
  final String name;
  final String id;
  final String distance;

  const CardListItem({
    Key? key,
    required this.name,
    required this.id,
    required this.distance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text('Nama: $name'),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('ID: $id'),
              ],
            ),
            Text(
              'Jarak: $distance',
              style: TextStyle(
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
        onTap: () {
          // Navigasi ke halaman detail dengan membawa data
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(
                name: name,
                id: id,
                distance: distance,
              ),
            ),
          );
        },
      ),
    );
  }
}
