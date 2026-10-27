import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../models/menu.dart';
import '../widgets/custom_text.dart';

class AddMenuScreen extends StatefulWidget {
  const AddMenuScreen({super.key});

  @override
  State<AddMenuScreen> createState() => _AddMenuScreenState();
}

class _AddMenuScreenState extends State<AddMenuScreen> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _hargaController = TextEditingController();

  @override
  void dispose() {
    _namaController.dispose();
    _hargaController.dispose();
    super.dispose();
  }

  String? _validasiNama(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Nama menu tidak boleh kosong';
    }
    return null;
  }

  String? _validasiHarga(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Harga tidak boleh kosong';
    }
    final angka = int.tryParse(value.trim());
    if (angka == null) {
      return 'Harga harus berupa angka';
    }
    if (angka <= 0) {
      return 'Harga harus lebih dari 0';
    }
    return null;
  }

  void _simpan() {
    if (_formKey.currentState!.validate()) {
      final menuBaru = Menu(
        nama: _namaController.text.trim(),
        harga: int.parse(_hargaController.text.trim()),
      );
      Get.back(result: menuBaru);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        title: const CustomText(
          'Tambah Menu',
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _namaController,
                decoration: const InputDecoration(
                  labelText: 'Nama menu',
                  border: OutlineInputBorder(),
                ),
                validator: _validasiNama,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _hargaController,
                decoration: const InputDecoration(
                  labelText: 'Harga (Rp)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: _validasiHarga,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _simpan,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                ),
                child: const CustomText('Simpan', fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
