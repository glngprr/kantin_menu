import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Font Poppins digunakan karena memiliki bentuk huruf yang sederhana, rapi, dan nyaman dibaca.
// Ukuran, ketebalan, warna, dan style teks dibuat fleksibel agar widget dapat beragam digunakan
// di berbagai bagian aplikasi sesuai kebutuhan desain dan konteks tampilan.
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
