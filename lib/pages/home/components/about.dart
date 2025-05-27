import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taher_portfolio/models/technology.dart';
import 'package:taher_portfolio/provider/theme.dart';
import 'package:taher_portfolio/core/utils/constants.dart';
import 'package:taher_portfolio/core/utils/screen_helper.dart';
import 'package:responsive_framework/responsive_framework.dart';

class TechnologyCard extends StatefulWidget {
  final TechnologyModel technology;

  const TechnologyCard({
    Key? key,
    required this.technology,
  }) : super(key: key);

  @override
  State<TechnologyCard> createState() => _TechnologyCardState();
}

class _TechnologyCardState extends State<TechnologyCard> {
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
          margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          transform: isHovered
              ? (Matrix4.identity()..translate(0.0, -4.0, 0.0))
              : Matrix4.identity(),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: isDark
                  ? [
                      const Color(0xFF8B5CF6)
                          .withOpacity(isHovered ? 0.3 : 0.1),
                      const Color(0xFF06B6D4)
                          .withOpacity(isHovered ? 0.3 : 0.1),
                    ]
                  : [
                      const Color(0xFFEC4899)
                          .withOpacity(isHovered ? 0.3 : 0.1),
                      const Color(0xFFF59E0B)
                          .withOpacity(isHovered ? 0.3 : 0.1),
                    ],
            ),
            boxShadow: isHovered
                ? [
                    BoxShadow(
                      color: isDark
                          ? const Color(0xFF8B5CF6).withOpacity(0.4)
                          : const Color(0xFFEC4899).withOpacity(0.4),
                      blurRadius: 15.0,
                      spreadRadius: 2.0,
                      offset: const Offset(0, 4.0),
                    ),
                    BoxShadow(
                      color: isDark
                          ? const Color(0xFF06B6D4).withOpacity(0.3)
                          : const Color(0xFFF59E0B).withOpacity(0.3),
                      blurRadius: 10.0,
                      spreadRadius: 1.0,
                      offset: const Offset(0, 2.0),
                    ),
                  ]
                : [],
            border: Border.all(
              color: isDark
                  ? Colors.white.withOpacity(isHovered ? 0.3 : 0.1)
                  : Colors.black.withOpacity(isHovered ? 0.2 : 0.05),
              width: 1,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: isDark
                      ? Colors.white.withOpacity(isHovered ? 0.1 : 0.05)
                      : Colors.white.withOpacity(isHovered ? 0.9 : 0.7),
                ),
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(16),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedScale(
                        duration: const Duration(milliseconds: 300),
                        scale: isHovered ? 1.1 : 1.0,
                        child: SizedBox(
                          width: 24,
                          height: 24,
                          child: Image.asset(widget.technology.logo),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        widget.technology.name,
                        style: GoogleFonts.josefinSans(
                          fontSize: isHovered ? 13.0 : 12.0,
                          fontWeight: FontWeight.bold,
                          color: isDark
                              ? (isHovered ? Colors.white : Colors.grey[300])
                              : (isHovered ? Colors.black87 : Colors.grey[700]),
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
}

class GlassmorphismProfileImage extends StatefulWidget {
  final double? width;

  const GlassmorphismProfileImage({
    Key? key,
    this.width,
  }) : super(key: key);

  @override
  State<GlassmorphismProfileImage> createState() =>
      _GlassmorphismProfileImageState();
}

class _GlassmorphismProfileImageState extends State<GlassmorphismProfileImage>
    with SingleTickerProviderStateMixin {
  bool isHovered = false;
  late AnimationController _animationController;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 8),
      vsync: this,
    )..repeat();

    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 2 * 3.14159, // 360 degrees in radians
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.linear,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final isDark = ref.watch(themeProvider).isDarkMode;

      return MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          transform: isHovered
              ? (Matrix4.identity()..translate(0.0, -8.0, 0.0))
              : Matrix4.identity(),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Animated rotating gradient border
              AnimatedBuilder(
                animation: _rotationAnimation,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _rotationAnimation.value,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      width: isHovered ? 380 : 360,
                      height: isHovered ? 380 : 360,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: isDark
                              ? [
                                  const Color(0xFFFF0080), // Hot Pink
                                  const Color(0xFF8B5CF6), // Purple
                                  const Color(0xFF06B6D4), // Cyan
                                  const Color(0xFF3B82F6), // Blue
                                  const Color(0xFF10B981), // Emerald
                                  const Color(0xFFF59E0B), // Amber
                                  const Color(0xFFFF0080), // Back to Hot Pink
                                ]
                              : [
                                  const Color(0xFFEC4899), // Pink
                                  const Color(0xFF8B5CF6), // Purple
                                  const Color(0xFF06B6D4), // Cyan
                                  const Color(0xFF10B981), // Emerald
                                  const Color(0xFFF59E0B), // Amber
                                  const Color(0xFFFF6B6B), // Coral
                                  const Color(0xFFEC4899), // Back to Pink
                                ],
                          stops: const [0.0, 0.16, 0.33, 0.5, 0.66, 0.83, 1.0],
                        ),
                        boxShadow: [
                          // Multiple RGB glows
                          BoxShadow(
                            color: isDark
                                ? const Color(0xFFFF0080)
                                    .withOpacity(isHovered ? 0.6 : 0.4)
                                : const Color(0xFFEC4899)
                                    .withOpacity(isHovered ? 0.6 : 0.4),
                            blurRadius: isHovered ? 50.0 : 30.0,
                            spreadRadius: isHovered ? 8.0 : 4.0,
                            offset: const Offset(0, 0),
                          ),
                          BoxShadow(
                            color: isDark
                                ? const Color(0xFF8B5CF6)
                                    .withOpacity(isHovered ? 0.5 : 0.3)
                                : const Color(0xFF8B5CF6)
                                    .withOpacity(isHovered ? 0.5 : 0.3),
                            blurRadius: isHovered ? 40.0 : 25.0,
                            spreadRadius: isHovered ? 6.0 : 2.0,
                            offset: const Offset(0, 0),
                          ),
                          BoxShadow(
                            color: isDark
                                ? const Color(0xFF06B6D4)
                                    .withOpacity(isHovered ? 0.4 : 0.2)
                                : const Color(0xFF06B6D4)
                                    .withOpacity(isHovered ? 0.4 : 0.2),
                            blurRadius: isHovered ? 60.0 : 35.0,
                            spreadRadius: isHovered ? 10.0 : 6.0,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              // Inner dark container
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: isHovered ? 350 : 330,
                height: isHovered ? 350 : 330,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  color: isDark
                      ? const Color(0xFF0F172A) // Dark slate
                      : const Color(0xFF1F2937), // Dark gray
                  border: Border.all(
                    color: Colors.white.withOpacity(0.1),
                    width: 2,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(33),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(33),
                        color: Colors.black.withOpacity(0.3),
                      ),
                      child: Center(
                        child: AnimatedScale(
                          duration: const Duration(milliseconds: 500),
                          scale: isHovered ? 1.05 : 1.0,
                          child: Image.asset(
                            AppConstants.personPng,
                            width: widget.width != null
                                ? widget.width! * 0.8
                                : 280,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class AboutSection extends StatefulWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: _buildUi(kDesktopMaxWidth),
      tablet: _buildUi(kTabletMaxWidth),
      mobile: _buildUi(getMobileMaxWidth(context)),
    );
  }

  Widget _buildUi(double width) {
    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ResponsiveWrapper(
            maxWidth: width,
            minWidth: width,
            defaultScale: false,
            child: Flex(
              direction:
                  constraints.maxWidth > 720 ? Axis.horizontal : Axis.vertical,
              children: [
                Expanded(
                  flex: constraints.maxWidth > 720.0 ? 1 : 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15.0),
                      // Enhanced "About Me" title
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          gradient: LinearGradient(
                            colors: [
                              const Color(0xFF8B5CF6).withOpacity(0.1),
                              const Color(0xFF06B6D4).withOpacity(0.1),
                            ],
                          ),
                          border: Border.all(
                            color: const Color(0xFF8B5CF6).withOpacity(0.3),
                            width: 1,
                          ),
                        ),
                        child: Text(
                          "About Me",
                          style: GoogleFonts.josefinSans(
                            fontWeight: FontWeight.w900,
                            height: 1.3,
                            fontSize: 35.0,
                            foreground: Paint()
                              ..shader = const LinearGradient(
                                colors: [
                                  Color(0xFF8B5CF6),
                                  Color(0xFF06B6D4),
                                ],
                              ).createShader(
                                  const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25.0),
                      Text(
                        "I'm Taher Fawaz, A Senior Mobile Application Developer",
                        style: GoogleFonts.josefinSans(
                          fontWeight: FontWeight.bold,
                          height: 1.3,
                          fontSize: 24.0,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      const Text(
                        "I'm a passionate and results-driven Senior Mobile Application Developer with over 6 years of experience building and maintaining high-performance mobile apps. My expertise spans both native Android development (Java/Kotlin) and cross-platform development using Flutter. I hold a Bachelor of Engineering from the Higher Institute for Engineering & Technology in 6th October City (2018). I have a solid track record in crafting user-friendly mobile experiences, integrating robust backend services (REST APIs, Firebase), and applying state management solutions like Provider, Bloc, Riverpod, and GetX. I thrive in agile environments and am committed to delivering scalable and maintainable code that powers impactful mobile solutions.",
                        style: TextStyle(
                          color: kCaptionColor,
                          height: 1.5,
                          fontSize: 15.0,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Text(
                        "Technologies I have worked with",
                        style: GoogleFonts.josefinSans(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      // Enhanced technology cards
                      ScrollConfiguration(
                        behavior: ScrollConfiguration.of(context)
                            .copyWith(scrollbars: true, dragDevices: {
                          PointerDeviceKind.touch,
                          PointerDeviceKind.mouse,
                        }),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: TechnologyConstants.technologyLearned
                                .map((e) => TechnologyCard(technology: e))
                                .toList(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 70.0),
                    ],
                  ),
                ),
                const SizedBox(width: 25.0),
                if (ScreenHelper.isDesktop(context) ||
                    ScreenHelper.isTablet(context))
                  Expanded(
                    flex: constraints.maxWidth > 720.0 ? 1 : 0,
                    child: Center(
                      child: GlassmorphismProfileImage(
                        width: constraints.maxWidth > 720.0 ? null : 350.0,
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
