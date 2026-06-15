# SkillPath — Mobile Learning App

A cross-platform mobile learning app built with Flutter that connects
learners with Excelerate's educational programs — from discovery to
enrollment — in one consistent, branded experience.

## Vision

To make learning simple, accessible, and engaging by connecting users
with educational programs, resources, and real-time updates in one platform.

## Objectives

- Cross-platform development (Android & iOS) using Flutter
- User authentication (Email + Google Sign-In)
- Program discovery with category filters
- Progress tracking and completion certificates
- Admin dashboard for content and user management

## Features (Week 2 — Working UI Prototype)

- **Login Screen** — email/password form with validation and a branded
  entry point into the app.
- **Home Screen** — welcome banner, horizontally scrolling Programs
  section, Announcements, Quick Links, and bottom navigation.
- **Program Listing Screen**
  - Category filter chips (Marketing, Mobile Development, Data Science,
    Web Development, Cloud Computing, Design, and more)
  - Video-style course thumbnails with a play button ("intro video"
    preview), course title overlay, level badge, and category badge
  - Star rating with review count for each course
- **Program Details Screen**
  - Hero image with a level badge (e.g. *"Beginner Friendly"*)
  - Program title with star rating and review count
  - Bookmark toggle in the app bar
  - Three tabs:
    - **Overview** — description, duration/schedule, certification info,
      start date, and eligibility
    - **Instructor** — profile card with avatar, title, and bio
    - **Review** — learner reviews with individual star ratings
  - Sticky **Enroll Now** button at the bottom with snackbar confirmation
- Consistent branding (colors, typography, button/input styles) applied
  globally via a shared `ThemeData`.

## Navigation Flow

```
Login → Home → Program Listing → Program Details → Enroll
                     ↑                   ↓
                Quick Links          Bookmark
```

Program data is passed between the Listing and Details screens using
`Navigator.pushNamed(..., arguments: program)` and retrieved via
`ModalRoute.of(context).settings.arguments`. A shared `Hero` animation
connects each course thumbnail to its details page hero image.

## SkillPath — Low-Fidelity Wireframes for Core App Screens

<img width="1673" height="789" alt="image" src="https://github.com/user-attachments/assets/a8ebc69d-edbd-4565-a54d-781e52f54dbb" />

## Project Structure

```
lib/
├── main.dart                       # App entry point, named routes
├── theme/
│   └── app_theme.dart              # Centralized branding (colors, fonts, button/input styles)
├── models/
│   └── program.dart                # Program, Instructor, and Review data models
├── data/
│   └── programs_data.dart          # Sample program/course catalog
├── widgets/
│   ├── course_thumbnail.dart       # Video-style thumbnail with play button, badges, title overlay
│   ├── level_badge.dart            # "Beginner Friendly" / level pill badge
│   └── rating_stars.dart           # Reusable star rating display
└── screens/
    ├── login_screen.dart           # Email/password form -> Home
    ├── home_screen.dart            # Programs, Announcements, Quick Links
    ├── program_listing_screen.dart # Category filters + course catalog
    └── program_details_screen.dart # Hero image, tabs, bookmark, Enroll Now
```

## Team

| Name | Role |
|------|------|
| Praise Esheya | Team Lead |
| Damian Amegashie | Project Manager |
| Ruth Nwosu | Project Scribe |
| Asma Shahzadi | Project Lead |
| Nanubala Sravani | UI/UX Designer |
| Anindya Roy | Team Member |
| Soumya Das | Team Member |
| Pratyush Srivastava | Team Member |

## Setup

1. Install Flutter SDK (>=3.0.0)
2. Clone this repo
3. Run `flutter pub get`
4. Run `flutter run`

## Status

- [x] App proposal documented
- [x] Wireframes designed (Login, Home, Program Listing, Program Detail)
- [x] GitHub repo initialized
- [x] Working UI prototype — Login, Home, Program Listing, and Program
      Details screens implemented with navigation (Week 2)
- [x] Category filters and course catalog with ratings, instructors,
      and reviews
- [x] Tabbed Program Details screen (Overview / Instructor / Review)
      with bookmark and Enroll Now
- [ ] Backend integration (authentication, live program data, enrollment)
- [ ] Progress tracking and certificates
- [ ] Admin dashboard
