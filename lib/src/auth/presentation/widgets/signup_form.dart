import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/application/providers.dart';
import '../../../shared/presentation/l10n/generated/l10n.dart';
import '../../../shared/presentation/utils/toasts.dart';
import '../../../shared/presentation/utils/luna_colors.dart';
import '../../../shared/presentation/widgets/custom_button_widget.dart';
import '../../application/signup_controller.dart';
import '../extensions/email_failure_extension.dart';
import '../extensions/fullname_failure_extension.dart';
import '../extensions/password_failure_extension.dart';
import 'custom_text_field.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    Key? key,
    required this.heightFake,
    required this.onTapLogin,
    required this.onSubmit,
  }) : super(key: key);
  final double heightFake;
  final VoidCallback onTapLogin;
  final Function(bool result) onSubmit;

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
                    final signUpState = ref.watch(signUpControllerProvider);
                    final signUpController =
                        ref.watch(signUpControllerProvider.notifier);

                    ref.listen<SignUpState>(
                      signUpControllerProvider,
                      (_, next) {
                        next.signUpResult
                          ..whenIsFailure(
                            (failure) => showError(
                              context,
                              message: failure.map(
                                emailAlreadyInUser: (_) =>
                                    S.of(context).emailAlreadyInUser,
                                invalidEmail: (_) => S.of(context).invalidEmail,
                                operationNotAllowed: (_) =>
                                    S.of(context).operationNotAllowed,
                                weakPassword: (_) => S.of(context).weakPassword,
                              ),
                            ),
                          )
                          ..whenIsSuccess(() {
                            onSubmit(true);
                            // showSuccess(context, message: 'Creado con exito');
                          });
                      },
                    );

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextFormField(
                          hintText: S.of(context).fullName,
                          iconData: Icons.person,
                          keyboardType: TextInputType.name,
                          onChanged: signUpController.fullnameChanged,
                          showError: signUpState.showErrors,
                          errorText: signUpState.fullname.map(
                              isLeft: (f) => f.toTranslation(context),
                              isRight: (_) => null),
                        ),
                        CustomTextFormField(
                          hintText: S.of(context).email,
                          iconData: Icons.email,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: signUpController.emailChanged,
                          showError: signUpState.showErrors,
                          errorText: signUpState.email.map(
                              isLeft: (f) => f.toTranslation(context),
                              isRight: (_) => null),
                        ),
                        CustomTextFormField(
                          hintText: S.of(context).password,
                          iconData: Icons.vpn_key,
                          obscureText: true,
                          onChanged: signUpController.passwordChanged,
                          showError: signUpState.showErrors,
                          errorText: signUpState.password.map(
                              isLeft: (f) => f.toTranslation(context),
                              isRight: (_) => null),
                        ),
                        CustomTextFormField(
                          hintText: S.of(context).passwordConfirmation,
                          iconData: Icons.vpn_key,
                          obscureText: true,
                          onChanged: signUpController.repeatPasswordChanged,
                          showError: signUpState.showErrors,
                          errorText: signUpState.confirmPassword.map(
                              isLeft: (f) => S.of(context).mismatchedPasswords,
                              isRight: (_) => null),
                        ),
                        Expanded(
                          child: Center(
                            child: CustomButtonWidget(
                              onTap: signUpController.signUp,
                              isLoading: signUpState.signUpResult.isLoading,
                              text: S.of(context).register.toUpperCase(),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: onTapLogin,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: S.of(context).alderadyHaveAccount,
                                    style:
                                        const TextStyle(color: Colors.black)),
                                TextSpan(
                                    text: ' ${S.of(context).login}',
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
