part of '../../home_screen.dart';

class _HelloUserWidget extends StatelessWidget {
  const _HelloUserWidget({
    this.onManageCurrencyTap,
  });

  final VoidCallback? onManageCurrencyTap;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = getTextTheme(context);
    return MainContainer(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${context.tr("helloUser")}\nYaroslava",
                  maxLines: 2,
                  style: textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 20),
                const Column(
                  children: [
                    _CurrencyItem(
                      text: "bytes",
                      icon: ImageAssets.bytes,
                      value: 10,
                    ),
                    _CurrencyItem(
                      text: "vents",
                      icon: ImageAssets.vents,
                      value: 10,
                    ),
                    _CurrencyItem(
                      text: "hash",
                      icon: ImageAssets.hash,
                      shouldShowDivider: false,
                      value: 10,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: onManageCurrencyTap,
                  child: Text(
                    context.tr("manageCurrency"),
                    style: textTheme.labelSmall,
                  ),
                ),
                const RobotAnimation(
                  height: 200,
                  width: 200,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
