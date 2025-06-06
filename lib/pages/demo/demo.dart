import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taher_portfolio/models/project.dart';
import 'package:taher_portfolio/pages/courses/course_card.dart';
import 'package:taher_portfolio/pages/demo/components/demo_section.dart';
import 'package:taher_portfolio/pages/home/components/footer.dart';
import 'package:taher_portfolio/core/utils/screen_helper.dart';
import 'package:taher_portfolio/widgets/header.dart';

class DemoScreen extends ConsumerStatefulWidget {
  const DemoScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends ConsumerState<DemoScreen> {
//   late HomeProvider _homeProvider;
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    // _homeProvider = ref.read(homeProvider);
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
                Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    Text(
                      "Demos",
                      style: GoogleFonts.josefinSans(
                        fontWeight: FontWeight.w900,
                        fontSize: 36,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Here are some of my Demos :)",
                      style: GoogleFonts.josefinSans(
                        color: Colors.grey[400],
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    )
                  ],
                )),
                DemoSection(
                  projects: ProjectModel.demos,
                ),
                const SizedBox(
                  height: 80,
                ),
                //courses section
                CoursesSection(),
                const Footer()
              ],
            ),
          ),
        ),
        const CommonHeader(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPage(),
    );
  }
}
