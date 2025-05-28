// lib/pages/courses/courses_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taher_portfolio/core/utils/utils.dart';
import 'package:taher_portfolio/models/course.dart';
import 'package:taher_portfolio/pages/courses/course_card.dart';
import 'package:taher_portfolio/pages/home/components/footer.dart';
import 'package:taher_portfolio/core/utils/screen_helper.dart';
import 'package:taher_portfolio/provider/theme.dart';
import 'package:taher_portfolio/widgets/header.dart';

class CoursesPage extends ConsumerStatefulWidget {
  const CoursesPage({Key? key}) : super(key: key);

  @override
  ConsumerState<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends ConsumerState<CoursesPage> {
  String selectedCategory = "All";
  String selectedLevel = "All";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPage(),
    );
  }

  Widget _buildPage() {
    return Stack(
      children: [
        ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: ScreenHelper.isDesktop(context) ? 30 : 20,
                ),
                _buildPageHeader(),
                const SizedBox(height: 40),
                _buildFilters(),
                const SizedBox(height: 40),
                _buildCoursesGrid(),
                const SizedBox(height: 80),
                const Footer(),
              ],
            ),
          ),
        ),
        const CommonHeader(),
      ],
    );
  }

  Widget _buildPageHeader() {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 80),
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
            "Comprehensive Flutter video tutorials to help you master mobile development",
            style: GoogleFonts.josefinSans(
              fontSize: 18,
              color: Colors.grey[400],
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildFilters() {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 800),
        child: Column(
          children: [
            // Category filters
            _buildFilterSection(
                "Categories", CourseModel.categories, selectedCategory,
                (value) {
              setState(() => selectedCategory = value);
            }),
            const SizedBox(height: 20),
            // Level filters
            _buildFilterSection("Levels", CourseModel.levels, selectedLevel,
                (value) {
              setState(() => selectedLevel = value);
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterSection(String title, List<String> options,
      String selected, Function(String) onChanged) {
    final allOptions = ["All", ...options];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.josefinSans(
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: allOptions
              .map((option) => _buildFilterChip(option, selected, onChanged))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildFilterChip(
      String label, String selected, Function(String) onChanged) {
    final isSelected = label == selected;

    return Consumer(builder: (context, ref, _) {
      final isDark = ref.watch(themeProvider).isDarkMode;

      return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => onChanged(label),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: isSelected
                  ? LinearGradient(
                      colors: isDark
                          ? [const Color(0xFF8B5CF6), const Color(0xFF06B6D4)]
                          : [const Color(0xFFEC4899), const Color(0xFFF59E0B)],
                    )
                  : null,
              color: isSelected
                  ? null
                  : (isDark ? Colors.grey[800] : Colors.grey[200]),
              border: Border.all(
                color: isSelected
                    ? Colors.transparent
                    : (isDark ? Colors.grey[600]! : Colors.grey[400]!),
              ),
            ),
            child: Text(
              label,
              style: GoogleFonts.josefinSans(
                color: isSelected
                    ? Colors.white
                    : (isDark ? Colors.grey[300] : Colors.grey[700]),
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget _buildCoursesGrid() {
    final filteredCourses = _getFilteredCourses();

    if (filteredCourses.isEmpty) {
      return Center(
        child: Column(
          children: [
            Icon(
              Icons.search_off,
              size: 80,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              "No courses found",
              style: GoogleFonts.josefinSans(
                fontSize: 18,
                color: Colors.grey[400],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Try adjusting your filters",
              style: GoogleFonts.josefinSans(
                fontSize: 14,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      );
    }

    return Center(
      child: Wrap(
        alignment: WrapAlignment.center,
        children: filteredCourses
            .map(
              (course) => GestureDetector(
                onTap: () => Utilty.openUrl(course.videoUrl),
                child: CourseCard(course: course),
              ),
            )
            .toList(),
      ),
    );
  }

  List<CourseModel> _getFilteredCourses() {
    List<CourseModel> courses = CourseModel.courses;

    if (selectedCategory != "All") {
      courses = courses
          .where((course) => course.category == selectedCategory)
          .toList();
    }

    if (selectedLevel != "All") {
      courses =
          courses.where((course) => course.level == selectedLevel).toList();
    }

    return courses;
  }
}
