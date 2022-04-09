import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../shared/presentation/utils/luna_colors.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    Key? key,
    this.keyboardType = TextInputType.text,
    this.prefix,
    this.showError = false,
    this.initialValue,
    this.onChanged,
    this.onTap,
    this.isDisabled = false,
    this.controller,
    this.formatters,
    this.focusNode,
    this.validator,
    this.maxLines = 1,
    this.maxLength,
    this.expands = false,
    this.helperText = '',
    this.headerText = '',
    this.hintText = '',
    this.isPassword = false,
    this.counter,
    this.buildCounter,
    this.suffixIcon,
    this.decoration,
    this.isDense = false,
    this.onEditingComplete,
    this.headerStyle,
  }) : super(key: key);

  final bool showError;
  final String? initialValue;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final bool isDisabled;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final int maxLines;
  final int? maxLength;
  final bool expands;
  final String helperText;
  final String headerText;
  final String hintText;
  final bool isPassword;
  final Widget? counter;
  final InputCounterWidgetBuilder? buildCounter;
  final Widget? suffixIcon;
  final InputDecoration? decoration;
  final Widget? prefix;
  final List<TextInputFormatter>? formatters;
  final TextInputType keyboardType;
  final bool isDense;
  final void Function()? onEditingComplete;
  final TextStyle? headerStyle;

  @override
  TextFieldWidgetState createState() => TextFieldWidgetState();
}

class TextFieldWidgetState extends State<TextFieldWidget> {
  late bool _showPassword;

  @override
  void initState() {
    super.initState();
    _showPassword = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.headerText.isNotEmpty) ...[
          Text(
            widget.headerText,
            style: widget.headerStyle?.copyWith(color: LunaColors.white),
          ),
          const SizedBox(
            height: 8,
          ),
        ],
        TextFormField(
          keyboardType: widget.keyboardType,
          inputFormatters: widget.formatters,
          initialValue: widget.initialValue,
          onChanged: widget.onChanged,
          onEditingComplete: widget.onEditingComplete,
          autovalidateMode: widget.showError
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          onTap: widget.onTap,
          readOnly: widget.isDisabled,
          controller: widget.controller,
          focusNode: widget.focusNode,
          validator: widget.validator,
          maxLines: widget.maxLines,
          maxLength: widget.maxLength,
          buildCounter: widget.maxLength != null
              ? (
                  _, {
                  required currentLength,
                  required isFocused,
                  maxLength,
                }) =>
                  _Counter(
                    currentLength: currentLength,
                    maxLength: widget.maxLength!,
                  )
              : null,
          expands: widget.expands,
          decoration: widget.decoration ??
              InputDecoration(
                fillColor: LunaColors.white,
                prefixIcon: widget.prefix,
                suffixIconConstraints:
                    widget.isDense ? const BoxConstraints(maxWidth: 80) : null,
                suffixIcon: widget.isDense
                    ? Container(
                        margin: const EdgeInsets.only(right: 20),
                        alignment: Alignment.bottomRight,
                        child: widget.isPassword
                            ? GestureDetector(
                                onTap: () {
                                  setState(
                                    () {
                                      _showPassword = !_showPassword;
                                    },
                                  );
                                },
                                child: Icon(
                                  _showPassword
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  color: LunaColors.gray,
                                ),
                              )
                            : widget.suffixIcon ?? const Offstage(),
                      )
                    : null,
                errorMaxLines: 2,
                filled: true,
                helperText: widget.helperText,
                hintText: widget.hintText,
                hintStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: LunaColors.gray,
                    ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: LunaColors.red,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: LunaColors.lightGray,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: LunaColors.primary,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
              ),
          cursorColor: LunaColors.primary,
          obscureText: _showPassword,
        ),
      ],
    );
  }
}

class _Counter extends StatelessWidget {
  const _Counter({
    Key? key,
    required this.currentLength,
    required this.maxLength,
  }) : super(key: key);

  final int currentLength;
  final int maxLength;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Align(
        alignment: Alignment.topRight,
        child: Text(
          '$currentLength / $maxLength',
          style: Theme.of(context)
              .textTheme
              .caption!
              .copyWith(color: LunaColors.black),
        ),
      ),
    );
  }
}
