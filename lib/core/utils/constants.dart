import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:taher_portfolio/core/utils/utils.dart';
import 'package:taher_portfolio/models/header_item.dart';

const Color kPrimaryColor = Color(0xFFFFD800);
const Color kBackgroundColor = Color.fromRGBO(7, 17, 26, 1);
const Color kDangerColor = Color.fromARGB(255, 243, 22, 22);
const Color kCaptionColor = Color.fromRGBO(166, 177, 187, 1);

// Lets replace all static sizes
const double kDesktopMaxWidth = 1000.0;
const double kTabletMaxWidth = 760.0;
double getMobileMaxWidth(BuildContext context) =>
    MediaQuery.of(context).size.width * .8;

class AppConstants {
  static const linkedInUrl =
      "https://www.linkedin.com/in/taher-fawaz-0141b9168/"; // Update with your LinkedIn
  static const youtubeUrl =
      "https://www.youtube.com/@taherfawaz4994/"; // Update with your Instagram
  static const githubUrl =
      "https://github.com/taher-fawaz"; // Update with your GitHub
  static const mediumUrl =
      "https://medium.com/@taher.abd1010"; // Update with your Medium
  static const tiktokUrl = "https://www.tiktok.com/@taher_t10";
  static const _assets = "assets/";
  static const _outputs = "outputs/";

  static const _svg = _assets + "svg/";
  static const guySvg = _svg + "guy.svg";
  static const _images = _assets + "images/";

  static const personPng = _images + "profile.png";

  static const _techImages = _images + "technology/";
  static const flutterImage = _techImages + "flutter.png";
  static const dartImage = _techImages + "dart.png";
  static const kotlinImage = _techImages + "kotlin.png";
  static const swiftImage = _techImages + "swift.png";
  static const firebaseImage = _techImages + "firebase.png";
  static const gitImage = _techImages + "git.png";
  static const figmaImage = _techImages + "figma.png";
  static const restApiImage = _techImages + "rest_api.png";
  static const riverpodImage = _techImages + "riverpod.png";
  static const blocImage = _techImages + "bloc.png";
  static const providerImage = _techImages + "provider.jpg";
  static const getxImage = _techImages + "getx.jpg";

  static const _projectsImages = _images + "projects/";
  static const sanadAppImage = _projectsImages + "sanad.jpg";
  static const hesabateImage = _projectsImages + "hesabate.png";
  static const ezenessImage = _projectsImages + "ezeness.jpg";
  static const safeToNetImage = _projectsImages + "safetonet.png";
  static const flairstechSuiteImage = _projectsImages + "flairstech_suite.jpg";
  static const ntgAppsImage = _projectsImages + "ntg.png";
  static const vayRollAppImage = _projectsImages + "vayroll.png";

  static const _gifs = _outputs + "gif/";
  static const portfolioGif = _gifs + "mobile.gif";

  static List<NameOnTap> socialLoginDatas = [
    NameOnTap(
        title: "Email",
        iconData: Icons.mail_outline_rounded,
        onTap: () {
          Utilty.openMail();
        }),
    NameOnTap(
        title: "LinkedIN",
        iconData: FontAwesomeIcons.linkedinIn,
        onTap: () {
          Utilty.openUrl(linkedInUrl);
        }),
    NameOnTap(
        title: "YouTube",
        iconData: FontAwesomeIcons.youtube,
        onTap: () {
          Utilty.openUrl(youtubeUrl);
        }),
    NameOnTap(
        title: "Github",
        iconData: FontAwesomeIcons.github,
        onTap: () {
          Utilty.openUrl(githubUrl);
        }),
    NameOnTap(
        title: "Medium",
        iconData: FontAwesomeIcons.medium,
        onTap: () {
          Utilty.openUrl(mediumUrl);
        }),
    NameOnTap(
        title: "TikTok",
        iconData: FontAwesomeIcons.tiktok,
        onTap: () {
          Utilty.openUrl(tiktokUrl);
        }),
  ];
}
