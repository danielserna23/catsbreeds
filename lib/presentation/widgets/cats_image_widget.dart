import 'package:animate_do/animate_do.dart';
import 'package:catbreeds/domain/entities/cat_entity.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.cat,
  });

  final Cat cat;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: Image.network(
        'https://cdn2.thecatapi.com/images/${cat.referenceImageId}.jpg',
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress != null) {
            return const SizedBox(
              height: 380,
              width: double.infinity,
              child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.black12)),
            );
          }
          return FadeIn(child: child);
        },
        height: 380,
        width: double.infinity,
        fit: BoxFit.fill,
        errorBuilder: (context, error, stackTrace) => Image.network(
          'https://salonlfc.com/wp-content/uploads/2018/01/image-not-found-1-scaled-1150x647.png',
          height: 350,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
