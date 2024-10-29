class CategoriesEntity {
  final String nameCategory;
  final String imageCategory;
  final int idCategory;
  final String detailsCategory;
  final List<SubCategoriesEntity> subCategories;

  CategoriesEntity({
    required this.idCategory,
    required this.nameCategory,
    required this.imageCategory,
    required this.detailsCategory,
    required this.subCategories,
  });
}

class SubCategoriesEntity {
  final String nameSubCategory;
  final String imageSubCategory;
  final int idSubCategory;
  final String detailsSubCategory;

  SubCategoriesEntity({
    required this.idSubCategory,
    required this.nameSubCategory,
    required this.imageSubCategory,
    required this.detailsSubCategory,
  });
}
