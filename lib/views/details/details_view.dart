import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/constants/color_constants.dart';
import 'package:news_app/constants/string_constants.dart';
import 'package:news_app/models/news_article.dart';

class DetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Results article = Get.arguments as Results;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.only(left: 16, bottom: 16),
              title: Text(
                article.sourceName ?? "",
                style: const TextStyle(
                    color: Colors.blue, fontWeight: FontWeight.bold),
              ),
              background: Hero(
                tag: article.articleId ?? 0,
                child: Image.network(
                  article.imageUrl ?? StringConstants.placeholder,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.grey[300],
                    child: const Center(
                        child: Icon(Icons.broken_image,
                            size: 50, color: Colors.grey)),
                  ),
                ),
              ),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: ColorConstant.primary),
              onPressed: () => Get.back(),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title ?? "",
                    style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: article.sourceIcon != null &&
                                article.sourceIcon!.isNotEmpty
                            ? NetworkImage(article.sourceIcon!)
                            : const AssetImage('assets/images/default_icon.png')
                                as ImageProvider,
                        radius: 15,
                        backgroundColor: Colors.transparent,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          article.sourceName ?? "",
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        article.pubDate?.split(' ')[0] ?? "",
                        style:
                            const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Divider(color: Colors.grey[300]),
                  const SizedBox(height: 10),
                  Text(
                    article.description ?? "",
                    style: const TextStyle(
                        fontSize: 16, color: Colors.blue, height: 1.5),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    article.content ?? "",
                    style: const TextStyle(
                        fontSize: 16, color: Colors.red, height: 1.5),
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
