class ApiConstants {
  ///NEW BASE URL
  // static const String baseUrl = '.tqi.com.br:443';
  // static const String baseUrl = ':9090';
  static const String baseUrl =
      String.fromEnvironment('BASE_URL', defaultValue: '.tqi.com.br:443');

  ///Api complement
  // static const String complement = '/mentorme-tqi';
  // static const String complement = '/';
  static const String complement =
      String.fromEnvironment('COMPLEMENT', defaultValue: '/mentorme-tqi');

  ///API Types
  // static const String mentormeEnv = 'https://mentorme';
  // static const String mentormeEnv = 'http://localhost';
  static const String mentormeEnv =
      String.fromEnvironment('MENTORME_ENV', defaultValue: 'https://mentorme');

  ///Enviroments
  static const String qaEnv = '-qa.';
  static const String hmlEnv = '-dev.';
  static const String prdEnv = '.';
}
