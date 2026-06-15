import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../data/programs_data.dart';
import '../models/program.dart';
import '../widgets/course_thumbnail.dart';
import '../widgets/rating_stars.dart';

/// Program Listing Screen — catalog of available programs,
/// filterable by category. Each program is shown with a
/// video-style thumbnail, rating, short description, and a
/// "View Details" button.
class ProgramListingScreen extends StatefulWidget {
  const ProgramListingScreen({super.key});

  @override
  State<ProgramListingScreen> createState() => _ProgramListingScreenState();
}

class _ProgramListingScreenState extends State<ProgramListingScreen> {
  String _selectedCategory = 'All';

  late final List<String> _categories = [
    'All',
    ...{for (final p in programs) p.category},
  ];

  List<Program> get _filteredPrograms {
    if (_selectedCategory == 'All') return programs;
    return programs.where((p) => p.category == _selectedCategory).toList();
  }

  void _playIntro(Program program) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Playing intro video for "${program.title}"...')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Programs')),
      body: Column(
        children: [
          // Category filter chips
          SizedBox(
            height: 52,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: _categories.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final category = _categories[index];
                final selected = category == _selectedCategory;
                return ChoiceChip(
                  label: Text(category),
                  selected: selected,
                  onSelected: (_) =>
                      setState(() => _selectedCategory = category),
                  selectedColor: AppTheme.primaryColor,
                  labelStyle: TextStyle(
                    color: selected ? Colors.white : AppTheme.secondaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                  backgroundColor: Colors.white,
                  shape: StadiumBorder(
                    side: BorderSide(color: Colors.grey.shade300),
                  ),
                );
              },
            ),
          ),
          // Program cards
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
              itemCount: _filteredPrograms.length,
              itemBuilder: (context, index) {
                final program = _filteredPrograms[index];
                return Card(
                  clipBehavior: Clip.antiAlias,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Hero(
                          tag: 'thumbnail-${program.id}',
                          child: CourseThumbnail(
                            program: program,
                            onPlayPressed: () => _playIntro(program),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          program.title,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 6),
                        RatingStars(
                          rating: program.rating,
                          reviewCount: program.reviewCount,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          program.shortDescription,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 12),
                        Align(
                          alignment: Alignment.centerRight,
                          // Navigator.push passes the selected program as
                          // an argument to the Program Details screen.
                          child: OutlinedButton(
                            onPressed: () => Navigator.pushNamed(
                              context,
                              '/program-details',
                              arguments: program,
                            ),
                            child: const Text('View Details'),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
