import 'package:flutter/material.dart';
import 'package:payuung_clone/presentation/profile/components/profile_appbar.dart';
import 'package:payuung_clone/presentation/profile/components/profile_row.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(53),
        child: ProfileAppbar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin:
                          const EdgeInsets.only(right: 20, left: 20, bottom: 8),
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Text(
                        'M',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Positioned(
                      bottom: 4,
                      right: 18,
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: const Icon(
                            Icons.camera_alt,
                            size: 18,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Muhammad Fauzi',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Masuk dengan Google')
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const ProfileRow(
                icon: Icon(Icons.person_outline), label: 'Informasi Pribadi'),
            const ProfileRow(
                icon: Icon(Icons.document_scanner_outlined),
                label: 'Syarat & Ketentuan'),
            const ProfileRow(
                icon: Icon(Icons.chat_bubble_outline), label: 'Bantuan'),
            const ProfileRow(
                icon: Icon(Icons.privacy_tip_outlined),
                label: 'Kebijakan Privasi'),
            const ProfileRow(
                icon: Icon(Icons.logout_outlined), label: 'Logout'),
            const ProfileRow(
                icon: Icon(Icons.delete_outline), label: 'Hapus Akun'),
          ],
        ),
      ),
    );
  }
}
