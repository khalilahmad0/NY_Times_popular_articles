// APIUrl class containing endpoint variables
class APIUrl {
  static const String basePath = 'https://api.nytimes.com';

  static const String section = 'all-sections';

  //TODO Should be placed in an environment variable
  static const String apiKey = 'p4eUnr7ZzjEO00sqDzp2dGN9hwJVp7HD';

  static const String period = '7';

  static const String popularArticlesPath =
      '$basePath/svc/mostpopular/v2/mostviewed/$section/$period.json?api-key=$apiKey';

}
