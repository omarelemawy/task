import 'package:flutter/material.dart';
import 'package:task/core/theme/app_colors.dart';

import '../consts/validator.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      this.prefixIcon,
      this.hintText,
      this.labelText,
      this.maxLength,
      this.prefixText,
      this.validator,
      this.suffixIcon,
      this.isMultiLine = false,
      this.expands = false,
      this.isObscure = false,
      this.textEditingController,
      this.hintStyle,
      this.prefixIconConstraints,
      this.isNumberOnly = false,
      this.onTap,
      this.onChanged,
      this.readOnly = false,
      this.isBorder = false,
      this.enabled = true,
      this.isWithTitle = true,
      this.keyboardType,
      this.borderRadius = 10,
      this.height})
      : super(key: key);
  final Widget? prefixIcon;
  final String? hintText;
  final String? labelText;
  final int? maxLength;
  final double? borderRadius;
  final String? prefixText;
  final String? Function(String?)? validator;
  final bool isMultiLine;
  final Widget? suffixIcon;
  final TextStyle? hintStyle;
  final BoxConstraints? prefixIconConstraints;
  final bool isNumberOnly;
  final TextEditingController? textEditingController;
  final Function(String)? onChanged;
  final GestureTapCallback? onTap;
  final bool? readOnly;
  final bool? enabled;
  final bool expands;
  final bool isObscure;
  final bool isBorder;
  final bool isWithTitle;
  final double? height;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isWithTitle)
          Text(
            labelText!,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: AppColors.textBoldColor,
                ),
          ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: height,
          child: TextFormField(
            maxLines: isMultiLine ? null : 1,
            minLines: isMultiLine ? 5 : null,
            validator: validator,
            controller: textEditingController,
            enabled: enabled,
            maxLength: maxLength,
            expands: expands,
            readOnly: readOnly!,
            obscureText: isObscure,
            onChanged: onChanged,
            onTap: onTap,
            keyboardType: isNumberOnly
                ? const TextInputType.numberWithOptions(decimal: true)
                : keyboardType,
            inputFormatters: [if (isNumberOnly) AppValidator.priceValueOnly()],
            decoration: InputDecoration(
              suffixIcon: suffixIcon,
              errorStyle: Theme.of(context).textTheme.labelMedium,
              hintText: hintText,
              hintStyle: hintStyle ??
                  Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: const Color(0xffAEAEAE), fontSize: 16),
              contentPadding: EdgeInsets.symmetric(
                  horizontal: isMultiLine ? 20 : 15,
                  vertical: isMultiLine ? 5.0 : 0),
              prefixIcon: prefixIcon,
              filled: !isBorder,
              fillColor: Colors.grey.withOpacity(.2),
              prefixIconConstraints: prefixIconConstraints,
              prefixText: prefixText ?? "",
              border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(isMultiLine ? 10 : borderRadius!)),
              enabledBorder: OutlineInputBorder(
                borderSide: isBorder
                    ? const BorderSide(width: 1, color: Color(0xff626262))
                    : const BorderSide(
                        width: 0.0, color: AppColors.scaffoldColor),
                borderRadius:
                    BorderRadius.circular(isMultiLine ? 5 : borderRadius!),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: isBorder
                    ? const BorderSide(width: 1, color: Color(0xff626262))
                    : const BorderSide(
                        width: 0.0, color: AppColors.scaffoldColor),
                borderRadius:
                    BorderRadius.circular(isMultiLine ? 5 : borderRadius!),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: isBorder
                    ? const BorderSide(width: 1, color: Color(0xff626262))
                    : const BorderSide(
                        width: 0.0, color: AppColors.scaffoldColor),
                borderRadius:
                    BorderRadius.circular(isMultiLine ? 5 : borderRadius!),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
