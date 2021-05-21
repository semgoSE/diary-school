import 'package:vibrate/vibrate.dart';

class Vibrations {
  static bool isVibrate = false;

  static void success() async {
    if (isVibrate) {
      Vibrate.feedback(FeedbackType.success);
    }
  }

  static void warning() async {
    Vibrate.feedback(FeedbackType.warning);
  }

  static void canVibrate() async {
    isVibrate = await Vibrate.canVibrate;
  }
}
