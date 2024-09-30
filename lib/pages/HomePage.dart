import 'package:flutter/material.dart';
import 'dummy_menu.dart'; // Pastikan ini terhubung ke file yang berisi data foodMenuList

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Makanan'),
      ),
      body: ListView.builder(
        itemCount: foodMenuList.length, // Mengambil jumlah item dari dummy data
        itemBuilder: (context, index) {
          final menu = foodMenuList[index]; // Mengambil setiap objek FoodMenu dari list
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              leading: Image.asset(
                menu.imageAsset, // Gambar makanan dari asset
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(menu.name), // Nama makanan
              subtitle: Text(menu.price), // Harga makanan
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Ketika item diklik, tampilkan halaman detail
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MenuDetailPage(menu: menu),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class MenuDetailPage extends StatelessWidget {
  final FoodMenu menu;

  MenuDetailPage({required this.menu});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(menu.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(menu.imageAsset), // Gambar utama makanan
            SizedBox(height: 16.0),
            Text(
              menu.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'Harga: ${menu.price}',
              style: TextStyle(fontSize: 18, color: Colors.green),
            ),
            SizedBox(height: 8.0),
            Text(
              'Kategori: ${menu.category}',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 16.0),
            Text(
              'Deskripsi:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(menu.description),
            SizedBox(height: 16.0),
            Text(
              'Bahan-bahan:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(menu.ingredients),
            SizedBox(height: 16.0),
            Text(
              'Waktu Memasak: ${menu.cookingTime}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),
            Text(
              'Gambar Lainnya:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Container(
              height: 100.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: menu.imageUrls.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Image.network(menu.imageUrls[index]), // Gambar dari URL
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
