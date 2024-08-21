import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final dio = Dio();
  String api = "http://millima.flutterwithakmaljon.uz/api/";

  Future<void> signUp(
    String name,
    String phone,
    String password,
    String password_confirmation,
  ) async {
    try {
      final result = await dio.post(
        "${api}regis",
        data: {
          "name": name,
          "phone": phone,
          "password": password,
          "password_confirmation": password_confirmation,
        },
      );
    } on DioException catch (e) {
      throw e.response!.data.toString();
    }
  }

  Future<Map<String, dynamic>> signIn(String phone, String password) async {
    try {
      final result = await dio.post(
        "${api}login",
        data: {
          "phone": phone,
          "password": password,
        },
      );

      // Tokenni olib saqlash
      String token = result.data['data']['token'];
      await _saveToken(token);
      print("Foydalanuvchi tizimga kirdi, token saqlandi.");

      // Natijani qaytarish
      return result.data;
    } on DioException catch (e) {
      throw e.response?.data ?? "Login error";
    }
  }

  Future<void> logOut() async {
    try {
      String? token = await _getToken();
      if (token != null) {
        final result = await dio.post(
          "${api}logout",
          options: Options(
            headers: {
              "Authorization": "Bearer $token",
            },
          ),
        );
        print("LogOut muvaffaqiyatli amalga oshirildi: ${result.data}");
        await _removeToken();
      } else {
        print("Token topilmadi.");
      }
    } on DioException catch (e) {
      print("LogOutda xato: ${e.response?.data}");
    }
  }

  // Tokenni saqlash funksiyasi
  Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  // Tokenni olish funksiyasi
  Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  // Tokenni o'chirish funksiyasi
  Future<void> _removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }
}
