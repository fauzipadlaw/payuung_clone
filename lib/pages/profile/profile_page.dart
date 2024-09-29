import 'package:flutter/material.dart';
import 'package:payuung_clone/pages/personal_info/personal_info_page.dart';
import 'package:payuung_clone/pages/profile/components/profile_appbar.dart';
import 'package:payuung_clone/pages/profile/components/profile_row.dart';
import 'package:payuung_clone/utils/colors.dart';

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
                        onTap: () {
                          _dialogBuilder(context);
                        },
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
            ProfileRow(
              icon: const Icon(Icons.person_outline),
              label: 'Informasi Pribadi',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PersonalInfoPage()),
                );
              },
            ),
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

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0))),
          contentPadding: const EdgeInsets.all(0),
          content: Container(
            height: 145,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: const Column(
              children: [
                SizedBox(
                  height: 4,
                ),
                ProfileRow(
                  label: 'Buka kamera',
                  margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                ),
                ProfileRow(
                  label: 'Ambil dari galeri',
                  margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                ),
              ],
            ),
          ),
          actionsPadding: const EdgeInsets.only(bottom: 8),
          actionsAlignment: MainAxisAlignment.center,
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Batal',
                style: TextStyle(color: AppColors.yellow),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
