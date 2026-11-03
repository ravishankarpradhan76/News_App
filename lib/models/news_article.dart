class NewsArticle {
  String? status;
  int? totalResults;
  List<Results>? results;
  String? nextPage;

  NewsArticle({this.status, this.totalResults, this.results, this.nextPage});

  NewsArticle.fromJson(Map<String, dynamic> json) {
    status = json['status']?.toString();
    totalResults = json['totalResults'] is int
        ? json['totalResults']
        : int.tryParse(json['totalResults']?.toString() ?? '');
    if (json['results'] != null && json['results'] is List) {
      results = <Results>[];
      for (var v in (json['results'] as List)) {
        if (v is Map<String, dynamic>) {
          results!.add(Results.fromJson(v));
        }
      }
    }
    nextPage = json['nextPage']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['totalResults'] = totalResults;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    data['nextPage'] = nextPage;
    return data;
  }
}

class Results {
  String? articleId;
  String? title;
  String? link;
  List<dynamic>? keywords;
  List<dynamic>? creator;
  dynamic videoUrl;
  String? description;
  String? content;
  String? pubDate;
  String? pubDateTZ;
  String? imageUrl;
  String? sourceId;
  int? sourcePriority;
  String? sourceName;
  String? sourceUrl;
  String? sourceIcon;
  String? language;
  List<dynamic>? country;
  List<dynamic>? category;
  dynamic aiTag;
  String? sentiment;
  dynamic sentimentStats;
  String? aiRegion;
  String? aiOrg;
  bool? duplicate;

  Results(
      {this.articleId,
      this.title,
      this.link,
      this.keywords,
      this.creator,
      this.videoUrl,
      this.description,
      this.content,
      this.pubDate,
      this.pubDateTZ,
      this.imageUrl,
      this.sourceId,
      this.sourcePriority,
      this.sourceName,
      this.sourceUrl,
      this.sourceIcon,
      this.language,
      this.country,
      this.category,
      this.aiTag,
      this.sentiment,
      this.sentimentStats,
      this.aiRegion,
      this.aiOrg,
      this.duplicate});

  Results.fromJson(Map<String, dynamic> json) {
    articleId = json['article_id']?.toString();
    title = json['title']?.toString();
    link = json['link']?.toString();
    keywords = json['keywords'] is List ? json['keywords'] : null;
    creator = json['creator'] is List ? json['creator'] : null;
    videoUrl = json['video_url'];
    description = json['description']?.toString();
    content = json['content']?.toString();
    pubDate = json['pubDate']?.toString();
    pubDateTZ = json['pubDateTZ']?.toString();
    imageUrl = json['image_url']?.toString();
    sourceId = json['source_id']?.toString();
    sourcePriority = json['source_priority'] is int
        ? json['source_priority']
        : int.tryParse(json['source_priority']?.toString() ?? '');
    sourceName = json['source_name']?.toString();
    sourceUrl = json['source_url']?.toString();
    sourceIcon = json['source_icon']?.toString();
    language = json['language']?.toString();
    country = json['country'] is List ? json['country'] : null;
    category = json['category'] is List ? json['category'] : null;
    aiTag = json['ai_tag'];
    sentiment = json['sentiment']?.toString();
    sentimentStats = json['sentiment_stats'];
    aiRegion = json['ai_region']?.toString();
    aiOrg = json['ai_org']?.toString();
    duplicate = json['duplicate'] is bool ? json['duplicate'] : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['article_id'] = articleId;
    data['title'] = title;
    data['link'] = link;
    data['keywords'] = keywords;
    data['creator'] = creator;
    data['video_url'] = videoUrl;
    data['description'] = description;
    data['content'] = content;
    data['pubDate'] = pubDate;
    data['pubDateTZ'] = pubDateTZ;
    data['image_url'] = imageUrl;
    data['source_id'] = sourceId;
    data['source_priority'] = sourcePriority;
    data['source_name'] = sourceName;
    data['source_url'] = sourceUrl;
    data['source_icon'] = sourceIcon;
    data['language'] = language;
    data['country'] = country;
    data['category'] = category;
    data['ai_tag'] = aiTag;
    data['sentiment'] = sentiment;
    data['sentiment_stats'] = sentimentStats;
    data['ai_region'] = aiRegion;
    data['ai_org'] = aiOrg;
    data['duplicate'] = duplicate;
    return data;
  }
}
