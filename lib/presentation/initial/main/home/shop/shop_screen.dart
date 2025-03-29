import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/core/utils/theme/text_theme.dart';
import 'package:dsa_learning/presentation/initial/main/home/shop/bloc/shop_cubit.dart';
import 'package:dsa_learning/presentation/initial/main/home/shop/bloc/shop_state.dart';
import 'package:dsa_learning/presentation/initial/main/home/shop/widgets/my_balance_widget.dart';
import 'package:dsa_learning/presentation/initial/main/home/shop/widgets/offers_widget.dart';
import 'package:dsa_learning/presentation/initial/main/home/shop/widgets/title_widget.dart';
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
          padding: const EdgeInsetsDirectional.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              spacing: 6,
              children: [
                TitleWidget(
                  onCloseButtonTap: cubit.onCloseButtonTap,
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
                    isActive: cubit.isButtonActive,
                    height: 50,
                    onPressed: cubit.onConfirmButtonPressed,
                    child: state.isPurchaseInProgress
                        ? _buildLoading(colorScheme)
                        : _buildText(
                            context,
                            textTheme,
                            colorScheme,
                          ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildLoading(ColorScheme colorScheme) {
    return SizedBox(
      height: 20,
      width: 20,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        color: colorScheme.primaryFixed,
      ),
    );
  }

  Widget _buildText(
    BuildContext context,
    TextTheme textTheme,
    ColorScheme colorScheme,
  ) {
    return Text(
      context.tr('confirm'),
      style: textTheme.bodyMedium?.copyWith(
        color: cubit.isButtonActive
            ? colorScheme.primaryFixed
            : colorScheme.onSurface.withValues(alpha: 0.4),
        fontWeight: FontWeight.w700,
        fontSize: 18,
      ),
    );
  }
}
