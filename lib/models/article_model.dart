// Article model, using only attributes I want to place in the UI
class Article {
  int id;
  String title;
  String author;
  String? section;
  String? abstract;
  String? publishDate;
  String? thumbnail;
  String? imagePath;

  Article({
    required this.id,
    required this.title,
    required this.author,
    this.section,
    this.abstract,
    this.publishDate,
    this.thumbnail,
    this.imagePath,
  });

  factory Article.fromJson(Map<String, dynamic> responseData) {
    dynamic _thumbnail, _imagePath;

    if (responseData['media'] != null && responseData['media'].isNotEmpty) {
      // Find first media element with type `image` & assign the images
      for (var e in responseData['media']) {
        if (e['type'] == 'image' &&
            e['media-metadata'] != null &&
            e['media-metadata'].length == 3) {
          _thumbnail = e['media-metadata'][0]['url'];
          _imagePath = e['media-metadata'][2]['url'];
          break;
        }
      }
    }

    return Article(
        id: responseData['id'] as int,
        title: responseData['title'] as String,
        author: responseData['byline'] as String,
        section: responseData['section'] as String,
        abstract: responseData['abstract'] as String,
        publishDate: responseData['published_date'] as String,
        thumbnail: _thumbnail,
        imagePath: _imagePath);
  }
}
