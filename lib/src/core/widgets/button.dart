import 'package:flutter/material.dart';

import '../theme/colors/app_colors.dart';
import '../theme/fonts_styles/app_font_styles.dart';


class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    this.onPressed,
    this.color,
    this.text,
    this.textColor = Colors.white,
    this.height,
    this.width,
    this.child,
    this.borderColor,
    this.hasElevation = false,
    this.loading = false,
    this.loadingColor,
    this.borderRadius = 8,
    this.fontStyle,
    this.isEnabled = true,
    this.borderWidth = 1,
  }) : assert(child != null || text != null);
  final Function()? onPressed;
  final Color? color;
  final String? text;
  final double? height;
  final double? width;
  final Widget? child;
  final Color? borderColor;
  final Color textColor;
  final bool hasElevation;
  final bool loading;
  final Color? loadingColor;
  final double borderRadius;
  final TextStyle? fontStyle;
  final bool isEnabled;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 49,
      child: MaterialButton(
        onPressed: !isEnabled ? null : onPressed,
        color: color ?? AppColors.primaryColor,
        minWidth: width ?? MediaQuery.sizeOf(context).width,
        height: height ?? 49,
        disabledColor: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: borderColor != null
              ? BorderSide(color: borderColor!, width: borderWidth)
              : BorderSide.none,
        ),
        elevation: 0,
        splashColor: color,
        focusColor: color,
        highlightColor: color,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: loading
            ? SizedBox(
                width: height,
                height: height,
                child: Center(
                  child: CircularProgressIndicator(
                    color: loadingColor ?? Colors.white,
                  ),
                ),
              )
            : text != null
                ? Text(
                    text!,
                    style: fontStyle ??
                        FontStyles.instance.p14.copyWith(
                          fontWeight: FontWeight.w700,
                          color: textColor,
                        ),
                  )
                : child,
      ),
    );
  }
}
