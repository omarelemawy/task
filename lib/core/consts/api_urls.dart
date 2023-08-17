class ApiUrls {
  // static const String baseUrl = 'https://events.codeella.com/api';
  static const String baseUrl = 'https://newsapi.org/v1';
  static const String apiKey = 'e2acfeaed99c4a7088b8e12b5476beb5';

  static String get articles => '$baseUrl/articles';

  static Map<String, String> getHeaders({String? token}) => {
        if (token != null && token.isNotEmpty) 'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      };
}
