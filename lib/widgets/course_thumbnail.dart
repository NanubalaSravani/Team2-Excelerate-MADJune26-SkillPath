import 'package:flutter/material.dart';
import '../models/program.dart';
import 'level_badge.dart';

/// A video-thumbnail-style preview for a course: a gradient
/// background standing in for a cover image, a centered play
/// button (tap to "play" the intro video), the course title
/// overlaid at the bottom, a level badge, and a category badge.
class CourseThumbnail extends StatelessWidget {
  final Program program;
  final double height;
  final VoidCallback? onPlayPressed;

  const CourseThumbnail({
    super.key,
    required this.program,
    this.height = 160,
    this.onPlayPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: SizedBox(
        height: height,
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Background gradient acting as a stand-in for a course image.
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: program.thumbnailGradient,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: Icon(
                  program.thumbnailIcon,
                  size: 56,
                  color: Colors.white.withOpacity(0.35),
                ),
              ),
            ),
            // Darkening gradient so the title text stays readable.
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.black54],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.4, 1.0],
                ),
              ),
            ),
            // Level badge.
            Positioned(
              top: 10,
              left: 10,
              child: LevelBadge(label: program.level),
            ),
            // Category badge.
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  program.category,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            // Play / intro video button.
            Center(
	  child: GestureDetector(
	    onTap: onPlayPressed,
	    child: Container(
	      padding: const EdgeInsets.all(12),
	      decoration: BoxDecoration(
	        color: Colors.white.withOpacity(0.9),
	        shape: BoxShape.circle,
	      ),
	      child: const Icon(
	        Icons.play_arrow,
	        color: Colors.black87,
	        size: 28,
	      ),
	    ),
	  ),
	),
            // Course title overlay.
            Positioned(
              left: 12,
              right: 12,
              bottom: 10,
              child: Text(
                program.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
