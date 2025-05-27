import 'package:taher_portfolio/core/utils/constants.dart';
import 'package:taher_portfolio/core/utils/constants.dart';

class TechnologyModel {
  final String name;
  final String logo;

  TechnologyModel(this.name, this.logo);
}

class TechnologyConstants {
  static TechnologyModel flutter =
      TechnologyModel("Flutter", AppConstants.flutterImage);
  static TechnologyModel dart = TechnologyModel("Dart", AppConstants.dartImage);
  static TechnologyModel kotlin =
      TechnologyModel("Kotlin", AppConstants.kotlinImage);
  static TechnologyModel swift =
      TechnologyModel("Swift", AppConstants.swiftImage);
  static TechnologyModel firebase =
      TechnologyModel("Firebase", AppConstants.firebaseImage);
  static TechnologyModel git = TechnologyModel("Git", AppConstants.gitImage);
  static TechnologyModel figma =
      TechnologyModel("Figma", AppConstants.figmaImage);
  static TechnologyModel restApi =
      TechnologyModel("REST API", AppConstants.restApiImage);
  static TechnologyModel riverpod =
      TechnologyModel("Riverpod", AppConstants.riverpodImage);
  static TechnologyModel bloc = TechnologyModel("BLoC", AppConstants.blocImage);
  static TechnologyModel provider =
      TechnologyModel("Provider", AppConstants.providerImage);
  static TechnologyModel getx = TechnologyModel("GetX", AppConstants.getxImage);

  static List<TechnologyModel> technologyLearned = [
    flutter,
    dart,
    kotlin,
    swift,
    firebase,
    git,
    figma,
    restApi,
    riverpod,
    bloc,
  ];
}
