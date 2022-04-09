import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../shared/presentation/l10n/generated/l10n.dart';
import '../../../shared/presentation/utils/luna_colors.dart';
import '../../../shared/presentation/utils/toasts.dart';

class ProfilesInfoCard extends StatelessWidget {
  const ProfilesInfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: Icon(Icons.info_outline, color: LunaColors.primary),
                    alignment: PlaceholderAlignment.middle,
                  ),
                  TextSpan(
                    text: S.of(context).didYouKnow,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
            Text(
              S.of(context).profileInfoCard,
              style: Theme.of(context).textTheme.caption,
            ),
            ElevatedButton(
              onPressed: () => _launchURL(context),
              style: ElevatedButton.styleFrom(
                visualDensity: VisualDensity.compact,
              ),
              child: Text(S.of(context).iWantToKnowMore),
            )
          ],
        ),
      ),
    );
  }

  void _launchURL(BuildContext context) async {
    const _url = 'https://anullos.es';
    try {
      await launch(_url);
    } catch (e) {
      showError(context, message: 'No se pudo abrir la web');
    }
  }
}
