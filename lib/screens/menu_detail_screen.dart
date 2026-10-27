import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/menu.dart';
import '../widgets/custom_text.dart';

class MenuDetailScreen extends StatelessWidget {
  final Menu menu;

  const MenuDetailScreen({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        title: const CustomText(
          'Detail Menu',
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.restaurant, size: 72, color: Colors.teal),
              const SizedBox(height: 16),
              CustomText(menu.nama, fontSize: 24, fontWeight: FontWeight.bold),
              const SizedBox(height: 8),
              CustomText(menu.hargaRupiah, fontSize: 20, color: Colors.black54),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 18,
                    horizontal: 30,
                  ),
                ),
                onPressed: () => Get.back(),
                child: const CustomText(
                  'Kembali ke Daftar',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
