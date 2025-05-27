import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taher_portfolio/core/routes/routes.dart';
import 'package:taher_portfolio/core/utils/constants.dart';
import 'package:taher_portfolio/models/carousel_item_model.dart';
import 'package:taher_portfolio/provider/theme.dart';

class GlassmorphismButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;

  const GlassmorphismButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  State<GlassmorphismButton> createState() => _GlassmorphismButtonState();
}

class _GlassmorphismButtonState extends State<GlassmorphismButton> {
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
          height: isHovered ? 52.0 : 48.0,
          transform: isHovered
              ? (Matrix4.identity()..translate(0.0, -2.0, 0.0))
              : Matrix4.identity(),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: LinearGradient(
              colors: isDark
                  ? [
                      const Color(0xFF8B5CF6)
                          .withOpacity(isHovered ? 1.0 : 0.9),
                      const Color(0xFF06B6D4)
                          .withOpacity(isHovered ? 1.0 : 0.9),
                    ]
                  : [
                      const Color(0xFFEC4899)
                          .withOpacity(isHovered ? 1.0 : 0.9),
                      const Color(0xFFF59E0B)
                          .withOpacity(isHovered ? 1.0 : 0.9),
                    ],
            ),
            boxShadow: [
              BoxShadow(
                color: isDark
                    ? const Color(0xFF8B5CF6).withOpacity(isHovered ? 0.6 : 0.4)
                    : const Color(0xFFEC4899)
                        .withOpacity(isHovered ? 0.6 : 0.4),
                blurRadius: isHovered ? 25.0 : 15.0,
                spreadRadius: isHovered ? 4.0 : 0.0,
                offset: Offset(0, isHovered ? 8.0 : 4.0),
              ),
              if (isHovered) ...[
                BoxShadow(
                  color: isDark
                      ? const Color(0xFF06B6D4).withOpacity(0.4)
                      : const Color(0xFFF59E0B).withOpacity(0.4),
                  blurRadius: 20.0,
                  spreadRadius: 2.0,
                  offset: const Offset(0, 6.0),
                ),
              ],
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.2),
                    width: 1,
                  ),
                ),
                child: TextButton(
                  onPressed: widget.onPressed,
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  ),
                  child: Text(
                    widget.text,
                    style: GoogleFonts.josefinSans(
                      color: Colors.white,
                      fontSize: isHovered ? 14.0 : 13.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
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

class GlassmorphismSocialIcon extends StatefulWidget {
  final IconData iconData;
  final VoidCallback onTap;

  const GlassmorphismSocialIcon({
    Key? key,
    required this.iconData,
    required this.onTap,
  }) : super(key: key);

  @override
  State<GlassmorphismSocialIcon> createState() =>
      _GlassmorphismSocialIconState();
}

class _GlassmorphismSocialIconState extends State<GlassmorphismSocialIcon> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final isDark = ref.watch(themeProvider).isDarkMode;

      return Padding(
        padding: const EdgeInsets.all(4.0),
        child: MouseRegion(
          onEnter: (_) => setState(() => isHovered = true),
          onExit: (_) => setState(() => isHovered = false),
          cursor: SystemMouseCursors.click,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            width: isHovered ? 44 : 40,
            height: isHovered ? 44 : 40,
            margin: const EdgeInsets.all(5),
            transform: isHovered
                ? (Matrix4.identity()..translate(0.0, -4.0, 0.0))
                : Matrix4.identity(),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
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
              borderRadius: BorderRadius.circular(22),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: isDark
                        ? Colors.white.withOpacity(isHovered ? 0.1 : 0.05)
                        : Colors.white.withOpacity(isHovered ? 0.8 : 0.7),
                  ),
                  child: InkWell(
                    onTap: widget.onTap,
                    borderRadius: BorderRadius.circular(22),
                    child: Center(
                      child: AnimatedScale(
                        duration: const Duration(milliseconds: 300),
                        scale: isHovered ? 1.2 : 1.0,
                        child: FaIcon(
                          widget.iconData,
                          color: isDark
                              ? (isHovered
                                  ? const Color(0xFF8B5CF6)
                                  : Colors.white.withOpacity(0.8))
                              : (isHovered
                                  ? const Color(0xFFEC4899)
                                  : Colors.black.withOpacity(0.7)),
                          size: isHovered ? 18 : 16,
                        ),
                      ),
                    ),
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

List<CarouselItemModel> carouselItems(
        double carouselContainerHeight, BuildContext context) =>
    List.generate(
      5,
      (index) => CarouselItemModel(
        text: SizedBox(
          height: carouselContainerHeight,
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Enhanced title with gradient effect
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        gradient: LinearGradient(
                          colors: [
                            kPrimaryColor.withOpacity(0.2),
                            kPrimaryColor.withOpacity(0.1),
                          ],
                        ),
                        border: Border.all(
                          color: kPrimaryColor.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        "Senior Software Engineer".toUpperCase(),
                        style: GoogleFonts.josefinSans(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w900,
                          fontSize: 18.0,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    // Enhanced name with text shadow
                    Text(
                      "Taher Fawaz".toUpperCase(),
                      style: GoogleFonts.josefinSans(
                        fontSize: 60.0,
                        fontWeight: FontWeight.w900,
                        height: 1.3,
                        letterSpacing: 2.3,
                        shadows: [
                          Shadow(
                            offset: const Offset(2, 2),
                            blurRadius: 8,
                            color: Colors.black.withOpacity(0.3),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    // Enhanced description with better styling
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black.withOpacity(0.1),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Senior Mobile Application Developer, ",
                            style: TextStyle(
                              color: kCaptionColor,
                              fontSize: 15.0,
                              height: 1.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(
                            Icons.location_on,
                            color: kCaptionColor,
                            size: 16,
                          ),
                          SizedBox(width: 4),
                          Text(
                            "Cairo, Egypt",
                            style: TextStyle(
                              color: kCaptionColor,
                              fontSize: 15.0,
                              height: 1.0,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 32.0),
                    // Enhanced glassmorphism button
                    GlassmorphismButton(
                      onPressed: () {
                        context.pushNamed(Routes.videoDownloader);
                      },
                      text: "Let's Talk",
                    ),
                  ],
                ),
              ),
              // Enhanced social media icons with glassmorphism
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.black.withOpacity(0.1),
                        Colors.black.withOpacity(0.05),
                      ],
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white.withOpacity(0.1),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.2),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: AppConstants.socialLoginDatas
                              .map((e) => GlassmorphismSocialIcon(
                                    iconData: e.iconData!,
                                    onTap: e.onTap,
                                  ))
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        image: Container(
          child: SvgPicture.asset(AppConstants.guySvg,
              semanticsLabel: 'Developer'),
        ),
      ),
    );
