import 'package:dsa_learning/core/utils/theme/text_theme.dart';
import 'package:dsa_learning/presentation/initial/main/profile/widgets/add_avatar_popup_content/menu_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AddAvatarContent extends StatelessWidget {
  const AddAvatarContent({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = getTextTheme(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          context.tr("addAvatar"),
          style: textTheme.labelMedium?.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
              MenuItem(
                icon: Icons.camera_alt_outlined,
                title: "withCamera",
                onTap: () {},
                showDivider: true,
              ),
              MenuItem(
                icon: Icons.image_outlined,
                title: "fromGallery",
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
