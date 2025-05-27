import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taher_portfolio/provider/theme.dart';

class ServiceCard extends StatefulWidget {
  final IconData iconData;
  final String title;
  final Color iconColor;

  const ServiceCard({
    Key? key,
    required this.iconData,
    required this.title,
    required this.iconColor,
  }) : super(key: key);

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard>
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
          height: isHovered ? 280 : 260, // Bigger card size
          width: isHovered ? 280 : 260, // Bigger card size
          margin: const EdgeInsets.all(20),
          transform: isHovered
              ? (Matrix4.identity()..translate(0.0, -12.0, 0.0))
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
                    ? const Color(0xFF8B5CF6).withOpacity(isHovered ? 0.6 : 0.3)
                    : const Color(0xFFEC4899)
                        .withOpacity(isHovered ? 0.6 : 0.3),
                blurRadius: isHovered ? 50.0 : 30.0,
                spreadRadius: isHovered ? 10.0 : 2.0,
                offset: Offset(0, isHovered ? 16.0 : 10.0),
              ),
              // Secondary RGB glow for more vibrant effect
              if (isHovered) ...[
                BoxShadow(
                  color: isDark
                      ? const Color(0xFF06B6D4).withOpacity(0.5)
                      : const Color(0xFFF59E0B).withOpacity(0.5),
                  blurRadius: 40.0,
                  spreadRadius: 6.0,
                  offset: const Offset(0, 12.0),
                ),
                BoxShadow(
                  color: isDark
                      ? const Color(0xFF3B82F6).withOpacity(0.4)
                      : const Color(0xFFFF6B6B).withOpacity(0.4),
                  blurRadius: 60.0,
                  spreadRadius: 14.0,
                  offset: const Offset(0, 20.0),
                ),
              ],
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
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: isDark
                        ? Colors.white.withOpacity(isHovered ? 0.1 : 0.05)
                        : Colors.white.withOpacity(isHovered ? 0.8 : 0.7),
                    border: Border.all(
                      color: isDark
                          ? Colors.white.withOpacity(isHovered ? 0.3 : 0.1)
                          : Colors.white.withOpacity(isHovered ? 0.5 : 0.3),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Enhanced icon container with gradient background
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: isHovered ? 100 : 90,
                        height: isHovered ? 100 : 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          gradient: RadialGradient(
                            colors: [
                              widget.iconColor
                                  .withOpacity(isHovered ? 0.3 : 0.2),
                              widget.iconColor
                                  .withOpacity(isHovered ? 0.1 : 0.05),
                            ],
                          ),
                          border: Border.all(
                            color: widget.iconColor
                                .withOpacity(isHovered ? 0.5 : 0.3),
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: widget.iconColor
                                  .withOpacity(isHovered ? 0.4 : 0.2),
                              blurRadius: isHovered ? 20.0 : 10.0,
                              spreadRadius: isHovered ? 2.0 : 0.0,
                            ),
                          ],
                        ),
                        child: AnimatedScale(
                          duration: const Duration(milliseconds: 300),
                          scale: isHovered ? 1.1 : 1.0,
                          child: Icon(
                            widget.iconData,
                            color: widget.iconColor,
                            size: isHovered ? 50 : 45,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Enhanced title with better typography
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          widget.title,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.josefinSans(
                            color: isDark
                                ? (isHovered ? Colors.white : Colors.grey[300])
                                : (isHovered
                                    ? Colors.black87
                                    : Colors.grey[700]),
                            fontSize: isHovered ? 18 : 16,
                            fontWeight: FontWeight.w800,
                            height: 1.3,
                          ),
                        ),
                      ),
                      // Subtle animated indicator
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: isHovered ? 40 : 20,
                        height: 3,
                        margin: const EdgeInsets.only(top: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
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
