// lib/pages/courses/courses_section.dart
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taher_portfolio/core/utils/constants.dart';
import 'package:taher_portfolio/core/utils/screen_helper.dart';
import 'package:taher_portfolio/core/utils/utils.dart';
import 'package:taher_portfolio/models/course.dart';
import 'package:taher_portfolio/provider/theme.dart';

class CourseCard extends StatefulWidget {
  final CourseModel course;

  const CourseCard({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  State<CourseCard> createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard>
    with SingleTickerProviderStateMixin {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final isDark = ref.watch(themeProvider).isDarkMode;

      return MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        cursor: SystemMouseCursors.click,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          width: 380,
          height: isHovered ? 520 : 500,
          margin: const EdgeInsets.all(16),
          transform: isHovered
              ? (Matrix4.identity()..translate(0.0, -8.0, 0.0))
              : Matrix4.identity(),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: isDark
                  ? [
                      const Color(0xFF8B5CF6)
                          .withOpacity(isHovered ? 1.0 : 0.8),
                      const Color(0xFF06B6D4)
                          .withOpacity(isHovered ? 1.0 : 0.8),
                      const Color(0xFF3B82F6)
                          .withOpacity(isHovered ? 1.0 : 0.8),
                    ]
                  : [
                      const Color(0xFFEC4899)
                          .withOpacity(isHovered ? 1.0 : 0.8),
                      const Color(0xFFF59E0B)
                          .withOpacity(isHovered ? 1.0 : 0.8),
                      const Color(0xFFFF6B6B)
                          .withOpacity(isHovered ? 1.0 : 0.8),
                    ],
            ),
            boxShadow: [
              BoxShadow(
                color: isDark
                    ? const Color(0xFF8B5CF6).withOpacity(isHovered ? 0.6 : 0.3)
                    : const Color(0xFFEC4899)
                        .withOpacity(isHovered ? 0.6 : 0.3),
                blurRadius: isHovered ? 40.0 : 24.0,
                spreadRadius: isHovered ? 8.0 : 0.0,
                offset: Offset(0, isHovered ? 12.0 : 8.0),
              ),
              if (isHovered) ...[
                BoxShadow(
                  color: isDark
                      ? const Color(0xFF06B6D4).withOpacity(0.4)
                      : const Color(0xFFF59E0B).withOpacity(0.4),
                  blurRadius: 30.0,
                  spreadRadius: 4.0,
                  offset: const Offset(0, 8.0),
                ),
                BoxShadow(
                  color: isDark
                      ? const Color(0xFF3B82F6).withOpacity(0.3)
                      : const Color(0xFFFF6B6B).withOpacity(0.3),
                  blurRadius: 50.0,
                  spreadRadius: 12.0,
                  offset: const Offset(0, 16.0),
                ),
              ],
              BoxShadow(
                color: isDark
                    ? Colors.black.withOpacity(0.4)
                    : Colors.grey.withOpacity(0.2),
                blurRadius: 16,
                spreadRadius: -4,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Container(
            margin: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: isDark
                  ? const Color(0xFF1F2937).withOpacity(0.8)
                  : Colors.white.withOpacity(0.9),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: isDark
                        ? Colors.white.withOpacity(isHovered ? 0.08 : 0.05)
                        : Colors.white.withOpacity(isHovered ? 0.8 : 0.7),
                    border: Border.all(
                      color: isDark
                          ? Colors.white.withOpacity(isHovered ? 0.2 : 0.1)
                          : Colors.white.withOpacity(isHovered ? 0.4 : 0.3),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Video Thumbnail
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(22),
                              topRight: Radius.circular(22),
                            ),
                            child: Container(
                              height: 200,
                              width: double.infinity,
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  // YouTube Thumbnail
                                  Image.network(
                                    widget.course.thumbnailUrl,
                                    fit: BoxFit.cover,
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: isDark
                                                ? [
                                                    const Color(0xFF374151),
                                                    const Color(0xFF1F2937),
                                                  ]
                                                : [
                                                    const Color(0xFFF3F4F6),
                                                    const Color(0xFFE5E7EB),
                                                  ],
                                          ),
                                        ),
                                        child: const Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      );
                                    },
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: isDark
                                                ? [
                                                    const Color(0xFF374151),
                                                    const Color(0xFF1F2937),
                                                  ]
                                                : [
                                                    const Color(0xFFF3F4F6),
                                                    const Color(0xFFE5E7EB),
                                                  ],
                                          ),
                                        ),
                                        child: const Center(
                                          child: Icon(
                                            Icons.error_outline,
                                            color: Colors.red,
                                            size: 40,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  // Play button overlay
                                  Center(
                                    child: AnimatedScale(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      scale: isHovered ? 1.1 : 1.0,
                                      child: Container(
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          gradient: LinearGradient(
                                            colors: isDark
                                                ? [
                                                    const Color(0xFF8B5CF6),
                                                    const Color(0xFF06B6D4),
                                                  ]
                                                : [
                                                    const Color(0xFFEC4899),
                                                    const Color(0xFFF59E0B),
                                                  ],
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: isDark
                                                  ? const Color(0xFF8B5CF6)
                                                      .withOpacity(0.4)
                                                  : const Color(0xFFEC4899)
                                                      .withOpacity(0.4),
                                              blurRadius: isHovered ? 20 : 12,
                                              spreadRadius: isHovered ? 4 : 2,
                                            ),
                                          ],
                                        ),
                                        child: const Icon(
                                          Icons.play_arrow,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Duration badge
                          Positioned(
                            bottom: 8,
                            right: 8,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.black.withOpacity(0.7),
                              ),
                              child: Text(
                                _formatDuration(widget.course.duration),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          // Level badge
                          Positioned(
                            top: 8,
                            left: 8,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                gradient: LinearGradient(
                                  colors: _getLevelColors(widget.course.level),
                                ),
                              ),
                              child: Text(
                                widget.course.level,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // Content
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Category
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  gradient: LinearGradient(
                                    colors: isDark
                                        ? [
                                            const Color(0xFF8B5CF6)
                                                .withOpacity(0.2),
                                            const Color(0xFF06B6D4)
                                                .withOpacity(0.2),
                                          ]
                                        : [
                                            const Color(0xFFEC4899)
                                                .withOpacity(0.2),
                                            const Color(0xFFF59E0B)
                                                .withOpacity(0.2),
                                          ],
                                  ),
                                ),
                                child: Text(
                                  widget.course.category,
                                  style: GoogleFonts.josefinSans(
                                    color: isDark
                                        ? const Color(0xFF8B5CF6)
                                        : const Color(0xFFEC4899),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 12),
                              // Title
                              Text(
                                widget.course.title,
                                style: GoogleFonts.josefinSans(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18,
                                  height: 1.2,
                                  color: isDark ? Colors.white : Colors.black87,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 8),
                              // Description
                              Text(
                                widget.course.description,
                                style: TextStyle(
                                  fontSize: 14,
                                  height: 1.4,
                                  color: isDark
                                      ? Colors.grey[300]
                                      : Colors.grey[600],
                                ),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 16),
                              // Technologies
                              Wrap(
                                spacing: 6,
                                runSpacing: 6,
                                children: widget.course.techUsed
                                    .take(3)
                                    .map(
                                      (tech) => Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: isDark
                                              ? Colors.white.withOpacity(0.1)
                                              : Colors.black.withOpacity(0.05),
                                        ),
                                        child: Image.asset(
                                          tech.logo,
                                          width: 20,
                                          height: 20,
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                              const Spacer(),
                              // Stats row
                              Row(
                                children: [
                                  Icon(
                                    Icons.visibility,
                                    size: 16,
                                    color: isDark
                                        ? Colors.grey[400]
                                        : Colors.grey[600],
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    _formatViews(widget.course.views),
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: isDark
                                          ? Colors.grey[400]
                                          : Colors.grey[600],
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.green.withOpacity(0.2),
                                    ),
                                    child: const Text(
                                      "FREE",
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String hours = twoDigits(duration.inHours);
    String minutes = twoDigits(duration.inMinutes.remainder(60));

    if (duration.inHours > 0) {
      return "${hours}h ${minutes}m";
    } else {
      return "${minutes}m";
    }
  }

  String _formatViews(int views) {
    if (views >= 1000000) {
      return "${(views / 1000000).toStringAsFixed(1)}M views";
    } else if (views >= 1000) {
      return "${(views / 1000).toStringAsFixed(1)}K views";
    } else {
      return "$views views";
    }
  }

  List<Color> _getLevelColors(String level) {
    switch (level) {
      case "Beginner":
        return [Colors.green, Colors.teal];
      case "Intermediate":
        return [Colors.orange, Colors.amber];
      case "Advanced":
        return [Colors.red, Colors.pink];
      default:
        return [Colors.blue, Colors.indigo];
    }
  }
}

class CoursesSection extends StatelessWidget {
  const CoursesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth, context),
        tablet: _buildUi(kTabletMaxWidth, context),
        mobile: _buildUi(getMobileMaxWidth(context), context),
      ),
    );
  }

  Widget _buildUi(double width, BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: width),
        child: Column(
          children: [
            // Section Header
            _buildSectionHeader(),
            const SizedBox(height: 50),
            // Courses Grid
            _buildCoursesGrid(context),
            const SizedBox(height: 50),
            // View All Button
            _buildViewAllButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader() {
    return Consumer(builder: (context, ref, _) {
      final isDark = ref.watch(themeProvider).isDarkMode;

      return Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 12,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: LinearGradient(
                colors: isDark
                    ? [
                        const Color(0xFF8B5CF6).withOpacity(0.2),
                        const Color(0xFF06B6D4).withOpacity(0.2),
                      ]
                    : [
                        const Color(0xFFEC4899).withOpacity(0.2),
                        const Color(0xFFF59E0B).withOpacity(0.2),
                      ],
              ),
              border: Border.all(
                color: isDark
                    ? const Color(0xFF8B5CF6).withOpacity(0.3)
                    : const Color(0xFFEC4899).withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Text(
              "Learn with Me",
              style: GoogleFonts.josefinSans(
                color:
                    isDark ? const Color(0xFF8B5CF6) : const Color(0xFFEC4899),
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "Flutter Courses & Tutorials",
            style: GoogleFonts.josefinSans(
              fontWeight: FontWeight.w900,
              fontSize: 42,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "Master Flutter development with comprehensive video tutorials and hands-on projects",
            style: GoogleFonts.josefinSans(
              fontSize: 18,
              color: kCaptionColor,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      );
    });
  }

  Widget _buildCoursesGrid(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Wrap(
          alignment: WrapAlignment.center,
          children: CourseModel.courses
              .take(6)
              .map(
                (course) => GestureDetector(
                  onTap: () => Utilty.openUrl(course.videoUrl),
                  child: CourseCard(course: course),
                ),
              )
              .toList(),
        );
      },
    );
  }

  Widget _buildViewAllButton(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final isDark = ref.watch(themeProvider).isDarkMode;

      return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: LinearGradient(
              colors: isDark
                  ? [
                      const Color(0xFF8B5CF6),
                      const Color(0xFF06B6D4),
                    ]
                  : [
                      const Color(0xFFEC4899),
                      const Color(0xFFF59E0B),
                    ],
            ),
            boxShadow: [
              BoxShadow(
                color: isDark
                    ? const Color(0xFF8B5CF6).withOpacity(0.4)
                    : const Color(0xFFEC4899).withOpacity(0.4),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 16,
              ),
            ),
            onPressed: () => Utilty.openUrl(AppConstants.youtubeUrl),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.play_circle_filled,
                  color: Colors.white,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Text(
                  "View All Courses on YouTube",
                  style: GoogleFonts.josefinSans(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
