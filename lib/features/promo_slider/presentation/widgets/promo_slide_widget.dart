import 'package:flutter/material.dart';
import 'package:shop/features/promo_slider/data/models/promo_slide_models.dart';

class PromoSlideWidget extends StatelessWidget {
  final PromoSlideModels slide;

  const PromoSlideWidget({super.key, required this.slide});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildBackgroundImage(),
        _buildGradientOverlay(),
        _buildSlideContent(context),
      ],
    );
  }

  Widget _buildBackgroundImage() {
    return Image.network(
      slide.imageUrl,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    );
  }

  Widget _buildGradientOverlay() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black.withOpacity(0.5),
            Colors.transparent,
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
    );
  }

  Widget _buildSlideContent(BuildContext context) {
    return Positioned(
      bottom: 16,
      left: 16,
      right: 16,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Скидка ${slide.discount}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                slide.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                slide.description,
                style: const TextStyle(
                  color: Colors.white70,
                ),
              ),
            ],
          ),
          OutlinedButton(
            onPressed: () {
              // Действие на нажатие кнопки
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              side: const BorderSide(color: Colors.white),
            ),
            child: Text(slide.buttonText),
          ),
        ],
      ),
    );
  }
}
