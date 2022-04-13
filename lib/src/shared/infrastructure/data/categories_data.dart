import '../../domain/models/category_product_app_model.dart';
import '../../domain/models/intl_model.dart';

final categoriesApp = [
  CategoryProductAppModel(
    id: 'PANTS',
    pictureUrl: 'assets/icons/categories/jeans.png',
    nameIntl: IntlModel(
      es: 'Pantalón',
      en: 'Pants',
    ),
  ),
  CategoryProductAppModel(
    id: 'SHOES',
    pictureUrl: 'assets/icons/categories/shoe.png',
    nameIntl: IntlModel(
      es: 'Zapatos',
      en: 'Shoes',
    ),
  ),
  CategoryProductAppModel(
    id: 'TSHIRTS',
    pictureUrl: 'assets/icons/categories/tshirt.png',
    nameIntl: IntlModel(
      es: 'Camisetas',
      en: 'tShirts',
    ),
  ),
  CategoryProductAppModel(
    id: 'SWEATSHIRTS',
    pictureUrl: 'assets/icons/categories/informal.png',
    nameIntl: IntlModel(
      es: 'Sudaderas',
      en: 'Sweatshirts',
    ),
  ),
  CategoryProductAppModel(
    id: 'CAPS',
    pictureUrl: 'assets/icons/categories/cap.png',
    nameIntl: IntlModel(
      es: 'Gorras',
      en: 'Caps',
    ),
  ),
  CategoryProductAppModel(
    id: 'DRESSES',
    pictureUrl: 'assets/icons/categories/dress.png',
    nameIntl: IntlModel(
      es: 'Vestidos',
      en: 'Dresses',
    ),
  ),
];
