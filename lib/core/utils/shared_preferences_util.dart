import 'package:shared_preferences/shared_preferences.dart';
import 'package:logging/logging.dart';

class SharedPreferencesUtil {
  static final Logger _logger = Logger('SharedPreferencesUtil');
  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    _logger.info('SharedPreferences initialized');
  }

  Future<void> setString(String key, String value) async {
    await _prefs.setString(key, value);
    _logger.info('Stored $key in SharedPreferences');
  }

  String? getString(String key) {
    final value = _prefs.getString(key);
    _logger.info('Retrieved $key from SharedPreferences');
    return value;
  }
}
