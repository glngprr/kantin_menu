// Model data untuk satu menu kantin.
// Menyimpan nama dan harga (dalam rupiah, tanpa titik atau koma).
class Menu {
  final String nama;
  final int harga;

  const Menu({required this.nama, required this.harga});

  // Harga dengan format rupiah yang rapi, contoh: 15000 -> "Rp 15.000".
  String get hargaRupiah {
    final digit = harga.toString();
    final buffer = StringBuffer();
    for (int i = 0; i < digit.length; i++) {
      final sisa = digit.length - i;
      buffer.write(digit[i]);
      if (sisa > 1 && sisa % 3 == 1) {
        buffer.write('.');
      }
    }
    return 'Rp ${buffer.toString()}';
  }
}
