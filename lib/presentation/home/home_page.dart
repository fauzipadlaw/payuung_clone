import 'package:flutter/material.dart';
import 'package:payuung_clone/presentation/home/components/home_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(52), child: HomeAppBar()),
      body: Container(),
    );
  }
}
