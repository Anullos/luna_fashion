import 'intl_model.dart';

class SessionModel {
  final IntlModel titleIntl;
  final String iconUrl;

  SessionModel({required this.titleIntl, required this.iconUrl});

  String getName(String languaje) {
    switch (languaje) {
      case 'es':
        return titleIntl.es;
      case 'en':
        return titleIntl.en;
      default:
        return titleIntl.es;
    }
  }
}
