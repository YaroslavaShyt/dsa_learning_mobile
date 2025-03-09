part of '../../home_screen.dart';

class _HelloUserWidget extends StatelessWidget {
  const _HelloUserWidget({
    required this.userName,
    required this.bytes,
    required this.hash,
    required this.fan,
    this.onManageCurrencyTap,
  });

  final int fan;
  final int hash;
  final int bytes;
  final String userName;
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
                  "${context.tr("helloUser")}\n$userName",
                  maxLines: 2,
                  style: textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    _CurrencyItem(
                      text: "bytes",
                      icon: ImageAssets.bytes,
                      value: bytes,
                    ),
                    _CurrencyItem(
                      text: "vents",
                      icon: ImageAssets.vents,
                      value: fan,
                    ),
                    _CurrencyItem(
                      text: "hash",
                      icon: ImageAssets.hash,
                      shouldShowDivider: false,
                      value: hash,
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
