class R {
  static Strings string = Strings();
  static SVGImages svg = SVGImages();
  static LottieFiles lottie = LottieFiles();
  static AudioFiles audio = AudioFiles();
  static Placeholders placeholders = Placeholders();
}

class Placeholders {
  Placeholders();

  String johDoeImage =
      "https://pbs.twimg.com/profile_images/1057989852942270464/bt45DHmR.jpg";
}

class Strings {
  String appName = "Productive";
  String loginWithGoogle = "Continue With Google";
  String todo = "Todo";
  String addTodo = "+ Add Todo";
}

class SVGImages {
  String homeIcon = "assets/images/home.svg";
  String statsIcon = "assets/images/stats.svg";
  String googleIcon = "assets/images/google.svg";
  String successIcon = "assets/images/success.svg";
}

class LottieFiles {
  String paperPlane = "assets/lottie/paper_plane.json";
}

class AudioFiles {
  String splashBreeze = "assets/sounds/wind.mp3";
  String welcomeTone = "assets/sounds/point.mp3";
}
