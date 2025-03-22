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
      height: 270,
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      content: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Text(
              "${context.tr("helloUser")}\n$userName",
              maxLines: 2,
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              onTap: onManageCurrencyTap,
              child: Text(
                context.tr("manageCurrency"),
                style: textTheme.labelSmall,
              ),
            ),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: SizedBox(
              height: 140,
              width: 180,
              child: Column(
                mainAxisSize: MainAxisSize.min,
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
            ),
          ),
          const Positioned(
            right: -30,
            top: 10,
            bottom: 10,
            child: RobotAnimation(
              height: 200,
              width: 200,
            ),
          ),
        ],
      ),
    );
  }
}
