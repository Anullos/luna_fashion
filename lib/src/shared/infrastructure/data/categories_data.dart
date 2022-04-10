import '../../domain/models/category_product_app_model.dart';
import '../../domain/models/intl_model.dart';

final categoriesApp = [
  CategoryProductAppModel(
    id: 'PANTS',
    pictureUrl: 'pictureUrl',
    nameIntl: IntlModel(
      es: 'Pantalón',
      en: 'Pants',
    ),
  ),
  CategoryProductAppModel(
    id: 'SHOES',
    pictureUrl: 'pictureUrl',
    nameIntl: IntlModel(
      es: 'Zapatos',
      en: 'Shoes',
    ),
  ),
  CategoryProductAppModel(
    id: 'TSHIRTS',
    pictureUrl: 'pictureUrl',
    nameIntl: IntlModel(
      es: 'Camisetas',
      en: 'tShirts',
    ),
  ),
  CategoryProductAppModel(
    id: 'SWEATSHIRTS',
    pictureUrl: 'pictureUrl',
    nameIntl: IntlModel(
      es: 'Sudaderas',
      en: 'Sweatshirts',
    ),
  ),
  CategoryProductAppModel(
    id: 'CAPS',
    pictureUrl: 'pictureUrl',
    nameIntl: IntlModel(
      es: 'Gorras',
      en: 'Caps',
    ),
  ),
  CategoryProductAppModel(
    id: 'DRESSES',
    pictureUrl: 'pictureUrl',
    nameIntl: IntlModel(
      es: 'Vestidos',
      en: 'Dresses',
    ),
  ),
];
