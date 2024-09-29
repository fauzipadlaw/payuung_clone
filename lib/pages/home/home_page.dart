import 'package:flutter/material.dart';
import 'package:payuung_clone/pages/home/components/home_app_bar.dart';
import 'package:payuung_clone/pages/home/components/home_content.dart';
import 'package:payuung_clone/utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(52),
        child: HomeAppBar(),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.yellow,
                Colors.white,
              ],
              stops: [
                0.5,
                0.5
              ]),
        ),
        child: SingleChildScrollView(
          child: IntrinsicHeight(
            child: HomeContent(
              tabController: _tabController,
            ),
          ),
        ),
      ),
    );
  }
}
