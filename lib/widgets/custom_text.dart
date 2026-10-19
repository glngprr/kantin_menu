import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Font Poppins dipilih karena hurufnya bulat, bersih, dan mudah dibaca di layar
// kecil, cocok untuk aplikasi menu kantin. Ukuran, ketebalan, dan warna dibuat
// sebagai parameter agar satu widget bisa dipakai untuk judul, nama, dan harga.
class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final FontStyle? fontStyle;
  final Color? color;

  const CustomText(
    this.text, {
    super.key,
    this.fontSize = 16,
    this.fontWeight = FontWeight.normal,
    this.fontStyle,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        color: color,
      ),
    );
  }
}
