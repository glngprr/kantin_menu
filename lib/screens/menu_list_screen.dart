import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/menu.dart';
import '../widgets/custom_text.dart';
import 'add_menu_screen.dart';
import 'menu_detail_screen.dart';

class MenuListScreen extends StatefulWidget {
  const MenuListScreen({super.key});

  @override
  State<MenuListScreen> createState() => _MenuListScreenState();
}

class _MenuListScreenState extends State<MenuListScreen> {
  final List<Menu> _daftarMenu = [
    const Menu(nama: 'Mie Ayam Bakso', harga: 15000),
    const Menu(nama: 'Ayam Geprek', harga: 17000),
    const Menu(nama: 'Soto Ayam', harga: 12000),
    const Menu(nama: 'Es Teh Manis', harga: 4000),
    const Menu(nama: 'Jus Alpukat', harga: 10000),
    const Menu(nama: 'Es Campur', harga: 7000),
  ];

  Future<void> _bukaTambahMenu() async {
    final hasil = await Get.to(() => const AddMenuScreen());
    if (hasil is Menu) {
      setState(() {
        _daftarMenu.add(hasil);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        title: const CustomText(
          'Menu Kantin',
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: CustomText(
              'Daftar Menu Hari Ini',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic,
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 88),
              itemCount: _daftarMenu.length,
              itemBuilder: (context, index) {
                final menu = _daftarMenu[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  child: ListTile(
                    leading: const Icon(
                      Icons.restaurant_menu,
                      color: Colors.teal,
                    ),
                    title: CustomText(menu.nama, fontWeight: FontWeight.w600),
                    subtitle: CustomText(
                      menu.hargaRupiah,
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => Get.to(() => MenuDetailScreen(menu: menu)),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _bukaTambahMenu,
        child: const Icon(Icons.add),
      ),
    );
  }
}
