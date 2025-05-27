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

class ProjectSection extends StatelessWidget {
  final List<ProjectModel> projects;
  const ProjectSection({Key? key, required this.projects}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth, context),
        tablet: _buildUi(kTabletMaxWidth, context),
        mobile: _buildUi(getMobileMaxWidth(context), context),
      ),
    );
  }

  Widget _buildUi(double width, BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context)
          .copyWith(scrollbars: false, dragDevices: {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      }),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: projects
              .map((e) => Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  child: ProjectCard(width: width, projectModel: e)))
              .toList(),
        ),
      ),
    );
  }
}

class ProjectCard extends StatefulWidget {
  final double width;
  final ProjectModel projectModel;

  const ProjectCard({
    Key? key,
    required this.width,
    required this.projectModel,
  }) : super(key: key);

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard>
    with SingleTickerProviderStateMixin {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            width: widget.width,
            height: ScreenHelper.isMobile(context) ? 400 : 500,
            child: Consumer(builder: (context, ref, _) {
              final isDark = ref.watch(themeProvider).isDarkMode;

              return MouseRegion(
                onEnter: (_) => setState(() => isHovered = true),
                onExit: (_) => setState(() => isHovered = false),
                cursor: SystemMouseCursors.click,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  transform: isHovered
                      ? (Matrix4.identity()..translate(0.0, -8.0, 0.0))
                      : Matrix4.identity(),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    // Gradient border effect
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: isDark
                          ? [
                              const Color(0xFF8B5CF6)
                                  .withOpacity(isHovered ? 1.0 : 0.8), // Purple
                              const Color(0xFF06B6D4)
                                  .withOpacity(isHovered ? 1.0 : 0.8), // Cyan
                              const Color(0xFF3B82F6)
                                  .withOpacity(isHovered ? 1.0 : 0.8), // Blue
                            ]
                          : [
                              const Color(0xFFEC4899)
                                  .withOpacity(isHovered ? 1.0 : 0.8), // Pink
                              const Color(0xFFF59E0B)
                                  .withOpacity(isHovered ? 1.0 : 0.8), // Amber
                              const Color(0xFFFF6B6B)
                                  .withOpacity(isHovered ? 1.0 : 0.8), // Coral
                            ],
                    ),
                    boxShadow: [
                      // RGB Outer glow effect - gets bigger on hover
                      BoxShadow(
                        color: isDark
                            ? const Color(0xFF8B5CF6)
                                .withOpacity(isHovered ? 0.6 : 0.3)
                            : const Color(0xFFEC4899)
                                .withOpacity(isHovered ? 0.6 : 0.3),
                        blurRadius: isHovered ? 40.0 : 24.0,
                        spreadRadius: isHovered ? 8.0 : 0.0,
                        offset: Offset(0, isHovered ? 8.0 : 8.0),
                      ),
                      // Secondary RGB glow for more vibrant effect
                      if (isHovered) ...[
                        BoxShadow(
                          color: isDark
                              ? const Color(0xFF06B6D4).withOpacity(0.4)
                              : const Color(0xFFF59E0B).withOpacity(0.4),
                          blurRadius: 15.0,
                          spreadRadius: 4.0,
                          offset: const Offset(0, 8.0),
                        ),
                        BoxShadow(
                          color: isDark
                              ? const Color(0xFF3B82F6).withOpacity(0.3)
                              : const Color(0xFFFF6B6B).withOpacity(0.3),
                          blurRadius: 25.0,
                          spreadRadius: 8.0,
                          offset: const Offset(0, 16.0),
                        ),
                      ],
                      // Inner shadow for depth
                      BoxShadow(
                        color: isDark
                            ? Colors.black.withOpacity(0.4)
                            : Colors.grey.withOpacity(0.2),
                        blurRadius: 8,
                        spreadRadius: -4,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Container(
                    margin:
                        const EdgeInsets.all(2), // Space for gradient border
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: isDark
                          ? const Color(0xFF1F2937)
                              .withOpacity(0.8) // Dark semi-transparent
                          : Colors.white
                              .withOpacity(0.9), // Light semi-transparent
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
                                ? Colors.white
                                    .withOpacity(isHovered ? 0.08 : 0.05)
                                : Colors.white
                                    .withOpacity(isHovered ? 0.8 : 0.7),
                            border: Border.all(
                              color: isDark
                                  ? Colors.white
                                      .withOpacity(isHovered ? 0.2 : 0.1)
                                  : Colors.white
                                      .withOpacity(isHovered ? 0.4 : 0.3),
                              width: 1,
                            ),
                          ),
                          child: Flex(
                            direction: ScreenHelper.isMobile(context)
                                ? Axis.vertical
                                : Axis.horizontal,
                            children: [
                              if (widget.projectModel.appPhotos != null)
                                SizedBox(
                                  width: ScreenHelper.isMobile(context)
                                      ? widget.width * 0.9
                                      : widget.width * 0.46,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.asset(
                                      widget.projectModel.appPhotos!,
                                      width: constraints.maxWidth > 720.0
                                          ? null
                                          : 350.0,
                                      height: 350,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              const SizedBox(
                                width: 20,
                                height: 20,
                              ),
                              SizedBox(
                                width: ScreenHelper.isMobile(context)
                                    ? widget.width * 0.9
                                    : widget.width * 0.45,
                                child: Column(
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
                                                      .withOpacity(isHovered
                                                          ? 0.3
                                                          : 0.2),
                                                  const Color(0xFF06B6D4)
                                                      .withOpacity(isHovered
                                                          ? 0.3
                                                          : 0.2),
                                                ]
                                              : [
                                                  const Color(0xFFEC4899)
                                                      .withOpacity(isHovered
                                                          ? 0.3
                                                          : 0.2),
                                                  const Color(0xFFF59E0B)
                                                      .withOpacity(isHovered
                                                          ? 0.3
                                                          : 0.2),
                                                ],
                                        ),
                                      ),
                                      child: Text(
                                        widget.projectModel.project,
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
                                      widget.projectModel.title,
                                      style: GoogleFonts.josefinSans(
                                        fontWeight: FontWeight.w900,
                                        height: 1.3,
                                        fontSize: 28.0,
                                        color: isDark
                                            ? Colors.white
                                            : Colors.black87,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      widget.projectModel.description,
                                      style: GoogleFonts.josefinSans(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15.0,
                                        height: 1.5,
                                        color: isDark
                                            ? Colors.grey[300]
                                            : Colors.grey[600],
                                      ),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 20),
                                    if (widget
                                        .projectModel.techUsed.isNotEmpty) ...[
                                      Text(
                                        "Technologies Used",
                                        style: GoogleFonts.josefinSans(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16.0,
                                          color: isDark
                                              ? Colors.white
                                              : Colors.black87,
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      Wrap(
                                        spacing: 8,
                                        runSpacing: 8,
                                        children: widget.projectModel.techUsed
                                            .map((e) => Container(
                                                  padding:
                                                      const EdgeInsets.all(6),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: isDark
                                                        ? Colors.white
                                                            .withOpacity(
                                                                isHovered
                                                                    ? 0.15
                                                                    : 0.1)
                                                        : Colors.black
                                                            .withOpacity(
                                                                isHovered
                                                                    ? 0.08
                                                                    : 0.05),
                                                    border: Border.all(
                                                      color: isDark
                                                          ? Colors.white
                                                              .withOpacity(
                                                                  isHovered
                                                                      ? 0.3
                                                                      : 0.2)
                                                          : Colors.black
                                                              .withOpacity(
                                                                  isHovered
                                                                      ? 0.15
                                                                      : 0.1),
                                                    ),
                                                  ),
                                                  child: Image.asset(
                                                    e.logo,
                                                    width: 25,
                                                    height: 25,
                                                    color: e.logo ==
                                                            AppConstants
                                                                .restApiImage
                                                        ? (isDark
                                                            ? Colors.white
                                                            : Colors.black)
                                                        : null,
                                                  ),
                                                ))
                                            .toList(),
                                      ),
                                      const SizedBox(height: 20),
                                    ],
                                    SizedBox(
                                      height: 50,
                                      child: MouseRegion(
                                        cursor: SystemMouseCursors.click,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(25),
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
                                                        .withOpacity(isHovered
                                                            ? 0.6
                                                            : 0.4)
                                                    : const Color(0xFFEC4899)
                                                        .withOpacity(isHovered
                                                            ? 0.6
                                                            : 0.4),
                                                blurRadius: isHovered ? 8 : 12,
                                                offset: const Offset(0, 4),
                                              ),
                                            ],
                                          ),
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Colors.transparent,
                                              shadowColor: Colors.transparent,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                              ),
                                            ),
                                            onPressed: () {
                                              if (widget
                                                  .projectModel.internalLink) {
                                                context.goNamed(widget
                                                    .projectModel.projectLink);
                                              } else {
                                                Utilty.openUrl(widget
                                                    .projectModel.projectLink);
                                              }
                                            },
                                            child: Center(
                                              child: Text(
                                                (widget.projectModel
                                                            .buttonText ??
                                                        "Explore MORE")
                                                    .toUpperCase(),
                                                style: GoogleFonts.josefinSans(
                                                  fontSize: 13.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  letterSpacing: 1.2,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
