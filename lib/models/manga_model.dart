class MangaModel {
  final String id;
  final String title;
  final String coverImageUrl;
  final String description;
  final List<ChapModel> chapters;
  final String author;

  MangaModel({
    required this.id,
    required this.title,
    required this.coverImageUrl,
    required this.description,
    required this.chapters,
    required this.author,
  });

  factory MangaModel.fromJson(Map<String, dynamic> json) {
    return MangaModel(
      id: json['id'] as String,
      title: json['title'] as String,
      coverImageUrl: json['cover_image_url'] as String,
      description: json['description'] as String,
      chapters: (json['chapters'] as List)
          .map((e) => ChapModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      author: json['author'] as String,
    );
  }
}

class ChapModel {
  final String id;
  final String chapterTitle;
  final String chapterNumber;
  final List<String> pages;

  ChapModel({
    required this.id,
    required this.chapterTitle,
    required this.chapterNumber,
    required this.pages
  });
  factory ChapModel.fromJson(Map<String, dynamic> json) {
    return ChapModel(
      id: json['id'] as String,
      chapterTitle: json['chapter_title'] as String,
      chapterNumber: json['chapter_number'] as String,
      pages: (json['pages'] as List).map((e) => e as String).toList(),
    );
  }
}