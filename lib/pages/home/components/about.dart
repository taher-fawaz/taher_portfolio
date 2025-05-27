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
                      const SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        "About Me",
                        style: GoogleFonts.josefinSans(
                          fontWeight: FontWeight.w900,
                          height: 1.3,
                          fontSize: 35.0,
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      Text(
                        "I'm Taher Fawaz, A Senior Mobile Application Developer",
                        style: GoogleFonts.josefinSans(
                          fontWeight: FontWeight.bold,
                          height: 1.3,
                          fontSize: 24.0,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        "I’m a passionate and results-driven Senior Mobile Application Developer with over 6 years of experience building and maintaining high-performance mobile apps. My expertise spans both native Android development (Java/Kotlin) and cross-platform development using Flutter. I hold a Bachelor of Engineering from the Higher Institute for Engineering & Technology in 6th October City (2018). I have a solid track record in crafting user-friendly mobile experiences, integrating robust backend services (REST APIs, Firebase), and applying state management solutions like Provider, Bloc, Riverpod, and GetX. I thrive in agile environments and am committed to delivering scalable and maintainable code that powers impactful mobile solutions.",
                        style: TextStyle(
                          color: kCaptionColor,
                          height: 1.5,
                          fontSize: 15.0,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const Text(
                        "Technologies I have worked with",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Consumer(builder: (context, ref, _) {
                        return ScrollConfiguration(
                          behavior: ScrollConfiguration.of(context)
                              .copyWith(scrollbars: true, dragDevices: {
                            PointerDeviceKind.touch,
                            PointerDeviceKind.mouse,
                          }),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: TechnologyConstants.technologyLearned
                                  .map((e) => Container(
                                        decoration: BoxDecoration(
                                          color: ref
                                                  .watch(themeProvider)
                                                  .isDarkMode
                                              ? Colors.grey[800]
                                              : Colors.grey[200],
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0, vertical: 6),
                                        child: InkWell(
                                          onTap: () {},
                                          child: Center(
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                    width: 20,
                                                    height: 20,
                                                    child: Image.asset(e.logo)),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  e.name,
                                                  style: const TextStyle(
                                                    fontSize: 12.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ),
                        );
                      }),
                      const SizedBox(
                        height: 70.0,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 25.0,
                ),
                if (ScreenHelper.isDesktop(context) ||
                    ScreenHelper.isTablet(context))
                  Expanded(
                    flex: constraints.maxWidth > 720.0 ? 1 : 0,
                    child: SvgPicture.asset(
                      AppConstants.personSvg,
                      width: constraints.maxWidth > 720.0 ? null : 350.0,
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
