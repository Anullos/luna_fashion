import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/application/providers.dart';
import '../../../shared/presentation/l10n/generated/l10n.dart';
import '../../../shared/presentation/utils/luna_colors.dart';

class ImageSelectorWidget extends ConsumerWidget {
  const ImageSelectorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final image =
        ref.watch(addProductController.select((value) => value.imagePath));
    return Column(
      children: [
        Center(
          child: SizedBox(
            height: 120,
            width: 120,
            child: GestureDetector(
              onTap: () => buildPickImageBottomSheet(context),
              child: Stack(
                children: [
                  if (image == null || image.isEmpty)
                    Image.asset(
                      'assets/images/image_placeholder.png',
                      height: 100,
                      width: 100,
                      fit: BoxFit.contain,
                    )
                  else
                    Container(
                      height: 110,
                      width: 110,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Image.file(
                        File(image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: CircleAvatar(
                      backgroundColor: LunaColors.background,
                      maxRadius: 25,
                      child: CircleAvatar(
                        backgroundColor: LunaColors.primary,
                        child: Icon(
                          Icons.camera_alt_outlined,
                          color: LunaColors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  void buildPickImageBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (_) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8),
                child: IconButton(
                  constraints: const BoxConstraints(
                    maxHeight: 30,
                    maxWidth: 60,
                  ),
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
          Consumer(
            builder: (_, ref, __) {
              return ListTile(
                minLeadingWidth: 20,
                onTap: () async {
                  ref.read(addProductController.notifier).pickImage(true);
                  Navigator.pop(context);
                },
                leading: Icon(
                  Icons.camera_alt_outlined,
                  color: LunaColors.primary,
                ),
                title: Text(S.of(context).takeAPhoto),
              );
            },
          ),
          Consumer(
            builder: (_, ref, __) {
              return ListTile(
                minLeadingWidth: 20,
                onTap: () async {
                  ref.read(addProductController.notifier).pickImage(false);
                  Navigator.pop(context);
                },
                leading: Icon(
                  Icons.image,
                  color: LunaColors.primary,
                ),
                title: Text(S.of(context).chooseFromGallery),
              );
            },
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
