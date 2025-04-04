import 'package:dsa_learning/core/constants/animation_assets.dart';
import 'package:dsa_learning/core/constants/image_assets.dart';
import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/core/utils/theme/text_theme.dart';
import 'package:dsa_learning/presentation/initial/main/profile/avatar/bloc/avatar_cubit.dart';
import 'package:dsa_learning/presentation/widgets/buttons/main_outlined_button.dart';
import 'package:dsa_learning/presentation/widgets/main_shadow.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

enum Avatars {
  first(LottieAssets.avatar1),
  second(LottieAssets.avatar2),
  third(LottieAssets.avatar3),
  fourth(LottieAssets.avatar4);

  const Avatars(this.lottie);

  final String lottie;
}

const List<Map<String, dynamic>> _avatars = [
  {'name': Avatars.first, 'price': 0, 'isBought': true},
  {'name': Avatars.second, 'price': 100, 'isBought': false},
  {'name': Avatars.third, 'price': 150, 'isBought': false},
  {'name': Avatars.fourth, 'price': 2000, 'isBought': false},
];

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
    return Padding(
      padding: const EdgeInsetsDirectional.all(20),
      child: Column(
        children: [
          SizedBox(
            height: 34,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.tr("buyAvatar"),
                  style: getTextTheme(context).bodyMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.close_rounded,
                    color: getColorScheme(context).onSurface,
                    shadows: [mainBoxShadow(context)],
                  ),
                  onPressed: widget.cubit.onCloseButtonTap,
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.35,
            child: PageView.builder(
              onPageChanged: onChanged,
              itemCount: _avatars.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Column(
                      children: [
                        LottieBuilder.asset(
                          width: 260,
                          height: 240,
                          _avatars[index]['name'].lottie,
                        ),
                        _buildPrice(context, _avatars[index]['price']),
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
              _avatars[selected]['isBought'],
              widget.cubit.isEnoughMoney(_avatars[selected]['price']),
              (_avatars[selected]['name'] as Avatars).name,
              _avatars[selected]['price']),
        ],
      ),
    );
  }

  Widget _buildPrice(BuildContext context, int price) {
    if (price == 0) {
      return Text(
        context.tr('free'),
        style: getTextTheme(context).bodyMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(bottom: 16),
          child: Text(
            '${price.toString()}x',
            style: getTextTheme(context).bodyMedium?.copyWith(
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
    String name,
    int price,
  ) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 50.0),
      child: MainOutlinedButton(
        isActive: isActive,
        onPressed: isBought || !isActive
            ? () {}
            : () => widget.cubit.onPurchaseButtonTap(name, price),
        child: isBought
            ? Icon(
                Icons.check_rounded,
                size: 30,
                color: getColorScheme(context).primaryFixed,
              )
            : Text(
                context.tr('buy'),
                style: getTextTheme(context).bodyMedium?.copyWith(
                      color: isActive
                          ? getColorScheme(context).primaryFixed
                          : getColorScheme(context)
                              .onSurface
                              .withValues(alpha: 0.5),
                      fontWeight: FontWeight.w700,
                    ),
              ),
      ),
    );
  }

  Widget _buildIndicators(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        _avatars.length,
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
                  ? getColorScheme(context).primaryFixed
                  : getColorScheme(context).onSurface.withValues(alpha: 0.4),
            ),
          );
        },
      ),
    );
  }
}
