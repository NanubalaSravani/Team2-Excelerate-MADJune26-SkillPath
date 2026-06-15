import 'package:flutter/material.dart';
import '../models/program.dart';

/// Sample program/course data for the SkillPath app.
/// Replace with data from your backend/API once available.
final List<Program> programs = [
  Program(
    id: 'digital-marketing',
    title: 'Digital Marketing Bootcamp',
    category: 'Marketing',
    level: 'Beginner Friendly',
    startDate: 'July 1, 2026',
    shortDescription:
        'Master SEO, social media strategy, and campaign analytics in this hands-on bootcamp.',
    fullDescription:
        'The Digital Marketing Bootcamp equips learners with practical skills in '
        'search engine optimization, paid advertising, content strategy, and '
        'performance analytics through real-world projects and mentor-led sessions.',
    schedule: '6 weeks · Mon-Fri, 2 hours/day · Live sessions + recordings',
    eligibility:
        'Open to all learners with a basic understanding of social media '
        'platforms. No prior marketing experience required.',
    certification: 'Excelerate Certificate of Completion + LinkedIn badge',
    rating: 4.6,
    reviewCount: 128,
    thumbnailGradient: const [Color(0xFFFF7A59), Color(0xFFFFB199)],
    thumbnailIcon: Icons.campaign_outlined,
    instructor: const Instructor(
      name: 'Ananya Rao',
      title: 'Senior Digital Marketing Strategist',
      bio:
          '8+ years helping startups grow through SEO and paid campaigns. '
          'Previously led growth marketing at two Series-A startups and has '
          'trained over 2,000 learners on digital marketing fundamentals.',
      avatarIcon: Icons.campaign,
    ),
    reviews: const [
      Review(
        reviewerName: 'Rohit Sharma',
        rating: 5,
        comment:
            'Loved the practical assignments — built my first ad campaign '
            'in week 2 and saw real results.',
      ),
      Review(
        reviewerName: 'Priya Nair',
        rating: 4,
        comment:
            'Great content and clear explanations. Could use more case '
            'studies from non-tech industries.',
      ),
    ],
  ),
  Program(
    id: 'mobile-app-dev',
    title: 'Mobile App Development with Flutter',
    category: 'Mobile Development',
    level: 'Intermediate',
    startDate: 'June 15, 2026',
    shortDescription:
        'Build cross-platform mobile apps using Flutter and Dart, from UI design to deployment.',
    fullDescription:
        'This program guides learners through the full mobile app development '
        'lifecycle using Flutter — covering UI/UX design, state management, '
        'navigation, and publishing to app stores, with a team-based capstone project.',
    schedule: '8 weeks · Self-paced with weekly live check-ins',
    eligibility:
        'Open to students with basic programming knowledge. Familiarity with '
        'object-oriented concepts is helpful.',
    certification: 'Excelerate Certificate + Google Developer Badge',
    rating: 4.8,
    reviewCount: 256,
    thumbnailGradient: const [Color(0xFF00A99D), Color(0xFF4FD3C4)],
    thumbnailIcon: Icons.phone_android,
    instructor: const Instructor(
      name: 'Karthik Menon',
      title: 'Mobile Engineering Lead',
      bio:
          'Builds production Flutter apps with millions of downloads. '
          'Passionate about teaching clean architecture and practical UI '
          'patterns to first-time mobile developers.',
      avatarIcon: Icons.smartphone,
    ),
    reviews: const [
      Review(
        reviewerName: 'Sneha Reddy',
        rating: 5,
        comment:
            'The navigation and theming modules were super clear. My team '
            'used this structure for our capstone project!',
      ),
      Review(
        reviewerName: 'Arjun Verma',
        rating: 5,
        comment:
            'Best Flutter intro I have taken. The weekly check-ins kept me '
            'accountable and motivated.',
      ),
      Review(
        reviewerName: 'Divya Iyer',
        rating: 4,
        comment:
            'Solid foundation course. Would love a follow-up on backend '
            'integration with Firebase.',
      ),
    ],
  ),
  Program(
    id: 'data-insights',
    title: 'AI-Powered Data Insights',
    category: 'Data Science',
    level: 'Intermediate',
    startDate: 'June 8, 2026',
    shortDescription:
        'Apply data analysis and machine learning techniques to real datasets and build predictive models.',
    fullDescription:
        'Learners work with real-world datasets to perform exploratory data '
        'analysis, cohort analysis, and build and evaluate machine learning '
        'models, culminating in a final predictive modeling report.',
    schedule: '4 weeks · Weekly deliverables and mentor feedback',
    eligibility: 'Basic knowledge of Python and statistics recommended.',
    certification: 'Excelerate Certificate + Project Portfolio Review',
    rating: 4.7,
    reviewCount: 94,
    thumbnailGradient: const [Color(0xFF7B61FF), Color(0xFFB39DFF)],
    thumbnailIcon: Icons.insights_outlined,
    instructor: const Instructor(
      name: 'Dr. Meera Pillai',
      title: 'Data Science Mentor',
      bio:
          'PhD in Applied Statistics with 10+ years in industry ML roles. '
          'Focuses on making model evaluation and reporting rigorous yet '
          'approachable for early-career data scientists.',
      avatarIcon: Icons.bar_chart,
    ),
    reviews: const [
      Review(
        reviewerName: 'Vikram Singh',
        rating: 5,
        comment:
            'The cohort analysis week was a turning point for me — finally '
            'understood how to structure an analytics report.',
      ),
      Review(
        reviewerName: 'Lakshmi Narayanan',
        rating: 4,
        comment:
            'Dense but rewarding. The model comparison report template was '
            'extremely useful for my own coursework.',
      ),
    ],
  ),
  Program(
    id: 'web-dev',
    title: 'Full-Stack Web Development',
    category: 'Web Development',
    level: 'Beginner Friendly',
    startDate: 'July 6, 2026',
    shortDescription:
        'Learn HTML, CSS, JavaScript, and backend basics to build complete web applications.',
    fullDescription:
        'A project-based introduction to web development covering responsive '
        'front-end design with HTML/CSS/JavaScript, REST APIs, and a simple '
        'backend with a database, ending with a deployed personal portfolio site.',
    schedule: '6 weeks · Tue/Thu live sessions + weekly projects',
    eligibility: 'No prior coding experience required.',
    certification: 'Excelerate Certificate of Completion',
    rating: 4.5,
    reviewCount: 142,
    thumbnailGradient: const [Color(0xFF2ECC71), Color(0xFF8BE2A6)],
    thumbnailIcon: Icons.web_outlined,
    instructor: const Instructor(
      name: 'Farhan Ali',
      title: 'Full-Stack Developer & Educator',
      bio:
          'Self-taught developer turned mentor, focused on helping beginners '
          'ship their first real projects within weeks, not months.',
      avatarIcon: Icons.code,
    ),
    reviews: const [
      Review(
        reviewerName: 'Neha Kulkarni',
        rating: 5,
        comment:
            'Went from zero to deploying my own portfolio site. Explanations '
            'were beginner-friendly without being slow.',
      ),
      Review(
        reviewerName: 'Akash Tiwari',
        rating: 4,
        comment: 'Great pacing overall, though the backend week felt rushed.',
      ),
    ],
  ),
  Program(
    id: 'cloud-computing',
    title: 'Cloud Computing Essentials',
    category: 'Cloud Computing',
    level: 'Advanced',
    startDate: 'June 22, 2026',
    shortDescription:
        'Get hands-on with cloud infrastructure, deployment pipelines, and scalable architecture.',
    fullDescription:
        'This program covers core cloud concepts including virtual machines, '
        'storage, networking, containerization, and CI/CD pipelines, with '
        'hands-on labs on a major cloud provider.',
    schedule: '5 weeks · Lab-based, 3 sessions/week',
    eligibility:
        'Recommended for learners comfortable with Linux basics and at least '
        'one programming language.',
    certification: 'Excelerate Certificate + Cloud Practitioner Prep',
    rating: 4.4,
    reviewCount: 67,
    thumbnailGradient: const [Color(0xFF3A5BA0), Color(0xFF7C9CD9)],
    thumbnailIcon: Icons.cloud_outlined,
    instructor: const Instructor(
      name: 'Sandeep Joshi',
      title: 'Cloud Solutions Architect',
      bio:
          'Designs and migrates large-scale systems to the cloud. Brings '
          'real deployment war stories into every lab session.',
      avatarIcon: Icons.dns_outlined,
    ),
    reviews: const [
      Review(
        reviewerName: 'Ritu Bansal',
        rating: 4,
        comment:
            'Challenging but very practical — the CI/CD lab alone was worth '
            'the course.',
      ),
      Review(
        reviewerName: 'Manish Kumar',
        rating: 5,
        comment: 'Helped me pass my first cloud certification exam!',
      ),
    ],
  ),
  Program(
    id: 'ui-ux-design',
    title: 'UI/UX Design Fundamentals',
    category: 'Design',
    level: 'Beginner Friendly',
    startDate: 'July 13, 2026',
    shortDescription:
        'Learn user research, wireframing, and prototyping to design intuitive digital products.',
    fullDescription:
        'An introduction to the UI/UX design process — from user research and '
        'personas to wireframes, prototypes, and usability testing — using '
        'industry-standard design tools.',
    schedule: '4 weeks · Weekly design critiques',
    eligibility: 'Open to all; no design experience required.',
    certification: 'Excelerate Certificate + Portfolio Project',
    rating: 4.9,
    reviewCount: 183,
    thumbnailGradient: const [Color(0xFFFF6FA0), Color(0xFFFFB3C6)],
    thumbnailIcon: Icons.brush_outlined,
    instructor: const Instructor(
      name: 'Tanvi Deshpande',
      title: 'Product Designer',
      bio:
          'Designs for consumer apps used by millions. Loves teaching '
          'beginners how to think in flows, not just screens.',
      avatarIcon: Icons.design_services_outlined,
    ),
    reviews: const [
      Review(
        reviewerName: 'Sahil Kapoor',
        rating: 5,
        comment:
            'The wireframing exercises were exactly what I needed before '
            'starting my own app project.',
      ),
      Review(
        reviewerName: 'Pooja Mehta',
        rating: 5,
        comment:
            'Loved the weekly critiques — the feedback was specific and '
            'genuinely helped me improve.',
      ),
    ],
  ),
];
