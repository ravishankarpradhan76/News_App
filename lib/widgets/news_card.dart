import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/constants/color_constants.dart';
import 'package:news_app/constants/string_constants.dart';
import 'package:news_app/core/theme_service.dart';
import 'package:news_app/viewmodels/news_controller.dart';
import '../models/news_article.dart';

class NewsCard extends StatelessWidget {
  final Results article;

  const NewsCard({required this.article, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeService themeService = Get.put(ThemeService());
    return GestureDetector(
        onTap: () => Get.toNamed('/details', arguments: article),
        child: TweenAnimationBuilder(
            duration: const Duration(milliseconds: 500),
            tween: Tween<double>(begin: 0, end: 1),
            curve: Curves.easeOutExpo,
            builder: (context, double value, child) {
              return Transform.translate(
                  offset: Offset(0, 50 * (1 - value)),
                  child: Transform.scale(
                      scale: value,
                      child: Opacity(
                        opacity: value,
                        child: Dismissible(
                          key: Key(article.articleId.toString() ?? ""),
                          direction: DismissDirection.endToStart,
                          onDismissed: (direction) {
                            final newsController = Get.find<NewsController>();
                            newsController.filteredNewsList.removeWhere(
                                (item) => item.articleId == article.articleId);
                          },
                          background: Container(
                            color: Colors.red,
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child:
                                const Icon(Icons.delete, color: Colors.white),
                          ),
                          child: Card(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            elevation: 5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Hero(
                                  tag: article.articleId ?? 0,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(12)),
                                    child: Image.network(
                                      article.imageUrl ??
                                          StringConstants.placeholder,
                                      height: 180,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              Container(
                                        height: 180,
                                        color: Colors.grey[300],
                                        child: const Center(
                                            child: Icon(Icons.broken_image,
                                                size: 50, color: Colors.grey)),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        article.title ?? "",
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 6),
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                article.sourceIcon ?? ''),
                                            radius: 12,
                                            backgroundColor: Colors.transparent,
                                          ),
                                          const SizedBox(width: 8),
                                          Expanded(
                                            child: Text(
                                              article.sourceName ?? "",
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          const Spacer(),
                                          Text(
                                            article.pubDate?.split(' ')[0] ??
                                                "",
                                            style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        article.description ?? "",
                                        style: const TextStyle(
                                            fontSize: 14, color: Colors.blue),
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )));
            }));
  }
}
