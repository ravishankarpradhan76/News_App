import 'package:get/get.dart';
import '../core/api_service.dart';
import '../models/news_article.dart';

class NewsController extends GetxController {
  var newsList = <Results>[].obs;
  var isLoading = true.obs;
  var filteredNewsList = <Results>[].obs;
  var searchQuery = ''.obs;

  @override
  void onInit() {
    fetchNews();
    super.onInit();
  }

  void fetchNews() async {
    try {
      isLoading(true);
      var fetchedNews = await ApiService().fetchNews();
      newsList.assignAll(fetchedNews); // Store the full list
      filteredNewsList.assignAll(newsList); // Set initially to all news
    } finally {
      isLoading(false);
    }
  }

  void filterNews(String query) {
    searchQuery.value = query;
    if (query.isEmpty) {
      filteredNewsList.assignAll(newsList);
    } else {
      filteredNewsList.assignAll(
        newsList.where((article) =>
            (article.title ?? "").toLowerCase().contains(query.toLowerCase()) ||
            (article.description ?? "")
                .toLowerCase()
                .contains(query.toLowerCase())),
      );
    }
  }
}
