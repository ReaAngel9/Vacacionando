import 'package:flutter/material.dart';

class ItemActividad extends StatefulWidget {
  ItemActividad({Key? key}) : super(key: key);

  @override
  _ItemActividadState createState() => _ItemActividadState();
}

class _ItemActividadState extends State<ItemActividad> {
  List<String> images = [
    'assets/actv0.jpg',
    'assets/actv1.jpg',
    'assets/actv2.jpg',
  ];
  List<String> titles = [
    'Xcaret sky',
    'Xcaret slide',
    'Xcaret labyrinth',
  ];
  List<String> descriptions = [
    'Day 1',
    'Day 2',
    'Day 3',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        children: images.asMap().entries.map((entry) {
          final int index = entry.key;
          final String imagePath = entry.value;

          return Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 100,
                  width: 120,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: Image.asset(imagePath).image,
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                SizedBox(height: 8.0),
                Text(descriptions[index], style: TextStyle(fontSize: 11)),
                Text(titles[index]),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
