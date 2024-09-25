import 'package:flutter/material.dart';
import 'package:tugas3/sidemenu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var namauser;

  // Data berita dengan gambar
  List<Map<String, String>> news = [
    {
      'title': 'Berita Pertama',
      'description': 'Mahasiswa Baru ternyata keberatan di beri tugas ospek oleh panitia penyelenggara lantaran tugasnya sangat memberatkan sehingga kesehatan mahasiswa baru terancam.',
      'image': 'Download Breaking news background design  for free.jpg' // Placeholder image
    },
    {
      'title': 'Berita Kedua',
      'description': 'Ini adalah deskripsi berita kedua.',
      'image': 'Premium Vector _ Fake News Illustration.jpg' // Placeholder image
    },
    {
      'title': 'Berita Ketiga',
      'description': 'Ini adalah deskripsi berita ketiga.',
      'image': 'Breaking news intro.jpg' // Placeholder image
    },
    {
      'title': 'Berita Keempat',
      'description': 'Ini adalah deskripsi berita keempat.',
      'image': 'Free Vector _ Breaking news live streaming concept.jpg' // Placeholder image
    },
    {
      'title': 'Berita Kelima',
      'description': 'Ini adalah deskripsi berita keempat.',
      'image': 'Free Vector _ Breaking news live streaming concept.jpg' // Placeholder image
    },
    {
      'title': 'Berita Keenam',
      'description': 'Ini adalah deskripsi berita keempat.',
      'image': 'Free Vector _ Breaking news live streaming concept.jpg' // Placeholder image
    },
    {
      'title': 'Berita Ketujuh',
      'description': 'Ini adalah deskripsi berita keempat.',
      'image': 'Free Vector _ Breaking news live streaming concept.jpg' // Placeholder image
    },
    {
      'title': 'Berita Kedelapan',
      'description': 'Ini adalah deskripsi berita keempat.',
      'image': 'Free Vector _ Breaking news live streaming concept.jpg' // Placeholder image
    },
    // Tambahkan lebih banyak berita jika diperlukan
  ];

  void _loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    namauser = prefs.getString('username');

    setState(() {});
  }

  // Fungsi untuk menghapus item berita
  void _deleteNews(int index) {
    setState(() {
      news.removeAt(index);
    });
  }

  // Fungsi untuk mengedit item berita (contoh sederhana dengan mengganti title)
  void _editNews(int index) {
    setState(() {
      news[index]['title'] = 'Judul Berita Diedit'; // Mengubah title berita
    });
  }

  @override
  void initState() {
    super.initState();
    _loadUsername(); // Load username saat inisialisasi
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Selamat datang, $namauser!',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, // Jumlah kolom grid untuk 4x4 grid
                crossAxisSpacing: 16.0, // Jarak antar kolom
                mainAxisSpacing: 16.0, // Jarak antar baris
                childAspectRatio: 0.6, // Rasio aspek grid item agar lebih tinggi
              ),
              itemCount: news.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 5,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12.0),
                          topRight: Radius.circular(12.0),
                        ),
                        child: Image.network(
                          news[index]['image'] ?? '',
                          height: 80, // Ubah ukuran gambar
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          news[index]['title'] ?? '',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          news[index]['description'] ?? '',
                          style: const TextStyle(fontSize: 12),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Spacer(), // Memberikan ruang kosong antara deskripsi dan tombol
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.blue),
                            onPressed: () {
                              _editNews(index); // Fungsi edit berita
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              _deleteNews(index); // Fungsi hapus berita
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      drawer: const Sidemenu(),
    );
  }
}
