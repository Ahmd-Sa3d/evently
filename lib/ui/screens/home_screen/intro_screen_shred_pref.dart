import 'package:shared_preferences/shared_preferences.dart';


class IntroScreenShredPref {
static const String introKey = 'introScreen';
  static Future <bool> isIntroScreenOpened() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool  isIntroScreenOpened = prefs.getBool(IntroScreenShredPref.introKey)?? true;
    if(isIntroScreenOpened ){
      await prefs.setBool(introKey, false);
    }return isIntroScreenOpened;
  }
}
