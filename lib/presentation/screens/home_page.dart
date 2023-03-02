import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, this.siteUrl});
  final String? siteUrl;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Center(
        child: Text(
          'Welcome to Wallme!\nCreate and share your Web Poster within seconds.',
          style: TextStyle(fontSize: 30),
        ),
      )),
    );
  }
}
