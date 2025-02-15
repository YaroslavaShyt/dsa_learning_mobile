import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/core/utils/theme/text_theme.dart';
import 'package:dsa_learning/presentation/initial/auth/bloc/auth_cubit.dart';
import 'package:dsa_learning/presentation/initial/auth/bloc/auth_state.dart';
import 'package:dsa_learning/presentation/widgets/main_background.dart';
import 'package:dsa_learning/presentation/widgets/main_container.dart';
import 'package:dsa_learning/presentation/widgets/main_outlined_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'widgets/_auth_text.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (_, AuthState state) {
          return Stack(
            fit: StackFit.expand,
            children: [
              const MainBackground(),
              Positioned(
                left: 20,
                right: 20,
                bottom: 50,
                child: MainContainer(
                  height: 300,
                  padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 80.0,
                  ),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                          start: 10.0,
                          top: 24,
                          end: 10,
                          bottom: 20,
                        ),
                        child: const _AuthText(),
                      ),
                      MainOutlinedButton(
                        onPressed: () {},
                        child: Text(
                          context.tr('start'),
                          style: getTextTheme(context).labelMedium?.copyWith(
                                color: getColorScheme(context).primaryFixed,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
