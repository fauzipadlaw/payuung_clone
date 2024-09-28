import 'package:flutter/material.dart';
import 'package:payuung_clone/models/wellness.dart';
import 'package:payuung_clone/presentation/home/components/grid_icon.dart';
import 'package:payuung_clone/presentation/home/components/grid_image.dart';
import 'package:payuung_clone/presentation/home/components/section_title.dart';
import 'package:payuung_clone/utils/colors.dart';
import 'package:text_marquee/text_marquee.dart';

class PersonalPayuungContent extends StatefulWidget {
  const PersonalPayuungContent({super.key});

  @override
  State<PersonalPayuungContent> createState() => _PersonalPayuungContentState();
}

class _PersonalPayuungContentState extends State<PersonalPayuungContent> {
  String? _dropdownValue = 'Terpopuler';
  final List<String> _dropdownItems = [
    'Terpopuler',
    'A to Z',
    'Z to A',
    'Harga Terendah',
    'Harga Tertinggi'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: SectionTitle(
              title: 'Explore Wellness',
              action: Container(
                width: 101,
                padding: const EdgeInsets.symmetric(horizontal: 6),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _dropdownValue,
                    icon: const Icon(Icons.arrow_drop_down),
                    elevation: 20,
                    style: const TextStyle(fontSize: 12, color: Colors.black87),
                    isDense: true,
                    onChanged: (String? value) {
                      setState(() {
                        _dropdownValue = value;
                      });
                    },
                    selectedItemBuilder: (context) {
                      return _dropdownItems.map<Widget>((String item) {
                        return Container(
                          width: 65,
                          alignment: Alignment.centerLeft,
                          child: TextMarquee(
                            item,
                          ),
                        );
                      }).toList();
                    },
                    items: _dropdownItems
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                value,
                                maxLines: 1,
                                overflow: TextOverflow.fade,
                                softWrap: false,
                              ),
                            ),
                            if (value == _dropdownValue)
                              Container(
                                height: 8,
                                width: 8,
                                decoration: BoxDecoration(
                                    color: AppColors.yellow,
                                    borderRadius: BorderRadius.circular(100)),
                              )
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: (dummy.length + 1) / 2 * 300,
              child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.5,
                  children: List.generate(dummy.length, (index) {
                    return GridIImage(wellness: dummy[index]);
                  })),
            ),
          ),
        ],
      ),
    );
  }
}
