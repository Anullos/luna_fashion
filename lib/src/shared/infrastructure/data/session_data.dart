import '../../domain/models/intl_model.dart';
import '../../domain/models/session_model.dart';

final sessionsHome = [
  SessionModel(
    titleIntl: IntlModel(
      es: 'Casa',
      en: 'Home',
    ),
    iconUrl: 'home',
  ),
  SessionModel(
    titleIntl: IntlModel(
      es: 'Buscar',
      en: 'Search',
    ),
    iconUrl: 'search',
  ),
  SessionModel(
    titleIntl: IntlModel(
      es: 'Pedidos',
      en: 'Orders',
    ),
    iconUrl: 'local grocery store',
  ),
  SessionModel(
    titleIntl: IntlModel(
      es: 'Perfil',
      en: 'Profile',
    ),
    iconUrl: 'person outline',
  ),
];

final sessionsAdminHome = [
  SessionModel(
    titleIntl: IntlModel(
      es: 'Casa',
      en: 'Home',
    ),
    iconUrl: 'home',
  ),
  SessionModel(
    titleIntl: IntlModel(
      es: 'Pedidos',
      en: 'Orders',
    ),
    iconUrl: 'shopping cart',
  ),
  SessionModel(
    titleIntl: IntlModel(
      es: 'Productos',
      en: 'Products',
    ),
    iconUrl: 'shopping cart',
  ),
  SessionModel(
    titleIntl: IntlModel(
      es: 'Perfil',
      en: 'Profile',
    ),
    iconUrl: 'person outline',
  ),
];
