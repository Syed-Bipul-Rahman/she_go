import 'package:flutter/material.dart';
import '../../domain/entities/home_entity.dart';
import 'image_placeholder.dart';

class HomeCard extends StatelessWidget {
  final HomeEntity item;

  const HomeCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: const ImagePlaceholder(),
        title: Text(item.title),
        subtitle: Text(item.description),
      ),
    );
  }
}