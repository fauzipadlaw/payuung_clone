import 'package:flutter/material.dart';
import 'package:payuung_clone/utils/colors.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          padding: const EdgeInsets.all(4),
          height: 50,
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: Colors.grey.shade200,
              )),
          child: TabBar(
            controller: _tabController,
            indicator: BoxDecoration(
              color: AppColors.yellow,
              borderRadius: BorderRadius.circular(30),
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            dividerColor: Colors.transparent,
            tabs: const [
              Tab(
                text: 'Payung Pribadi',
              ),
              Tab(
                text: 'Payung Karyawan',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
