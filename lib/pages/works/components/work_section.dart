import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taher_portfolio/core/utils/constants.dart';
import 'package:taher_portfolio/core/utils/screen_helper.dart';
import 'package:taher_portfolio/core/utils/utils.dart';
import 'package:taher_portfolio/models/project.dart';
import 'package:taher_portfolio/provider/theme.dart';

class WorkSection extends StatelessWidget {
  final List<ProjectModel> projects;
  const WorkSection({Key? key, required this.projects}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        desktop: _buildUi(context),
        tablet: _buildUi(context),
        mobile: _buildUi(context),
      ),
    );
  }

  Widget _buildUi(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: Center(
        child: Wrap(
          children: projects
              .map((e) => Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  child: _buildProject(e)))
              .toList(),
        ),
      ),
    );
  }

  Widget _buildProject(ProjectModel projectModel) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: 400,
          child: Consumer(builder: (context, ref, _) {
            final isDark = ref.watch(themeProvider).isDarkMode;

            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                // Gradient border effect
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: isDark
                      ? [
                          const Color(0xFF8B5CF6).withOpacity(0.8), // Purple
                          const Color(0xFF06B6D4).withOpacity(0.8), // Cyan
                          const Color(0xFF3B82F6).withOpacity(0.8), // Blue
                        ]
                      : [
                          const Color(0xFFEC4899).withOpacity(0.8), // Pink
                          const Color(0xFFF59E0B).withOpacity(0.8), // Amber
                          const Color(0xFFFF6B6B).withOpacity(0.8), // Coral
                        ],
                ),
                boxShadow: [
                  // Outer glow effect
                  BoxShadow(
                    color: isDark
                        ? const Color(0xFF8B5CF6).withOpacity(0.3)
                        : const Color(0xFFEC4899).withOpacity(0.3),
                    blurRadius: 24,
                    spreadRadius: 0,
                    offset: const Offset(0, 8),
                  ),
                  // Inner shadow for depth
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
                margin: const EdgeInsets.all(2), // Space for gradient border
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: isDark
                      ? const Color(0xFF1F2937)
                          .withOpacity(0.8) // Dark semi-transparent
                      : Colors.white.withOpacity(0.9), // Light semi-transparent
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(22),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color: isDark
                            ? Colors.white.withOpacity(0.05)
                            : Colors.white.withOpacity(0.7),
                        border: Border.all(
                          color: isDark
                              ? Colors.white.withOpacity(0.1)
                              : Colors.white.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: Column(
                        children: [
                          if (projectModel.appPhotos != null)
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                projectModel.appPhotos!,
                                width:
                                    constraints.maxWidth > 720.0 ? null : 350.0,
                                height: 250,
                                fit: BoxFit.cover,
                              ),
                            ),
                          const SizedBox(height: 24),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
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
                                  projectModel.project,
                                  style: GoogleFonts.josefinSans(
                                    color: isDark
                                        ? const Color(0xFF8B5CF6)
                                        : const Color(0xFFEC4899),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                projectModel.title,
                                style: GoogleFonts.josefinSans(
                                  fontWeight: FontWeight.w900,
                                  height: 1.3,
                                  fontSize: 28.0,
                                  color: isDark ? Colors.white : Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                projectModel.description,
                                style: GoogleFonts.josefinSans(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.0,
                                  height: 1.5,
                                  color: isDark
                                      ? Colors.grey[300]
                                      : Colors.grey[600],
                                ),
                              ),
                              const SizedBox(height: 24),
                              if (projectModel.techUsed.isNotEmpty) ...[
                                Text(
                                  "Technologies Used",
                                  style: GoogleFonts.josefinSans(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16.0,
                                    color:
                                        isDark ? Colors.white : Colors.black87,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  children: projectModel.techUsed
                                      .map((e) => Container(
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: isDark
                                                  ? Colors.white
                                                      .withOpacity(0.1)
                                                  : Colors.black
                                                      .withOpacity(0.05),
                                              border: Border.all(
                                                color: isDark
                                                    ? Colors.white
                                                        .withOpacity(0.2)
                                                    : Colors.black
                                                        .withOpacity(0.1),
                                              ),
                                            ),
                                            child: Image.asset(
                                              e.logo,
                                              width: 28,
                                              height: 28,
                                              color: e.logo ==
                                                      AppConstants.restApiImage
                                                  ? (isDark
                                                      ? Colors.white
                                                      : Colors.black)
                                                  : null,
                                            ),
                                          ))
                                      .toList(),
                                ),
                                const SizedBox(height: 24),
                              ],
                              SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: MouseRegion(
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
                                              ? const Color(0xFF8B5CF6)
                                                  .withOpacity(0.4)
                                              : const Color(0xFFEC4899)
                                                  .withOpacity(0.4),
                                          blurRadius: 12,
                                          offset: const Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        shadowColor: Colors.transparent,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                      ),
                                      onPressed: () {
                                        if (projectModel.internalLink) {
                                          context.goNamed(
                                              projectModel.projectLink);
                                        } else {
                                          Utilty.openUrl(
                                              projectModel.projectLink);
                                        }
                                      },
                                      child: Text(
                                        (projectModel.buttonText ??
                                                "Explore MORE")
                                            .toUpperCase(),
                                        style: GoogleFonts.josefinSans(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          letterSpacing: 1.2,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
