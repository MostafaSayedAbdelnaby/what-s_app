const String imagePath = "assets/images";
const String iconsPath = "assets/icons";
const String svgPath = "assets/svg_images";

abstract class ImageAssets {
  static const String profile = "$imagePath/profile.jpeg";
  static const String whatsappGrayBg = "$imagePath/whatsapp_gray_bg.png";
  static const String searchIcon = "$imagePath/search.png";
}

class SvgAssets {
  static const String routeLogo = "$svgPath/route.svg";
  static const String eye = "$svgPath/Eye.svg";
}

abstract class IconsAssets {
  static const String iconSend = "$iconsPath/Send.png";
  static const String iconMic = "$iconsPath/Mic.png";
}
