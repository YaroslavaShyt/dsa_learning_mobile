import 'package:dsa_learning/core/constants/animation_assets.dart';
import 'package:dsa_learning/core/constants/image_assets.dart';
import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/core/utils/theme/text_theme.dart';
import 'package:dsa_learning/presentation/initial/main/profile/avatar/bloc/avatar_cubit.dart';
import 'package:dsa_learning/presentation/initial/main/profile/avatar/bloc/avatar_state.dart';
import 'package:dsa_learning/presentation/widgets/buttons/main_outlined_button.dart';
import 'package:dsa_learning/presentation/widgets/lottie_animations/main_animation_widget.dart';
import 'package:dsa_learning/presentation/widgets/main_shadow.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum Avatars {
  first(LottieAssets.avatar1),
  second(LottieAssets.avatar2),
  third(LottieAssets.avatar3),
  fourth(LottieAssets.avatar4);

  const Avatars(this.lottie);

  final String lottie;
}

class AvatarScreen extends StatefulWidget {
  const AvatarScreen({
    required this.cubit,
    super.key,
  });

  final AvatarCubit cubit;

  @override
  State<AvatarScreen> createState() => _AvatarScreenState();
}

class _AvatarScreenState extends State<AvatarScreen> {
  int selected = 0;

  void onChanged(int index) {
    setState(() {
      selected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = getColorScheme(context);
    final TextTheme textTheme = getTextTheme(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 4,
          color: colorScheme.onSurface.withValues(alpha: 0.3),
        ),
      ),
      padding: const EdgeInsetsDirectional.all(20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 34,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 50),
                  Text(
                    context.tr("buyAvatar"),
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.close_rounded,
                      color: colorScheme.onSurface,
                      shadows: [mainBoxShadow(context)],
                    ),
                    onPressed: widget.cubit.onCloseButtonTap,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.34,
              child: PageView.builder(
                onPageChanged: onChanged,
                itemCount: widget.cubit.avatars.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Column(
                        children: [
                          MainAnimationWidget(
                            width: 260,
                            height: MediaQuery.sizeOf(context).height / 4,
                            name: widget.cubit.avatars[index]['name'].lottie,
                          ),
                          _buildPrice(
                            context,
                            widget.cubit.avatars[index]['price'],
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
            _buildIndicators(context),
            _buildBuyButton(
              context,
              widget.cubit.avatars[selected]['isBought'],
              widget.cubit
                  .isEnoughMoney(widget.cubit.avatars[selected]['price']),
              widget.cubit.avatars[selected]['name'],
              widget.cubit.avatars[selected]['price'],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPrice(BuildContext context, int price) {
    final TextTheme textTheme = getTextTheme(context);

    if (price == 0) {
      return Text(
        context.tr('free'),
        style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(bottom: 16),
          child: Text(
            '${price.toString()}x',
            style: textTheme.bodyMedium?.copyWith(
              color: getColorScheme(context).primaryFixed,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Image.asset(
          height: 50,
          width: 50,
          ImageAssets.bytes,
        ),
      ],
    );
  }

  Widget _buildBuyButton(
    BuildContext context,
    bool isBought,
    bool isActive,
    Avatars avatar,
    int price,
  ) {
    final bool isSelected = widget.cubit.selectedAvatar == avatar.lottie;

    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 50.0),
      child: BlocBuilder<AvatarCubit, AvatarState>(
        builder: (context, state) {
          return MainOutlinedButton(
            isActive: isActive,
            onPressed: () => _getButtonAction(
              isBought,
              isSelected,
              isActive,
              avatar.name,
              price,
            ),
            child: _getButtonContent(
              state.isPurchaseInProgress,
              isBought,
              isActive,
              avatar,
              price,
            ),
          );
        },
      ),
    );
  }

  void _getButtonAction(
    bool isBought,
    bool isSelected,
    bool isActive,
    String name,
    int price,
  ) {
    if (isBought && !isSelected) {
      widget.cubit.changeAvatar(name);
    }
    if (!isBought && isActive) {
      widget.cubit.onPurchaseButtonTap(name, price);
    }
  }

  Widget _getButtonContent(
    bool isPurchaseInProgress,
    bool isBought,
    bool isActive,
    Avatars avatar,
    int price,
  ) {
    final TextTheme textTheme = getTextTheme(context);
    final ColorScheme colorScheme = getColorScheme(context);

    if (isBought && widget.cubit.selectedAvatar == avatar.lottie) {
      return Icon(
        Icons.check_rounded,
        size: 30,
        color: colorScheme.primaryFixed,
      );
    }
    if (isBought && widget.cubit.selectedAvatar != avatar.lottie) {
      return Text(
        context.tr("choose"),
        style: textTheme.bodyMedium?.copyWith(
          color: colorScheme.primaryFixed,
          fontWeight: FontWeight.w700,
        ),
      );
    }
    if (isPurchaseInProgress) {
      return CircularProgressIndicator(
        color: colorScheme.primaryFixed,
      );
    }
    return Text(
      context.tr('buy'),
      style: textTheme.bodyMedium?.copyWith(
        color: isActive
            ? colorScheme.primaryFixed
            : colorScheme.onSurface.withValues(alpha: 0.5),
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _buildIndicators(BuildContext context) {
    final ColorScheme colorScheme = getColorScheme(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        widget.cubit.avatars.length,
        (int index) {
          return Container(
            margin: const EdgeInsetsDirectional.only(
              top: 20,
              end: 10,
              bottom: 20,
            ),
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index == selected
                  ? colorScheme.primaryFixed
                  : colorScheme.onSurface.withValues(alpha: 0.4),
            ),
          );
        },
      ),
    );
  }
}
