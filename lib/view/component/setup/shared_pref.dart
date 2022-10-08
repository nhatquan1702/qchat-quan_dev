import 'package:chat_app/view/component/enum/share_pref_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static final SharedPref singleTon = SharedPref._internal();
  SharedPref._internal();

  static late SharedPreferences prefs;

  static initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  ///get dynamic
  static T getValue<T>(SharedPreferencesKey key) {
    try {
      return prefs.get(key.toString()) as T;
    } catch (error) {
      rethrow;
    }
  }

  ///set dynamic
  static setValue<T>(SharedPreferencesKey key, dynamic value) {
    try {
      if (value != null) {
        switch (T) {
          case int:
            prefs.setInt(key.toString(), value);
            break;
          case String:
            prefs.setString(key.toString(), value);
            break;
          case double:
            prefs.setDouble(key.toString(), value);
            break;
          case bool:
            prefs.setBool(key.toString(), value);
            break;
          default:
            prefs.setString(key.toString(), value);
            break;
        }
      }
    } catch (error) {
      rethrow;
    }
  }
}

