class ApiConstants {
  static const String baseUrl = 'https://api.escuelajs.co/api/v1/';
  static const String cartBaseUrl = 'https://dummyjson.com/';
  // ================= Auth =================
 static const String token = 'token';
  static const String accessToken = 'access_token';
  static const String refreshToken = 'refresh_token';
  static const String accessTokenValue =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImlhdCI6MTc4Mzc2NjYyNCwiZXhwIjoxNzg1NDk0NjI0fQ.hTAp1_3ykCftx-pKwmRjswFB7SXp7SiS9uFU-nXP6Ts';
  static const String email = 'email';
  static const String password = 'password';


  // ================= Products =================
  static const String title = 'title';
  static const String price = 'price';
  static const String description = 'description';
  static const String images = 'images';
  static const String category = 'category';

  // ================= Categories =================
  static const String name = 'name';
  static const String id = 'id';
  static const String categoryId = 'categoryId';

  // ================= Cart =================
  static const String carts = "carts";
  static const String products = "products";
  static const String thumbnail = "thumbnail";
  static const String image = "image";
  static const String quantity = "quantity";
  static const String total = "total";
  static const String discountPercentage = "discountPercentage";
  static const String discountedTotal = "discountedTotal";
  static const String userId = "userId";
  static const String totalProducts = "totalProducts";
  static const String totalQuantity = "totalQuantity";
  static const discountedPrice = "discountedPrice";

  // ================= Location =================
  static const String latitude = "latitude";
  static const String longitude = "longitude";
}

class EndPoints {
  static const String login = "auth/login";
  static const String products = "products";
  static const String categories = "categories";
  static const String cart = "carts/user/1";
  static const String addToCart = "carts/add";
  static const String locations = "locations";
}
