import 'package:flutter/material.dart';

/// Displays a row of star icons representing [rating] out of 5,
/// followed by the numeric rating and an optional review count.
class RatingStars extends StatelessWidget {
  final double rating;
  final int? reviewCount;
  final double size;

  const RatingStars({
    super.key,
    required this.rating,
    this.reviewCount,
    this.size = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...List.generate(5, (index) {
          final filled = index < rating.floor();
          final half = !filled && index < rating;
          return Icon(
            half
                ? Icons.star_half
                : (filled ? Icons.star : Icons.star_border),
            color: Colors.amber,
            size: size,
          );
        }),
        const SizedBox(width: 6),
        Text(
          rating.toStringAsFixed(1),
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: size * 0.85),
        ),
        if (reviewCount != null) ...[
          const SizedBox(width: 4),
          Text(
            '($reviewCount)',
            style: TextStyle(color: Colors.grey, fontSize: size * 0.8),
          ),
        ],
      ],
    );
  }
}
