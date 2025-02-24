class NewsArticle {
  String? status;
  int? totalResults;
  List<Results>? results;
  String? nextPage;

  NewsArticle({this.status, this.totalResults, this.results, this.nextPage});

  NewsArticle.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
    nextPage = json['nextPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['totalResults'] = this.totalResults;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    data['nextPage'] = this.nextPage;
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
  String? aiTag;
  String? sentiment;
  String? sentimentStats;
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
    articleId = json['article_id'];
    title = json['title'];
    link = json['link'];
    keywords = json['keywords'];
    creator = json['creator'];
    videoUrl = json['video_url'];
    description = json['description'];
    content = json['content'];
    pubDate = json['pubDate'];
    pubDateTZ = json['pubDateTZ'];
    imageUrl = json['image_url'];
    sourceId = json['source_id'];
    sourcePriority = json['source_priority'];
    sourceName = json['source_name'];
    sourceUrl = json['source_url'];
    sourceIcon = json['source_icon'];
    language = json['language'];
    country = json['country'];
    category = json['category'];
    aiTag = json['ai_tag'];
    sentiment = json['sentiment'];
    sentimentStats = json['sentiment_stats'];
    aiRegion = json['ai_region'];
    aiOrg = json['ai_org'];
    duplicate = json['duplicate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['article_id'] = this.articleId;
    data['title'] = this.title;
    data['link'] = this.link;
    data['keywords'] = this.keywords;
    data['creator'] = this.creator;
    data['video_url'] = this.videoUrl;
    data['description'] = this.description;
    data['content'] = this.content;
    data['pubDate'] = this.pubDate;
    data['pubDateTZ'] = this.pubDateTZ;
    data['image_url'] = this.imageUrl;
    data['source_id'] = this.sourceId;
    data['source_priority'] = this.sourcePriority;
    data['source_name'] = this.sourceName;
    data['source_url'] = this.sourceUrl;
    data['source_icon'] = this.sourceIcon;
    data['language'] = this.language;
    data['country'] = this.country;
    data['category'] = this.category;
    data['ai_tag'] = this.aiTag;
    data['sentiment'] = this.sentiment;
    data['sentiment_stats'] = this.sentimentStats;
    data['ai_region'] = this.aiRegion;
    data['ai_org'] = this.aiOrg;
    data['duplicate'] = this.duplicate;
    return data;
  }
}
