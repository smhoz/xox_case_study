import 'package:flutter/material.dart';

class AppError extends StatelessWidget {
  const AppError({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Bir sorun ile karşılaşıldı. Lütfen daha sonra tekrar deneyiniz"));
  }
}
