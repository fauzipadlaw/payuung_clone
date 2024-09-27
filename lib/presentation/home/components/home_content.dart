import 'package:flutter/material.dart';
import 'package:payuung_clone/presentation/home/components/personal_payuung_content.dart';
import 'package:payuung_clone/utils/colors.dart';

class HomeContent extends StatefulWidget {
  final TabController tabController;
  const HomeContent({super.key, required this.tabController});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
                controller: widget.tabController,
                indicator: BoxDecoration(
                  color: AppColors.yellow,
                  borderRadius: BorderRadius.circular(30),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                dividerColor: Colors.transparent,
                onTap: (_) => setState(() {}),
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
            const Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Divider(),
            ),
            Expanded(
              child: Builder(builder: (_) {
                switch (widget.tabController.index) {
                  case 0:
                    return const PersonalPayuungContent();
                  case 1:
                    return Container();
                  default:
                    return const PersonalPayuungContent();
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
