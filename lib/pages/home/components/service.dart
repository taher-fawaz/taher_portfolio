import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taher_portfolio/models/name_color.dart';
import 'package:taher_portfolio/pages/home/components/download_button.dart';
import 'package:taher_portfolio/pages/home/components/service_cards.dart';
import 'package:taher_portfolio/provider/theme.dart';
import 'package:taher_portfolio/core/utils/utils.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../models/design_process.dart';
import '../../../core/utils/constants.dart';
import '../../../core/utils/screen_helper.dart';

final List<DesignProcess> designProcesses = [
  DesignProcess(
    title: "Learn",
    imagePath: "assets/images/learn.png",
    subtitle: "",
  ),
  DesignProcess(
    title: "Develop",
    imagePath: "assets/images/develop.png",
    subtitle: "",
  ),
  DesignProcess(
    title: "Deploy",
    imagePath: "assets/images/deploy.png",
    subtitle: "",
  ),
];

class ServiceSection extends StatelessWidget {
  ServiceSection({Key? key}) : super(key: key);
  final whatIDo = [
    NameIconColor(
      title: "Native Mobile App Development",
      iconData: Icons.mobile_friendly,
      color: Colors.green[400]!,
    ),
    NameIconColor(
      title: "Cross-Platform Development",
      iconData: Icons.devices,
      color: Colors.blue[400]!,
    ),
    NameIconColor(
      title: "UI/UX Development",
      iconData: Icons.design_services,
      color: Colors.purple[400]!,
    ),
    NameIconColor(
      title: "API Integration",
      iconData: Icons.api,
      color: Colors.orange[400]!,
    ),
    NameIconColor(
      title: "Game Development",
      iconData: Icons.games_rounded,
      color: Colors.red[400]!,
    ),
    NameIconColor(
      title: "App Store & Play Store Deployment",
      iconData: Icons.cloud_upload,
      color: Colors.teal[400]!,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ScreenHelper(
        desktop: _buildUi(context, kDesktopMaxWidth),
        tablet: _buildUi(context, kTabletMaxWidth),
        mobile: _buildUi(context, getMobileMaxWidth(context)),
      ),
    );
  }

  Widget _buildUi(BuildContext context, double width) {
    return ResponsiveWrapper(
      maxWidth: width,
      minWidth: width,
      defaultScale: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Experienced,\n   Professional",
                style: GoogleFonts.josefinSans(
                  fontWeight: FontWeight.w900,
                  height: 1.8,
                  letterSpacing: 2,
                  fontSize: 18.0,
                ),
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: DownloadButton(),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "What I Do?",
            style: GoogleFonts.josefinSans(
              fontWeight: FontWeight.w900,
              height: 1.3,
              fontSize: 35.0,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Creating innovative mobile solutions with modern technologies",
            style: GoogleFonts.josefinSans(
              color: Colors.grey[400],
              fontSize: 14.0,
            ),
          ),
          SizedBox(
            height: ScreenHelper.isDesktop(context) ? 140 : 70,
          ),
          buildServiceCards(),
          const SizedBox(
            height: 80.0,
          ),
          Container(
            alignment: Alignment.center,
            child: LayoutBuilder(
              builder: (_context, constraints) {
                return ResponsiveGridView.builder(
                  padding: const EdgeInsets.all(0.0),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: ResponsiveGridDelegate(
                    mainAxisSpacing: 20.0,
                    crossAxisSpacing: 20.0,
                    maxCrossAxisExtent: ScreenHelper.isMobile(context)
                        ? constraints.maxWidth / 1.0
                        : ScreenHelper.isTablet(context)
                            ? constraints.maxWidth / 2.0
                            : 450.0,
                    childAspectRatio: 5,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Consumer(
                                builder: (context, ref, _) => Image.asset(
                                  designProcesses[index].imagePath,
                                  width: 40.0,
                                  color: ref.watch(themeProvider).isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              const SizedBox(
                                width: 15.0,
                              ),
                              Text(
                                designProcesses[index].title,
                                style: GoogleFonts.josefinSans(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: designProcesses.length,
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget buildServiceCards() {
    return Consumer(builder: (context, ref, _) {
      return Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.center,
        children: whatIDo
            .map((e) => ServiceCard(
                  iconData: e.iconData,
                  title: e.title,
                  iconColor: e.color,
                ))
            .toList(),
      );
    });
  }
}
