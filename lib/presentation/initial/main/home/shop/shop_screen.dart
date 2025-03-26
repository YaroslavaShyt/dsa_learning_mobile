import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/core/utils/theme/text_theme.dart';
import 'package:dsa_learning/presentation/initial/main/home/shop/bloc/shop_cubit.dart';
import 'package:dsa_learning/presentation/initial/main/home/shop/bloc/shop_state.dart';
import 'package:dsa_learning/presentation/initial/main/home/shop/widgets/my_balance_widget.dart';
import 'package:dsa_learning/presentation/initial/main/home/shop/widgets/offers_widget.dart';
import 'package:dsa_learning/presentation/initial/main/home/shop/widgets/total_row.dart';
import 'package:dsa_learning/presentation/widgets/buttons/main_outlined_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({
    required this.cubit,
    super.key,
  });

  final ShopCubit cubit;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = getTextTheme(context);
    final ColorScheme colorScheme = getColorScheme(context);

    return BlocBuilder<ShopCubit, ShopState>(
      builder: (BuildContext context, ShopState state) {
        return Padding(
          padding: const EdgeInsetsDirectional.all(8.0),
          child: Column(
            spacing: 6,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 30),
                  Text(
                    context.tr('shop'),
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  CloseButton(
                    onPressed: cubit.onCloseButtonTap,
                  ),
                ],
              ),
              MyBalanceWidget(
                hash: state.hashBalance,
                vents: state.ventsBalance,
                bytes: state.bytesBalance,
              ),
              OffersWidget(
                hash: state.selectedHash,
                vents: state.selectedVents,
                onVentsIncrement: cubit.onVentsIncrement,
                onVentsDecrement: cubit.onVentsDecrement,
                onHashIncrement: cubit.onHashIncrement,
                onHashDecrement: cubit.onHashDecrement,
              ),
              TotalRow(
                bytes: state.totalBytes,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(
                  horizontal: 50.0,
                ),
                child: MainOutlinedButton(
                  height: 50,
                  onPressed: cubit.onConfirmButtonPressed,
                  child: Text(
                    context.tr('confirm'),
                    style: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.primaryFixed,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
