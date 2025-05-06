import 'package:shared_preferences/shared_preferences.dart';

class UserPersistence {
  static const String USER_ID_KEY = 'user_id';
  static const String USER_EMAIL_KEY = 'user_email';
  static const String IS_LOGGED_IN_KEY = 'is_logged_in';

  // Save user data to local storage
  static Future<void> saveUserData(
    String userId, {
    String? email,
    String? name,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(USER_ID_KEY, userId);
    await prefs.setBool(IS_LOGGED_IN_KEY, true);

    if (email != null) {
      await prefs.setString(USER_EMAIL_KEY, email);
    }
  }

  // Check if user is logged in
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(IS_LOGGED_IN_KEY) ?? false;
  }

  // Get user ID
  static Future<String?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(USER_ID_KEY);
  }

  // Get user email
  static Future<String?> getUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(USER_EMAIL_KEY);
  }

  // Clear user data on logout
  static Future<void> clearUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(USER_ID_KEY);
    await prefs.remove(USER_EMAIL_KEY);
    await prefs.setBool(IS_LOGGED_IN_KEY, false);
  }
}
