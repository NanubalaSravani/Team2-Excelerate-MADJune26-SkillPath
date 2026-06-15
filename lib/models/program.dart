import 'package:flutter/material.dart';

/// A short profile for the person teaching a program.
class Instructor {
  final String name;
  final String title;
  final String bio;
  final IconData avatarIcon;

  const Instructor({
    required this.name,
    required this.title,
    required this.bio,
    this.avatarIcon = Icons.person,
  });
}

/// A single learner review with a star rating.
class Review {
  final String reviewerName;
  final double rating;
  final String comment;

  const Review({
    required this.reviewerName,
    required this.rating,
    required this.comment,
  });
}

/// Represents a single program/course shown across the app.
class Program {
  final String id;
  final String title;
  final String category;
  final String level; // e.g. "Beginner Friendly"
  final String startDate;
  final String shortDescription;
  final String fullDescription;
  final String schedule;
  final String eligibility;
  final String certification;
  final double rating;
  final int reviewCount;

  /// Gradient used to stand in for a course thumbnail/cover image.
  final List<Color> thumbnailGradient;

  /// Icon shown faintly on the thumbnail to hint at the subject.
  final IconData thumbnailIcon;

  final Instructor instructor;
  final List<Review> reviews;

  const Program({
    required this.id,
    required this.title,
    required this.category,
    required this.level,
    required this.startDate,
    required this.shortDescription,
    required this.fullDescription,
    required this.schedule,
    required this.eligibility,
    required this.certification,
    required this.rating,
    required this.reviewCount,
    required this.thumbnailGradient,
    required this.thumbnailIcon,
    required this.instructor,
    required this.reviews,
  });
}
