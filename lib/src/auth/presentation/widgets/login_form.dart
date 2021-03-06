import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/application/providers.dart';
import '../../../shared/presentation/l10n/generated/l10n.dart';
import '../../../shared/presentation/pages/splash_page.dart';
import '../../../shared/presentation/utils/toasts.dart';
import '../../../shared/presentation/utils/luna_colors.dart';
import '../../../shared/presentation/widgets/custom_button_widget.dart';
import '../../application/login_controller.dart';
import '../extensions/email_failure_extension.dart';
import '../extensions/password_failure_extension.dart';
import 'custom_text_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
    required this.heightFake,
    required this.onTapRegister,
  }) : super(key: key);
  final double heightFake;
  final VoidCallback onTapRegister;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 750),
              curve: Curves.fastOutSlowIn,
              height: heightFake,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 16.0),
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Consumer(builder: (_, ref, __) {
                    final loginState = ref.watch(loginControllerProvider);
                    final loginController =
                        ref.read(loginControllerProvider.notifier);
                    ref.listen<LoginState>(
                      loginControllerProvider,
                      (_, next) {
                        next.signInFailureOrSuccess
                          ..whenIsSuccess(() {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const SplashPage(),
                                ),
                                (route) => false);
                          })
                          ..whenIsFailure(
                            (failure) => showError(
                              context,
                              message: failure.map(
                                nonExistentUserWithEmailAndPassword: (_) => S
                                    .of(context)
                                    .nonExistentUserWithEmailAndPassword,
                                serverError: (_) => S.of(context).serverError,
                              ),
                            ),
                          );
                      },
                    );
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(height: 8),
                        CustomTextFormField(
                          hintText: S.of(context).email,
                          iconData: Icons.email,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: loginController.emailChanged,
                          showError: loginState.showErrors,
                          errorText: loginState.email.map(
                              isLeft: (f) => f.toTranslation(context),
                              isRight: (_) => null),
                        ),
                        CustomTextFormField(
                          hintText: S.of(context).password,
                          iconData: Icons.vpn_key,
                          obscureText: true,
                          onChanged: loginController.passwordChanged,
                          showError: loginState.showErrors,
                          errorText: loginState.password.map(
                              isLeft: (f) => f.toTranslation(context),
                              isRight: (_) => null),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          alignment: Alignment.centerRight,
                          child: Text(
                            S.of(context).forgotPassword,
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: CustomButtonWidget(
                              onTap: loginController.signIn,
                              isLoading:
                                  loginState.signInFailureOrSuccess.isLoading,
                              text: S.of(context).login.toUpperCase(),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: onTapRegister,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: S.of(context).dontHaveAccount,
                                    style:
                                        const TextStyle(color: Colors.black)),
                                TextSpan(
                                    text: S.of(context).register,
                                    style: TextStyle(color: LunaColors.orange)),
                              ]),
                            ),
                          ),
                        )
                      ],
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
