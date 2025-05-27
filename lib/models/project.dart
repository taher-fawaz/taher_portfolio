import 'package:taher_portfolio/core/routes/routes.dart';
import 'package:taher_portfolio/core/utils/constants.dart';
import 'package:taher_portfolio/models/link.dart';
import 'package:taher_portfolio/models/technology.dart';
import 'package:taher_portfolio/core/routes/routes.dart';
import 'package:taher_portfolio/core/utils/constants.dart';
import 'package:taher_portfolio/models/link.dart';
import 'package:taher_portfolio/models/technology.dart';

class ProjectModel {
  final String project;
  final String title;
  final String description;
  final String? appPhotos;
  final String projectLink;
  final bool internalLink;
  final List<TechnologyModel> techUsed;
  List<LinkModel>? links = [];
  final String? buttonText;

  ProjectModel({
    required this.project,
    required this.title,
    required this.description,
    this.appPhotos,
    required this.projectLink,
    this.internalLink = false,
    required this.techUsed,
    this.buttonText,
    this.links,
  });

  static List<ProjectModel> projects = [
    ProjectModel(
      project: "Government Application",
      title: "Sanad App",
      description:
          "Jordan's official digital gateway to government services, streamlining access for citizens. Responsible for implementing and enhancing functionalities to improve user experience.",
      appPhotos: AppConstants.sanadAppImage,
      projectLink:
          "https://play.google.com/store/apps/details?id=com.modee.sanad&hl=en", // Update with actual link
      techUsed: [
        TechnologyConstants.flutter,
        TechnologyConstants.dart,
        TechnologyConstants.firebase,
        TechnologyConstants.restApi,
        TechnologyConstants.bloc,
      ],
      buttonText: "View Project",
    ),
    ProjectModel(
      project: "Accounting Application",
      title: "Hesabate",
      description:
          "Android application linked to Hesabate accounting software, offering features that facilitate business operations. Designed and implemented new functionalities.",
      appPhotos: AppConstants.hesabateImage,
      projectLink:
          "https://play.google.com/store/apps/details?id=com.MMS.Hesabate&hl=en", // Update with actual link
      techUsed: [
        TechnologyConstants.flutter,
        TechnologyConstants.dart,
        TechnologyConstants.restApi,
        TechnologyConstants.getx,
      ],
      buttonText: "View App",
    ),
    ProjectModel(
      project: "Social Business Platform",
      title: "EZENESS",
      description:
          "Social business media platform that integrates social interaction with e-commerce, enabling users to connect, shop, and earn income.",
      appPhotos: AppConstants.ezenessImage,
      projectLink:
          "https://play.google.com/store/apps/details?id=com.ezeness.utagup&hl=en", // Update with actual link
      techUsed: [
        TechnologyConstants.flutter,
        TechnologyConstants.dart,
        TechnologyConstants.firebase,
        TechnologyConstants.restApi,
        TechnologyConstants.provider,
      ],
      buttonText: "View App",
    ),
    ProjectModel(
      project: "HR Employee App",
      title: "VayRoll",
      description:
          "Mobile application for Trans Skills LLC, providing a comprehensive suite of HR and employee management tools. Developed and enhanced functionalities to improve user experience.",
      appPhotos: AppConstants.vayRollAppImage,
      projectLink:
          "https://apps.apple.com/jp/app/vayroll/id1585984421", // Update with actual link
      techUsed: [
        TechnologyConstants.flutter,
        TechnologyConstants.dart,
        TechnologyConstants.restApi,
        TechnologyConstants.riverpod,
      ],
      buttonText: "View App",
    ),
    ProjectModel(
      project: "Parental Control App",
      title: "Safe To Net Keyboard",
      description:
          "Parental control application that allows parents to monitor and control their children's online activities. Developed and enhanced functionalities to improve user experience.",
      appPhotos: AppConstants.safeToNetImage,
      projectLink:
          "https://play.google.com/store/apps/dev?id=7008829270424616134&hl=en", // Update with actual link
      techUsed: [
        TechnologyConstants.flutter,
        TechnologyConstants.dart,
        TechnologyConstants.kotlin,
        TechnologyConstants.swift,
        TechnologyConstants.restApi,
        TechnologyConstants.provider,
      ],
      buttonText: "View App",
    ),
    ProjectModel(
      project: "Productivity App",
      title: "Flairstech Suite",
      description:
          "Productivity app designed to streamline employee attendance and task management. Developed and refined functionalities to improve user experience.",
      appPhotos: AppConstants.flairstechSuiteImage,
      projectLink:
          "https://play.google.com/store/apps/details?id=com.flairstech.tenroxtimesheet&hl=en", // Update with actual link
      techUsed: [
        TechnologyConstants.flutter,
        TechnologyConstants.dart,
        TechnologyConstants.restApi,
        TechnologyConstants.provider,
      ],
      buttonText: "View App",
    ),
    ProjectModel(
      project: "Web Interface App",
      title: "NTG Apps",
      description:
          "Mobile interface for web applications that includes multiple modules. Developed and enhanced modules ensuring seamless integration with web applications.",
      appPhotos: AppConstants.ntgAppsImage,
      projectLink:
          "https://apps.apple.com/eg/app/ntg-apps/id1533118395", // Update with actual link
      techUsed: [
        TechnologyConstants.flutter,
        TechnologyConstants.dart,
        TechnologyConstants.restApi,
        TechnologyConstants.bloc,
      ],
      buttonText: "View App",
    ),
  ];

  static List<ProjectModel> demos = [
    ProjectModel(
      project: "Flutter Web App",
      title: "Flutter Web Portfolio",
      description:
          "Personal portfolio website built with Flutter Web showcasing my mobile development skills and projects.",
      appPhotos: AppConstants.portfolioGif,
      projectLink: "https://github.com/taher-fawaz", // Update with your repo
      techUsed: [
        TechnologyConstants.flutter,
        TechnologyConstants.dart,
        TechnologyConstants.riverpod,
      ],
      buttonText: "Github Link",
    ),
  ];
}
