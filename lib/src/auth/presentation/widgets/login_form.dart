import 'package:flutter/material.dart';

import '../../../shared/presentation/utils/luna_colors.dart';
import '../../../shared/presentation/widgets/custom_button_widget.dart';

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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(height: 8),
                    _textInput(hint: "Email", icon: Icons.email),
                    _textInput(hint: "Password", icon: Icons.vpn_key),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      alignment: Alignment.centerRight,
                      child: const Text(
                        "Forgot Password?",
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: CustomButtonWidget(
                          onTap: () {},
                          text: "LOGIN",
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: onTapRegister,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                          text: TextSpan(children: [
                            const TextSpan(
                                text: "Don't have an account ? ",
                                style: TextStyle(color: Colors.black)),
                            TextSpan(
                                text: "Registor",
                                style: TextStyle(color: LunaColors.orange)),
                          ]),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _textInput({controller, hint, icon}) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      padding: const EdgeInsets.only(left: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }
}
