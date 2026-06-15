import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/program.dart';
import '../widgets/level_badge.dart';
import '../widgets/rating_stars.dart';

/// Program Details Screen — shows a hero image with a level
/// badge, the program title and rating, a bookmark toggle in
/// the app bar, three tabs (Overview, Instructor, Review), and
/// a sticky "Enroll Now" button at the bottom.
///
/// The selected [Program] is retrieved via
/// ModalRoute.of(context).settings.arguments, which is the
/// data passed through Navigator.push from the listing screen.
class ProgramDetailsScreen extends StatefulWidget {
  const ProgramDetailsScreen({super.key});

  @override
  State<ProgramDetailsScreen> createState() => _ProgramDetailsScreenState();
}

class _ProgramDetailsScreenState extends State<ProgramDetailsScreen> {
  bool _isBookmarked = false;

  void _toggleBookmark(Program program) {
    setState(() => _isBookmarked = !_isBookmarked);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _isBookmarked
              ? 'Saved "${program.title}" to bookmarks'
              : 'Removed "${program.title}" from bookmarks',
        ),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  void _enroll(Program program) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Enrolled in "${program.title}"!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final program = ModalRoute.of(context)!.settings.arguments as Program;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            program.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          actions: [
            IconButton(
              icon: Icon(
                _isBookmarked ? Icons.bookmark : Icons.bookmark_border,
              ),
              tooltip: 'Bookmark this program',
              onPressed: () => _toggleBookmark(program),
            ),
          ],
        ),
        body: Column(
          children: [
            // Hero image with level badge.
            Hero(
              tag: 'thumbnail-${program.id}',
              child: Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: program.thumbnailGradient,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Icon(
                        program.thumbnailIcon,
                        size: 80,
                        color: Colors.white.withOpacity(0.35),
                      ),
                    ),
                    Positioned(
                      top: 14,
                      left: 14,
                      child: LevelBadge(label: program.level),
                    ),
                  ],
                ),
              ),
            ),
            // Title + rating.
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    program.title,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  RatingStars(
                    rating: program.rating,
                    reviewCount: program.reviewCount,
                    size: 18,
                  ),
                ],
              ),
            ),
            // Tabs.
            TabBar(
              labelColor: AppTheme.primaryColor,
              unselectedLabelColor: Colors.grey,
              indicatorColor: AppTheme.primaryColor,
              tabs: const [
                Tab(text: 'Overview'),
                Tab(text: 'Instructor'),
                Tab(text: 'Review'),
              ],
            ),
            // Tab content.
            Expanded(
              child: TabBarView(
                children: [
                  _OverviewTab(program: program),
                  _InstructorTab(instructor: program.instructor),
                  _ReviewTab(reviews: program.reviews),
                ],
              ),
            ),
          ],
        ),
        // Sticky Enroll Now button.
        bottomNavigationBar: SafeArea(
          minimum: const EdgeInsets.fromLTRB(16, 12, 16, 16),
          child: ElevatedButton(
            onPressed: () => _enroll(program),
            child: const Text('Enroll Now'),
          ),
        ),
      ),
    );
  }
}

/// Overview tab: description, duration, certification, and more.
class _OverviewTab extends StatelessWidget {
  final Program program;

  const _OverviewTab({required this.program});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text('About this Program',
            style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        Text(program.fullDescription,
            style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 20),
        _InfoRow(
          icon: Icons.schedule_outlined,
          label: 'Duration',
          value: program.schedule,
        ),
        const SizedBox(height: 12),
        _InfoRow(
          icon: Icons.workspace_premium_outlined,
          label: 'Certification',
          value: program.certification,
        ),
        const SizedBox(height: 12),
        _InfoRow(
          icon: Icons.event_outlined,
          label: 'Start Date',
          value: 'Starts ${program.startDate}',
        ),
        const SizedBox(height: 12),
        _InfoRow(
          icon: Icons.fact_check_outlined,
          label: 'Eligibility',
          value: program.eligibility,
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppTheme.primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: AppTheme.primaryColor, size: 20),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppTheme.secondaryColor,
                ),
              ),
              const SizedBox(height: 2),
              Text(value, style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ),
      ],
    );
  }
}

/// Instructor tab: profile card with bio.
class _InstructorTab extends StatelessWidget {
  final Instructor instructor;

  const _InstructorTab({required this.instructor});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundColor: AppTheme.primaryColor.withOpacity(0.15),
                  child: Icon(
                    instructor.avatarIcon,
                    color: AppTheme.primaryColor,
                    size: 32,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        instructor.name,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        instructor.title,
                        style: const TextStyle(
                          color: AppTheme.primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        instructor.bio,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// Review tab: learner reviews with star ratings.
class _ReviewTab extends StatelessWidget {
  final List<Review> reviews;

  const _ReviewTab({required this.reviews});

  @override
  Widget build(BuildContext context) {
    if (reviews.isEmpty) {
      return const Center(child: Text('No reviews yet.'));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: reviews.length,
      itemBuilder: (context, index) {
        final review = reviews[index];
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: AppTheme.secondaryColor.withOpacity(0.1),
                      child: Text(
                        review.reviewerName.substring(0, 1),
                        style: const TextStyle(
                          color: AppTheme.secondaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            review.reviewerName,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          RatingStars(rating: review.rating, size: 14),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(review.comment,
                    style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          ),
        );
      },
    );
  }
}
