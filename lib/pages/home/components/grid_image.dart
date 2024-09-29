import 'package:flutter/material.dart';
import 'package:payuung_clone/models/wellness.dart';
import 'package:payuung_clone/utils/helpers.dart';

class GridIImage extends StatelessWidget {
  final Wellness wellness;
  const GridIImage({super.key, required this.wellness});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              child: Image.asset(
                'assets/images/${wellness.image}',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            wellness.title ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12),
          ),
          const SizedBox(height: 10),
          if (wellness.discount != null && wellness.oldPrice != null)
            Row(
              children: [
                Text(
                  Helpers.formatToRpCurrency(wellness.oldPrice ?? 0),
                  style: const TextStyle(
                    fontSize: 10,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  '${wellness.discount?.round()}% OFF',
                  style: const TextStyle(fontSize: 10, color: Colors.red),
                ),
              ],
            ),
          Text(
            Helpers.formatToRpCurrency(wellness.price ?? 0),
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
