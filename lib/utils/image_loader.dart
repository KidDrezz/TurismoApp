import 'package:flutter/material.dart';

Widget loadImage(String url, {double? width, double? height}) {
  return Image.network(
    url,
    fit: BoxFit.cover,
    width: width,
    height: height,
    errorBuilder: (context, error, stackTrace) {
      return const Center(child: Text('Error al cargar imagen'));
    },
  );
}
