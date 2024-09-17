import 'package:animate_do/animate_do.dart';
import 'package:catbreeds/domain/entities/cat_entity.dart';
import 'package:catbreeds/presentation/widgets/cats_image_widget.dart';
import 'package:catbreeds/presentation/widgets/detail_row_widget.dart';
import 'package:flutter/material.dart';

class CatDetailScreen extends StatelessWidget {
  static const name = '/detail';
  final Cat cat;
  const CatDetailScreen({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(cat.name), centerTitle: true),
      body: Center(
        child: _CatDetailView(cat: cat),
      ),
    );
  }
}

class _CatDetailView extends StatelessWidget {
  final Cat cat;
  const _CatDetailView({
    required this.cat,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return FadeInRight(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: ImageWidget(cat: cat),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: _DetailsView(cat: cat, textStyle: textStyle),
            ),
          )
        ],
      ),
    );
  }
}

class _DetailsView extends StatelessWidget {
  const _DetailsView({
    required this.cat,
    required this.textStyle,
  });

  final Cat cat;
  final TextTheme textStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
      child: Column(
        children: [
          Text(
            cat.description,
            style: textStyle.headlineSmall,
          ),
          const SizedBox(height: 20),
          Text(
            cat.temperament,
            style: textStyle.bodyLarge,
          ),
          const SizedBox(height: 20),
          DetailRowWidget(
            label: 'Origen:',
            value: cat.origin,
          ),
          DetailRowWidget(
            label: 'Life span:',
            value: cat.lifeSpan,
          ),
          DetailRowWidget(
            label: 'Adaptability:',
            value: cat.adaptability.toString(),
          ),
          DetailRowWidget(
            label: 'Child friendly:',
            value: cat.childFriendly.toString(),
          ),
          DetailRowWidget(
            label: 'Intelligence:',
            value: cat.intelligence.toString(),
          ),
          DetailRowWidget(
            label: 'social needs',
            value: cat.socialNeeds.toString(),
          ),
          DetailRowWidget(
            label: 'Energy level',
            value: cat.energyLevel.toString(),
          ),
          const SizedBox(height: 50)
        ],
      ),
    );
  }
}
