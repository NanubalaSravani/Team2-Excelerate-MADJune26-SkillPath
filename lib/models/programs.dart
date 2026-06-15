/// Represents a single program/opportunity shown in the
/// Program Listing and Program Details screens.
class Program {
  final String id;
  final String title;
  final String startDate;
  final String shortDescription;
  final String fullDescription;
  final String schedule;
  final String eligibility;

  const Program({
    required this.id,
    required this.title,
    required this.startDate,
    required this.shortDescription,
    required this.fullDescription,
    required this.schedule,
    required this.eligibility,
  });
}
