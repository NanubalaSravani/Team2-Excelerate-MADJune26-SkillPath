import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../data/programs_data.dart';
import '../widgets/course_thumbnail.dart';
import '../widgets/rating_stars.dart';

/// Home Screen — central hub with Programs, Announcements,
/// and Quick Links sections, plus bottom navigation.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Excelerate'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_outline),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Welcome banner
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppTheme.primaryColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome back!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Continue exploring opportunities tailored for you.',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Section: Programs
          _SectionHeader(
            title: 'Programs',
            actionLabel: 'View all',
            onAction: () => Navigator.pushNamed(context, '/programs'),
          ),
          SizedBox(
            height: 190,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: programs.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final program = programs[index];
                return GestureDetector(
                  onTap: () => Navigator.pushNamed(
                    context,
                    '/program-details',
                    arguments: program,
                  ),
                  child: SizedBox(
                    width: 220,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Hero(
                          tag: 'thumbnail-${program.id}',
                          child: CourseThumbnail(
                            program: program,
                            height: 110,
                            onPlayPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Playing intro video for "${program.title}"...',
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          program.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 4),
                        RatingStars(rating: program.rating, size: 14),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 24),

          // Section: Announcements
          const _SectionHeader(title: 'Announcements'),
          Card(
            child: ListTile(
              leading:
                  Icon(Icons.campaign_outlined, color: AppTheme.accentColor),
              title: const Text('New cohort starts next week'),
              subtitle: const Text('Check the Programs tab for details.'),
            ),
          ),
          Card(
            child: ListTile(
              leading:
                  Icon(Icons.campaign_outlined, color: AppTheme.accentColor),
              title: const Text('Submit your Week 2 deliverables'),
              subtitle: const Text('Deadline this Friday.'),
            ),
          ),
          const SizedBox(height: 24),

          // Section: Quick Links
          const _SectionHeader(title: 'Quick Links'),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 2.4,
            children: [
              _QuickLinkTile(
                icon: Icons.list_alt_outlined,
                label: 'All Programs',
                onTap: () => Navigator.pushNamed(context, '/programs'),
              ),
              _QuickLinkTile(
                icon: Icons.bookmark_border,
                label: 'Saved',
                onTap: () {},
              ),
              _QuickLinkTile(
                icon: Icons.support_agent_outlined,
                label: 'Support',
                onTap: () {},
              ),
              _QuickLinkTile(
                icon: Icons.settings_outlined,
                label: 'Settings',
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          NavigationDestination(
              icon: Icon(Icons.menu_book_outlined), label: 'Programs'),
          NavigationDestination(
              icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
        onDestinationSelected: (index) {
          if (index == 1) {
            Navigator.pushNamed(context, '/programs');
          }
        },
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final String? actionLabel;
  final VoidCallback? onAction;

  const _SectionHeader({
    required this.title,
    this.actionLabel,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: Theme.of(context).textTheme.headlineSmall),
          if (actionLabel != null)
            TextButton(onPressed: onAction, child: Text(actionLabel!)),
        ],
      ),
    );
  }
}

class _QuickLinkTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _QuickLinkTile({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Row(
	  children: [
	    Icon(icon, color: AppTheme.primaryColor),
	    const SizedBox(width: 10),
	    Expanded(
	      child: Text(
	        label,
	        overflow: TextOverflow.ellipsis,
	        style: Theme.of(context).textTheme.titleMedium,
	      ),
	    ),
	  ],
	),
      ),
    );
  }
}
