import 'package:url_launcher/url_launcher.dart';

class Utilty {
  static Future<void> openUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  static Future<void> openMail() => openUrl("mailto:taher.abd1010@gmail.com");

  static Future<void> openMyLocation() => openUrl(
      "https://maps.google.com/?q=Zhraa+Maadi,+Cairo,+Egypt"); // Updated to your location

  static Future<void> openMyPhoneNo() =>
      openUrl("tel:+201091411718"); // Updated to your phone

  static Future<void> openWhatsapp() =>
      openUrl("https://wa.me/201091411718"); // Updated to your WhatsApp
}
