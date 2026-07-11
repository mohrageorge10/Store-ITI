class ApiConstants {
  static const String baseUrl = 'https://api.escuelajs.co/api/v1/';
  // ================= Auth =================
  static const String accessToken = 'access_token';
  static const String accessTokenValue =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImlhdCI6MTc4Mzc2NjYyNCwiZXhwIjoxNzg1NDk0NjI0fQ.hTAp1_3ykCftx-pKwmRjswFB7SXp7SiS9uFU-nXP6Ts';
  static const String email = 'email';
  static const String password = 'password';

  // ================= Products =================
  static const String title = 'title';
  static const String price = 'price';
  static const String description = 'description';
  static const String images = 'images';

}

class EndPoints {
  static const String login = "auth/login";
  static const String products = "products";
}
