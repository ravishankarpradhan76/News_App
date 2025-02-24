import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/constants/color_constants.dart';
import 'package:news_app/constants/string_constants.dart';
import 'package:news_app/core/api_service.dart';
import 'package:news_app/core/theme_service.dart';
import '../../viewmodels/news_controller.dart';
import '../../widgets/news_card.dart';
import '../../widgets/shimmer_loader.dart';

class HomeView extends StatelessWidget {
  final NewsController controller = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorConstant.primary,
          title: const Text(
            StringConstants.appName,
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w300,
                color: ColorConstant.whiteText),
          ),
          actions: [
            GetBuilder<ThemeService>(
              init: ThemeService(),
              builder: (controller) => IconButton(
                icon: Icon(
                  controller.isDarkMode.value
                      ? Icons.dark_mode
                      : Icons.light_mode,
                  color: Colors.white,
                ),
                onPressed: controller.toggleTheme,
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (query) => controller.filterNews(query),
                decoration: InputDecoration(
                  hintText: StringConstants.searchArticles,
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: ColorConstant.textFieldColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: _refreshNews,
          child: Obx(() {
            if (controller.isLoading.value) {
              return ShimmerLoader();
            }
            if (controller.filteredNewsList.isEmpty) {
              return const Center(child: Text(StringConstants.noResultsFound));
            }

            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: controller.filteredNewsList.length,
              itemBuilder: (context, index) {
                return _buildAnimatedItem(
                    controller.filteredNewsList[index], index);
              },
            );
          }),
        ));
  }

  Widget _buildAnimatedItem(article, int index) {
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 500 + (index * 100)), // Delay effect
      tween: Tween<double>(begin: 0, end: 1),
      curve: Curves.easeOutExpo, // Smooth easing effect
      builder: (context, double value, child) {
        return Transform.translate(
          offset: Offset(0, 50 * (1 - value)), // Slide-in effect from bottom
          child: Transform.scale(
            scale: value, // Scale up effect
            child: Opacity(
              opacity: value,
              child: NewsCard(article: article),
            ),
          ),
        );
      },
    );
  }

  // Function to refresh the news list
  Future<void> _refreshNews() async {
    await ApiService().fetchNews();
  }
}
