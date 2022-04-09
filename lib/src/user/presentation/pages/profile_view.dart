import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../routes.dart';
import '../../../shared/application/providers.dart';
import '../../../shared/presentation/l10n/generated/l10n.dart';
import '../../../shared/presentation/utils/luna_colors.dart';
import '../widgets/profile_info_card.dart';
import '../widgets/profile_photo_circular_widget.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Text(S.of(context).myProfile,
                    style: Theme.of(context).textTheme.headline6!),
                const SizedBox(height: 20),
                Consumer(builder: (_, ref, __) {
                  final user = ref.watch(userController).user;
                  return user != null
                      ? Row(
                          children: [
                            ProfilePhotoCircularWidget(
                              profilePctureUrl: user.profilePictureUrl,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(user.fullName),
                            ),
                            IconButton(
                              onPressed: () => Navigator.pushNamed(
                                  context, editProfileRoute),
                              icon: Icon(
                                Icons.edit,
                                color: LunaColors.primary,
                              ),
                            ),
                          ],
                        )
                      : Container();
                }),
                const SizedBox(height: 8),
                const Divider(),
                ListTile(
                  onTap: () =>
                      Navigator.pushNamed(context, changePasswordRoute),
                  dense: true,
                  leading: SvgPicture.asset(
                    'assets/icons/lock.svg',
                    color: Colors.black,
                  ),
                  title: Text(S.of(context).changePassword),
                  minLeadingWidth: 35,
                  horizontalTitleGap: 0,
                ),
                const Divider(),
                ListTile(
                  onTap: () {},
                  dense: true,
                  leading: SvgPicture.asset('assets/icons/support.svg'),
                  title: Text(S.of(context).support),
                  minLeadingWidth: 35,
                  horizontalTitleGap: 0,
                ),
                const Divider(),
                ListTile(
                  onTap: () {},
                  dense: true,
                  leading: SvgPicture.asset('assets/icons/doc.svg'),
                  title: Text(S.of(context).termAndConditions),
                  minLeadingWidth: 35,
                  horizontalTitleGap: 0,
                ),
                const Divider(),
                Consumer(
                  builder: (_, ref, __) {
                    return ListTile(
                      onTap: () {
                        ref.read(authControllerProvider.notifier).signOut();
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          loginRoute,
                          (route) => false,
                        );
                      },
                      dense: true,
                      leading: const Icon(
                        Icons.logout,
                        color: Colors.black,
                      ),
                      title: Text(S.of(context).signOut),
                      minLeadingWidth: 35,
                      horizontalTitleGap: 0,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 100.0),
          child: ProfilesInfoCard(),
        ),
      ],
    );
  }
}
