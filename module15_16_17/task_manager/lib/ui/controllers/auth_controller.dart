import 'package:shared_preferences/shared_preferences.dart';
/// A controller class to manage authentication-related operations.
class AuthController{
  static final String _accessTokenKey='access-token';
  static String? accessToken;

  /// Saves the access token to shared preferences.
  ///
  /// \param token The access token to be saved.
  static Future<void> saveAccessToken (String token) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_accessTokenKey,token);
  }

  /// Retrieves the access token from shared preferences.
  ///
  /// \returns The access token if it exists, otherwise null.
  static Future<String?> getAccessToken() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token=sharedPreferences.getString(_accessTokenKey);
    accessToken=token;
    return token;
  }

  /// Checks if the user is logged in.
  ///
  /// \returns True if the access token is not null, otherwise false.
  static bool loggedIn(){
    return accessToken!=null;
  }

  /// Clears the user data from shared preferences.
  static Future<void> clearUserData ()async{
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    sharedPreferences.clear();
    accessToken=null;
  }

}