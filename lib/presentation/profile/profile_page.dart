import 'package:flutter/material.dart';
import 'package:payuung_clone/presentation/profile/components/profile_appbar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(53),
        child: ProfileAppbar(),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
