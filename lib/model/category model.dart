import 'package:news/utils/assets%20manager.dart';

class CategoryModel {
  String id;
  String title;
  String imagePath;

  // bool isDark;

  CategoryModel({
    required this.id,
    required this.title,
    required this.imagePath,
  });

  static List<CategoryModel> getCategoryList(bool isDark) {
    return [
      CategoryModel(
        id: 'general',
        title: 'General',
        imagePath:
            isDark ? AssetsManager.generalWhite : AssetsManager.generalBlack,
      ),
      CategoryModel(
        id: 'business',
        title: 'Business',
        imagePath:
            isDark ? AssetsManager.businessWhite : AssetsManager.businessBlack,
      ),
      CategoryModel(
        id: 'sports',
        title: 'Sports',
        imagePath:
            isDark ? AssetsManager.sportsWhite : AssetsManager.sportsBlack,
      ),
      CategoryModel(
        id: 'technology',
        title: 'Technology',
        imagePath: isDark
            ? AssetsManager.technologyWhite
            : AssetsManager.technologyBlack,
      ),
      CategoryModel(
        id: 'entertainment',
        title: 'Entertainment',
        imagePath: isDark
            ? AssetsManager.entertainmentWhite
            : AssetsManager.entertainmentBlack,
      ),
      CategoryModel(
        id: 'health',
        title: 'Health',
        imagePath:
            isDark ? AssetsManager.healthWhite : AssetsManager.healthBlack,
      ),
      CategoryModel(
        id: 'science',
        title: 'Science',
        imagePath:
            isDark ? AssetsManager.scienceWhite : AssetsManager.scienceBlack,
      ),
    ];
  }
}
