import 'package:flutter/material.dart';
import 'package:payuung_clone/presentation/home/components/grid_icon.dart';
import 'package:payuung_clone/presentation/home/components/section_title.dart';
import 'package:payuung_clone/utils/colors.dart';

class PersonalPayuungContent extends StatelessWidget {
  const PersonalPayuungContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: SectionTitle(title: 'Produk Keuangan'),
          ),
          SizedBox(
            height: 200,
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              children: const [
                GridIcon(iconName: 'urun', label: 'Urun'),
                GridIcon(iconName: 'haji', label: 'Pembayaran Porsi Haji'),
                GridIcon(iconName: 'finance', label: 'Financial Check Up'),
                GridIcon(iconName: 'car', label: 'Asuransi Mobil'),
                GridIcon(iconName: 'house', label: 'Asuransi Rumah'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: SectionTitle(
              title: 'Kategori Pilihan',
              action: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  children: [
                    const Text('Wishlist'),
                    Container(
                      alignment: Alignment.center,
                      height: 18,
                      width: 18,
                      margin: const EdgeInsets.only(left: 6),
                      decoration: BoxDecoration(
                        color: AppColors.yellow,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Text(
                        '0',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 200,
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              children: const [
                GridIcon(iconName: 'umbrella', label: 'Hobi'),
                GridIcon(iconName: 'shirt', label: 'Merchandise'),
                GridIcon(iconName: 'heart_beat', label: 'Gaya Hidup Sehat'),
                GridIcon(iconName: 'chat', label: 'Konseling & Rohani'),
                GridIcon(iconName: 'brain', label: 'Self Development'),
                GridIcon(iconName: 'card', label: 'Perencanaan Keuangan'),
                GridIcon(iconName: 'mask', label: 'Konsultasi Medis'),
                GridIcon(iconName: 'squares', label: 'Lihat Semua'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
