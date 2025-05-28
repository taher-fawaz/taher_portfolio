// lib/models/course.dart
import 'package:taher_portfolio/models/technology.dart';

class CourseModel {
  final String id;
  final String title;
  final String description;
  final String thumbnailUrl;
  final String videoUrl;
  final Duration duration;
  final String category;
  final List<TechnologyModel> techUsed;
  final int views;
  final String publishedDate;
  final String level; // "Beginner", "Intermediate", "Advanced"
  final bool isFree;

  CourseModel({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnailUrl,
    required this.videoUrl,
    required this.duration,
    required this.category,
    required this.techUsed,
    required this.views,
    required this.publishedDate,
    required this.level,
    required this.isFree,
  });

  static List<CourseModel> courses = [
    CourseModel(
      id: "z0ylWIVrMic",
      title: "Complete Flutter Development Course",
      description:
          "Master Flutter from scratch with this comprehensive tutorial. Learn to build beautiful mobile apps with real-world examples and best practices.",
      thumbnailUrl: "https://img.youtube.com/vi/z0ylWIVrMic/maxresdefault.jpg",
      videoUrl: "https://www.youtube.com/watch?v=z0ylWIVrMic",
      duration: const Duration(hours: 2, minutes: 45),
      category: "Complete Course",
      techUsed: [
        TechnologyConstants.flutter,
        TechnologyConstants.dart,
        TechnologyConstants.firebase,
        TechnologyConstants.provider,
      ],
      views: 25420,
      publishedDate: "2024-11-15",
      level: "Beginner",
      isFree: true,
    ),
    CourseModel(
      id: "Z09zqIF_pOg",
      title: "Advanced Flutter State Management",
      description:
          "Deep dive into Flutter state management patterns. Learn Provider, Bloc, and Riverpod with practical examples and project implementations.",
      thumbnailUrl: "https://img.youtube.com/vi/Z09zqIF_pOg/maxresdefault.jpg",
      videoUrl: "https://www.youtube.com/watch?v=Z09zqIF_pOg",
      duration: const Duration(hours: 1, minutes: 55),
      category: "State Management",
      techUsed: [
        TechnologyConstants.flutter,
        TechnologyConstants.dart,
        TechnologyConstants.riverpod,
        TechnologyConstants.bloc,
      ],
      views: 18750,
      publishedDate: "2024-10-28",
      level: "Advanced",
      isFree: true,
    ),
    CourseModel(
      id: "DL8WfIxluFQ",
      title: "Flutter UI/UX Design Masterclass",
      description:
          "Create stunning and responsive user interfaces with Flutter. Master custom animations, transitions, and modern design patterns for beautiful apps.",
      thumbnailUrl: "https://img.youtube.com/vi/DL8WfIxluFQ/maxresdefault.jpg",
      videoUrl: "https://www.youtube.com/watch?v=DL8WfIxluFQ",
      duration: const Duration(hours: 3, minutes: 20),
      category: "UI/UX Design",
      techUsed: [
        TechnologyConstants.flutter,
        TechnologyConstants.dart,
        TechnologyConstants.figma,
      ],
      views: 32100,
      publishedDate: "2024-10-10",
      level: "Intermediate",
      isFree: true,
    ),
    CourseModel(
      id: "BKURsR0HErA",
      title: "Firebase Integration with Flutter",
      description:
          "Complete guide to integrating Firebase services in Flutter apps including Authentication, Firestore, Cloud Storage, and real-time features.",
      thumbnailUrl: "https://img.youtube.com/vi/BKURsR0HErA/maxresdefault.jpg",
      videoUrl: "https://www.youtube.com/watch?v=BKURsR0HErA",
      duration: const Duration(hours: 2, minutes: 15),
      category: "Backend Integration",
      techUsed: [
        TechnologyConstants.flutter,
        TechnologyConstants.dart,
        TechnologyConstants.firebase,
        TechnologyConstants.restApi,
      ],
      views: 21840,
      publishedDate: "2024-09-22",
      level: "Intermediate",
      isFree: true,
    ),
  ];

  // Helper methods for filtering
  static List<CourseModel> getByCategory(String category) {
    return courses.where((course) => course.category == category).toList();
  }

  static List<CourseModel> getByLevel(String level) {
    return courses.where((course) => course.level == level).toList();
  }

  static List<String> get categories {
    return courses.map((course) => course.category).toSet().toList();
  }

  static List<String> get levels {
    return courses.map((course) => course.level).toSet().toList();
  }
}
