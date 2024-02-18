// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../AppDetails.dart';
import 'Common_Colors.dart';
import 'Common_Widget.dart';









class CommonTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputAction? textInputAction;
  final String? Function(String? msg)? validator;
  final TextInputType? keyboardType;
  final int maxLength;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final bool isReadyOnly;
  void Function(String)? onChanged;
  final Widget? suffixIcon;
  void Function()? onTaps;
  Widget? prefixIcon;
  bool isAutoFocus;
  bool isEnableTextFormField = true;
  FocusNode? focusNode;
  EdgeInsetsGeometry? contentPadding;

  CommonTextFormField({
    required this.textInputAction,
    required this.validator,
    this.maxLength = 1024,
    required this.controller,
    this.isEnableTextFormField = true,
    required this.hintText,
    this.focusNode,
    this.prefixIcon,
    this.inputFormatters,
    this.onTaps,
    this.suffixIcon,
    this.isAutoFocus = false,
    this.onChanged,
    this.isReadyOnly = false,
    this.obscureText = false,
    this.contentPadding,
    required this.keyboardType,
  });

  @override
  State<CommonTextFormField> createState() => _CommonTextFormFieldState();
}

class _CommonTextFormFieldState extends State<CommonTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(

      onTap: widget.onTaps,
      onChanged: widget.onChanged,
      readOnly: widget.isReadyOnly,
      obscureText: widget.obscureText,
      maxLength: widget.maxLength,
      focusNode: widget.focusNode,
      inputFormatters: widget.inputFormatters,
      textInputAction: widget.textInputAction,
      validator: widget.validator,
      controller: widget.controller,
      style: textFormFieldTextStyle(),
      enableInteractiveSelection: true,
      enabled: widget.isEnableTextFormField,
      cursorColor: Colors.black,
      autofocus: widget.isAutoFocus,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        errorMaxLines: 2,
        enabled: widget.isEnableTextFormField,
        contentPadding: widget.contentPadding,
        labelText: widget.hintText!.tr,
        errorStyle: textFormFieldErrorStyle(),
        labelStyle: textFormFieldLabelStyle(),
        suffixIcon: widget.suffixIcon,
        prefixIcon: widget.prefixIcon,
        counterText: "",
        hintText: widget.hintText!.tr,
        hintStyle: textFormFieldHintStyle(),
        filled: true,
        fillColor: HexColor(CommonColors.whiteColor),
        border: (widget.isReadyOnly == true)
            ? commonEnableBorder()
            : commonBorder(),
        errorBorder: commonErrorBorder(),
        enabledBorder: commonEnableBorder(),
        focusedBorder: (widget.isReadyOnly == true)
            ? commonEnableBorder()
            : commonFocusBorder(),
        focusedErrorBorder: commonErrorBorder(),
      ),
    );
  }
}

class CommonTextFormFieldWithOutBorder extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputAction? textInputAction;
  final String? Function(String? msg)? validator;
  final TextInputType? keyboardType;
  final int maxLength;
  final bool obscureText;
  final bool isReadyOnly;
  void Function(String)? onChanged;
  final Widget? suffixIcon;
  void Function()? onTaps;
  Widget? prefixIcon;

  CommonTextFormFieldWithOutBorder({
    required this.textInputAction,
    required this.validator,
    this.maxLength = 1024,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.onTaps,
    this.suffixIcon,
    this.onChanged,
    this.isReadyOnly = false,
    this.obscureText = false,
    required this.keyboardType,
  });

  @override
  State<CommonTextFormFieldWithOutBorder> createState() =>
      _CommonTextFormFieldWithOutBorderState();
}

class _CommonTextFormFieldWithOutBorderState
    extends State<CommonTextFormFieldWithOutBorder> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: widget.onTaps,
      onChanged: widget.onChanged,
      readOnly: widget.isReadyOnly,
      obscureText: widget.obscureText,
      maxLength: widget.maxLength,
      textInputAction: widget.textInputAction,
      validator: widget.validator,
      controller: widget.controller,
      style: textFormFieldTextStyle(),
      cursorColor: Colors.black,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        labelText: widget.hintText!.tr,
        labelStyle: textFormFieldLabelStyle(),
        suffixIcon: widget.suffixIcon,
        prefixIcon: widget.prefixIcon,
        errorStyle: textFormFieldErrorStyle(),
        counterText: "",
        hintText: widget.hintText!.tr,
        hintStyle: textFormFieldHintStyle(),
        filled: true,
        fillColor: HexColor(CommonColors.whiteColor),
        border: commonBorder(),
        errorBorder: commonErrorBorder(),
        enabledBorder: (widget.controller!.text.trim().toString().isEmpty)
            ? commonEnableBorder()
            : commonTextBorderAfterText(),
        focusedBorder: commonFocusBorder(),
        focusedErrorBorder: commonErrorBorder(),
      ),
    );
  }
}

class CommonTextFormFieldNoBorder extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputAction? textInputAction;
  final String? Function(String? msg)? validator;
  final TextInputType? keyboardType;
  final int maxLength;
  final bool obscureText;
  final bool isReadyOnly;
  void Function(String)? onChanged;
  final Widget? suffixIcon;
  void Function()? onTaps;
  Widget? prefixIcon;

  CommonTextFormFieldNoBorder({
    required this.textInputAction,
    required this.validator,
    this.maxLength = 1024,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.onTaps,
    this.suffixIcon,
    this.onChanged,
    this.isReadyOnly = false,
    this.obscureText = false,
    required this.keyboardType,
  });

  @override
  State<CommonTextFormFieldNoBorder> createState() =>
      _CommonTextFormFieldNoBorderState();
}

class _CommonTextFormFieldNoBorderState
    extends State<CommonTextFormFieldNoBorder> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: widget.onTaps,
      onChanged: widget.onChanged,
      readOnly: widget.isReadyOnly,
      obscureText: widget.obscureText,
      maxLength: widget.maxLength,
      textInputAction: widget.textInputAction,
      validator: widget.validator,
      controller: widget.controller,
      style: textFormFieldTextStyle(),
      cursorColor: Colors.black,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        labelText: widget.hintText!.tr,
        labelStyle: textFormFieldLabelStyle(),
        suffixIcon: widget.suffixIcon,
        prefixIcon: widget.prefixIcon,
        errorStyle: textFormFieldErrorStyle(),
        counterText: "",
        hintText: widget.hintText!.tr,
        hintStyle: textFormFieldHintStyle(),
        filled: true,
        fillColor: HexColor(CommonColors.whiteColor),
        border: InputBorder.none,
        errorBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
      ),
    );
  }
}

class CommonTextFormFieldNormalBorder extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputAction? textInputAction;
  final String? Function(String? msg)? validator;
  final TextInputType? keyboardType;
  final int maxLength;
  final bool obscureText;
  final bool isReadyOnly;
  void Function(String)? onChanged;
  final Widget? suffixIcon;
  void Function()? onTaps;
  Widget? prefixIcon;

  CommonTextFormFieldNormalBorder({
    required this.textInputAction,
    required this.validator,
    this.maxLength = 1024,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.onTaps,
    this.suffixIcon,
    this.onChanged,
    this.isReadyOnly = false,
    this.obscureText = false,
    required this.keyboardType,
  });

  @override
  State<CommonTextFormFieldNormalBorder> createState() =>
      _CommonTextFormFieldNormalBorderState();
}

class _CommonTextFormFieldNormalBorderState
    extends State<CommonTextFormFieldNormalBorder> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: widget.onTaps,
      onChanged: widget.onChanged,
      readOnly: widget.isReadyOnly,
      obscureText: widget.obscureText,
      maxLength: widget.maxLength,
      textInputAction: widget.textInputAction,
      validator: widget.validator,
      controller: widget.controller,
      style: textFormFieldTextStyle(),
      cursorColor: Colors.black,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        labelText: widget.hintText!.tr,
        labelStyle: textFormFieldLabelStyle(),
        suffixIcon: widget.suffixIcon,
        prefixIcon: widget.prefixIcon,
        errorStyle: textFormFieldErrorStyle(),
        counterText: "",
        hintText: widget.hintText!.tr,
        hintStyle: textFormFieldHintStyle(),
        filled: true,
        fillColor: HexColor(CommonColors.whiteColor),
        border: commonBorder(),
        errorBorder: commonErrorBorder(),
        enabledBorder: (widget.controller!.text.trim().toString().isEmpty)
            ? commonEnableBorder()
            : commonTextBorderAfterText(),
        focusedBorder: commonFocusBorder(),
        focusedErrorBorder: commonErrorBorder(),
      ),
    );
  }
}

class CommonTextFormFieldSearchBar extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputAction? textInputAction;
  final String? Function(String? msg)? validator;
  final TextInputType? keyboardType;
  final int maxLength;
  final bool obscureText;
  final bool isReadyOnly;
  void Function(String)? onChanged;
  final Widget? suffixIcon;
  void Function()? onTaps;
  Widget? prefixIcon;
  double? borderRadius = 7.0;

  CommonTextFormFieldSearchBar({
    required this.textInputAction,
    required this.validator,
    this.maxLength = 1024,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.borderRadius,
    this.onTaps,
    this.suffixIcon,
    this.onChanged,
    this.isReadyOnly = false,
    this.obscureText = false,
    required this.keyboardType,
  });

  @override
  State<CommonTextFormFieldSearchBar> createState() =>
      _CommonTextFormFieldSearchBarState();
}

class _CommonTextFormFieldSearchBarState
    extends State<CommonTextFormFieldSearchBar> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: widget.onTaps,
      onChanged: widget.onChanged,
      readOnly: widget.isReadyOnly,
      obscureText: widget.obscureText,
      maxLength: widget.maxLength,
      textInputAction: widget.textInputAction,
      validator: widget.validator,
      controller: widget.controller,
      style: textFormFieldTextStyle(),
      cursorColor: Colors.black,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        errorStyle: textFormFieldErrorStyle(),
        labelText: widget.hintText!.tr,
        labelStyle: textFormFieldLabelStyle(),
        suffixIcon: widget.suffixIcon,
        prefixIcon: widget.prefixIcon,
        counterText: "",
        hintText: widget.hintText!.tr,
        hintStyle: textFormFieldHintStyle(),
        filled: true,
        fillColor: HexColor(CommonColors.whiteColor),
        // border: commonBorder(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
          borderSide: BorderSide(
            color: HexColor(CommonColors.textFormFieldActiveBorderColor),
            width: 1,
          ),
        ),
        // errorBorder: commonErrorBorder(),
        // enabledBorder: (widget.controller!.text.trim().toString().isEmpty)
        //     ? commonEnableBorder()
        //     : commonTextBorderAfterText(),
        // focusedBorder: commonFocusBorder(),
        // focusedErrorBorder: commonErrorBorder(),
      ),
    );
  }
}

class CommonNormalTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputAction? textInputAction;
  final String? Function(String? msg)? validator;
  final TextInputType? keyboardType;
  final int maxLength;
  final bool obscureText;
  final bool isReadyOnly;
  void Function(String)? onChanged;
  final Widget? suffixIcon;
  void Function()? onTaps;
  bool autoFocus = true;
  TextCapitalization textCapitalization;
  Widget? prefixIcon;

  CommonNormalTextFormField({
    required this.textInputAction,
    required this.validator,
    this.maxLength = 1024,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.textCapitalization = TextCapitalization.none,
    this.onTaps,
    this.suffixIcon,
    this.autoFocus = true,
    this.onChanged,
    this.isReadyOnly = false,
    this.obscureText = false,
    required this.keyboardType,
  });

  @override
  State<CommonNormalTextFormField> createState() =>
      _CommonNormalTextFormFieldState();
}

class _CommonNormalTextFormFieldState extends State<CommonNormalTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: widget.onTaps,
      onChanged: widget.onChanged,
      readOnly: widget.isReadyOnly,
      obscureText: widget.obscureText,
      maxLength: widget.maxLength,
      textInputAction: widget.textInputAction,
      validator: widget.validator,
      controller: widget.controller,
      style: textFormFieldTextStyle(),
      cursorColor: Colors.black,
      keyboardType: widget.keyboardType,
      textCapitalization: widget.textCapitalization,
      autofocus: widget.autoFocus,
      decoration: InputDecoration(
        labelText: widget.hintText,
        errorStyle: textFormFieldErrorStyle(),
        contentPadding: const EdgeInsets.only(
            left: 16.0, right: 16.0, top: 16.0, bottom: 16.0),
        labelStyle: textFormFieldLabelStyle(),
        suffixIcon: widget.suffixIcon,
        prefixIcon: widget.prefixIcon,
        counterText: "",
        hintText:
        (widget.controller!.text.isEmpty) ? widget.hintText!.tr : null,
        hintStyle: textFormFieldHintStyle(),
        filled: true,
        fillColor: HexColor(CommonColors.whiteColor),
        border: commonBorder(),
        errorBorder: commonErrorBorder(),
        enabledBorder: (widget.controller!.text.trim().toString().isEmpty)
            ? commonEnableBorder()
            : commonTextBorderAfterText(),
        focusedBorder: commonFocusBorder(),
        focusedErrorBorder: commonErrorBorder(),
      ),
    );
  }
}

class CommonSearchTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputAction? textInputAction;
  final String? Function(String? msg)? validator;
  final TextInputType? keyboardType;
  final int maxLength;
  final bool obscureText;
  final bool isReadyOnly;
  void Function(String)? onChanged;
  final Widget? suffixIcon;
  void Function()? onTaps;
  final Function(String)? onSubmitted;
  Widget? prefixIcon;
  Widget? leadingIcon;
  FocusNode? focusNode;

  CommonSearchTextFormField({
    required this.textInputAction,
    required this.validator,
    this.maxLength = 1024,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.onTaps,
    this.suffixIcon,
    this.onChanged,
    this.isReadyOnly = false,
    this.obscureText = false,
    this.leadingIcon,
    this.onSubmitted,
    this.focusNode,
    required this.keyboardType,
  });

  @override
  State<CommonSearchTextFormField> createState() =>
      _CommonSearchTextFormFieldState();
}

class _CommonSearchTextFormFieldState extends State<CommonSearchTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: widget.onTaps,
      onFieldSubmitted: widget.onSubmitted,
      onChanged: widget.onChanged,
      readOnly: widget.isReadyOnly,
      obscureText: widget.obscureText,
      maxLength: widget.maxLength,
      textInputAction: widget.textInputAction,
      focusNode: widget.focusNode,
      validator: widget.validator,
      controller: widget.controller,
      style: textFormFieldTextStyle(),
      cursorColor: Colors.black,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        errorStyle: textFormFieldErrorStyle(),
        // labelText: widget.hintText,
        // labelStyle: textFormFieldLabelStyle(),
        suffixIcon: widget.suffixIcon,
        prefixIcon: widget.prefixIcon,
        counterText: "",
        hintText: widget.hintText!.tr,
        hintStyle: TextStyle(
            color: HexColor(CommonColors.grayThreeColor),
            fontFamily: AppDetails.fontPoppinsRegular,
            fontWeight: FontWeight.normal,
            fontSize: 12.0),
        filled: true,
        fillColor: HexColor(CommonColors.whiteColor),
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(100.0),
        //   borderSide: BorderSide(
        //     color: HexColor(CommonColors.greyFourColor),
        //   ),
        // ),
        // errorBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(100.0),
        //   borderSide: BorderSide(
        //     color: HexColor(CommonColors.greyFourColor),
        //   ),
        // ),
        // enabledBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(100.0),
        //   borderSide: BorderSide(
        //     width: 1,
        //     color: (widget.controller!.text.trim().toString().isEmpty)
        //         ? HexColor(CommonColors.greyFourColor)
        //         : HexColor(CommonColors.textFormFieldDisableColor),
        //   ),
        // ),
        // focusedBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(100.0),
        //   borderSide: BorderSide(
        //     color: HexColor(CommonColors.greyFourColor),
        //     width: 2,
        //   ),
        // ),
        // focusedErrorBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(100.0),
        //   borderSide: BorderSide(
        //     color: HexColor(CommonColors.greyFourColor),
        //   ),
        // ),
        border: (widget.isReadyOnly == true)
            ? commonEnableBorder(borderRadius: 100.0)
            : commonBorder(borderRadius: 100.0),
        errorBorder: commonErrorBorder(borderRadius: 100.0),
        enabledBorder: commonEnableBorder(borderRadius: 100.0),
        focusedBorder: (widget.isReadyOnly == true)
            ? commonEnableBorder(borderRadius: 100.0)
            : commonFocusBorder(borderRadius: 100.0),
        focusedErrorBorder: commonErrorBorder(borderRadius: 100.0),
      ),
    );
  }
}

class CommonTextFormFieldWithOutIcon extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final FormFieldValidator<String>? validate;
  final int maxLength;
  final String hintText;
  final bool isReadOnly;
  final bool isEnable;
  final bool isObserve;
  void Function()? onTaps;

  CommonTextFormFieldWithOutIcon({
    Key? key,
    required this.controller,
    this.isEnable = true,
    this.onTaps,
    required this.textInputType,
    required this.textInputAction,
    required this.validate,
    required this.maxLength,
    this.isObserve = false,
    this.isReadOnly = false,
    required this.hintText,
  }) : super(key: key);

  @override
  State<CommonTextFormFieldWithOutIcon> createState() =>
      _CommonTextFormFieldWithOutIconState();
}

class _CommonTextFormFieldWithOutIconState
    extends State<CommonTextFormFieldWithOutIcon> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.0,
      child: TextFormField(
        onTap: widget.onTaps,
        obscureText: widget.isObserve,
        enabled: widget.isEnable,
        readOnly: widget.isReadOnly,
        maxLength: widget.maxLength,
        validator: widget.validate,
        controller: widget.controller,
        keyboardType: widget.textInputType,
        textInputAction: widget.textInputAction,
        style: textFormFieldTextStyle(),
        decoration: InputDecoration(
          errorStyle: textFormFieldErrorStyle(),
          labelStyle: textFormFieldLabelStyle(),
          hintStyle: textFormFieldHintStyle(),
          hintText: widget.hintText,
          counterText: '',
          contentPadding: const EdgeInsets.only(
              left: 16.0, right: 16.0, top: 0.0, bottom: 0.0),
          filled: true,
          fillColor:
          (widget.isReadOnly == true) ? Colors.grey[300] : Colors.white,
          border: commonBorder(),
          errorBorder: commonErrorBorder(),
          enabledBorder: (widget.controller!.text.trim().toString().isEmpty)
              ? commonEnableBorder()
              : commonTextBorderAfterText(),
          focusedBorder: commonFocusBorder(),
          focusedErrorBorder: commonErrorBorder(),
        ),
      ),
    );
  }
}

// TextArea

class CommonTextFormFieldArea extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final FormFieldValidator<String>? validate;
  final int maxLength;
  final String hintText;
  final Icon? prefixIcons;
  final double? height;
  final bool? isReadOnly;
  void Function(String)? onChanged;
  final bool? autofocus;
  final FocusNode? focusNode;

  CommonTextFormFieldArea({
    Key? key,
    required this.controller,
    required this.textInputType,
    required this.textInputAction,
    required this.validate,
    required this.maxLength,
    required this.hintText,
    this.prefixIcons,
    this.height = 80,
    this.isReadOnly=false,
    this.onChanged=null,
    this.autofocus = false,
    this.focusNode = null
  }) : super(key: key);

  @override
  State<CommonTextFormFieldArea> createState() =>
      _CommonTextFormFieldAreaState();
}

class _CommonTextFormFieldAreaState extends State<CommonTextFormFieldArea> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: TextFormField(
        focusNode: widget.focusNode,
        onChanged: widget.onChanged,
        readOnly: widget.isReadOnly!,
        maxLines: 6,
        validator: widget.validate,
        autofocus: widget.autofocus!,
        controller: widget.controller,
        keyboardType: widget.textInputType,
        textInputAction: widget.textInputAction,
        style: textFormFieldTextStyle(),
        decoration: InputDecoration(
          errorStyle: textFormFieldErrorStyle(),

          // prefixIcon: prefixIcons,
          hintStyle: textFormFieldHintStyle(),
          labelStyle: textFormFieldLabelStyle(),
          hintText: widget.hintText,
          counterText: '',
          contentPadding: const EdgeInsets.only(
              left: 16.0, right: 16.0, top: 16.0, bottom: 0.0),
          filled: true,
          fillColor: Colors.white,
          border: commonBorder(),
          errorBorder: commonErrorBorder(),
          enabledBorder: ((widget.controller!.text.trim().toString().isEmpty)
              ? commonEnableBorder()
              : commonTextBorderAfterText()),
          focusedBorder: widget.isReadOnly!?commonEnableBorder():commonFocusBorder(),
          focusedErrorBorder: commonErrorBorder(),
        ),
      ),
    );
  }
}




class CommonOutlineTextFormFieldAmount extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final FormFieldValidator<String>? validate;
  final int maxLength;
  final String hintText;
  final double textFieldWidth;
  final Widget? prefixIcons;

  CommonOutlineTextFormFieldAmount({
    Key? key,
    required this.controller,
    required this.textInputType,
    required this.textInputAction,
    required this.validate,
    required this.textFieldWidth,
    required this.maxLength,
    required this.hintText,
    this.prefixIcons,
  });

  @override
  State<CommonOutlineTextFormFieldAmount> createState() =>
      _CommonOutlineTextFormFieldAmountState();
}

class _CommonOutlineTextFormFieldAmountState
    extends State<CommonOutlineTextFormFieldAmount> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.0,
      width: widget.textFieldWidth,
      child: TextFormField(
        maxLines: 1,
        validator: widget.validate,
        controller: widget.controller,
        keyboardType: widget.textInputType,
        textInputAction: widget.textInputAction,
        style: TextStyle(
          fontFamily: AppDetails.fontPoppinsRegular,
          fontSize: 20.0,
          fontWeight: FontWeight.normal,
          color: HexColor(CommonColors.textFormFieldTextColor),
        ),
        decoration: InputDecoration(
          // prefixIcon: prefixIcons,
          errorStyle: textFormFieldErrorStyle(),
          labelStyle: textFormFieldLabelStyle(),
          hintStyle: textFormFieldHintStyle(),
          hintText: widget.hintText,
          counterText: '',
          contentPadding: const EdgeInsets.only(
              left: 16.0, right: 16.0, top: 16.0, bottom: 5.0),
          filled: true,
          fillColor: Colors.white,
          border: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}



class CommonOutlineTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final FormFieldValidator<String>? validate;
  final int maxLength;
  final String hintText;
  final double textFieldWidth;
  final Widget? prefixIcons;
  void Function(String)? onChanged;

  CommonOutlineTextFormField({
    Key? key,
    required this.controller,
    required this.textInputType,
    required this.textInputAction,
    required this.validate,
    required this.textFieldWidth,
    required this.maxLength,
    required this.hintText,
    this.prefixIcons,
    this.onChanged
  });

  @override
  State<CommonOutlineTextFormField> createState() =>
      _CommonOutlineTextFormFieldState();
}

class _CommonOutlineTextFormFieldState
    extends State<CommonOutlineTextFormField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.0,
      width: widget.textFieldWidth,
      child: TextFormField(
        maxLines: 1,
        onChanged: widget.onChanged,
        validator: widget.validate,
        controller: widget.controller,
        keyboardType: widget.textInputType,
        textInputAction: widget.textInputAction,
        style: textFormFieldTextStyle(),
        decoration: InputDecoration(
          // prefixIcon: prefixIcons,
          errorStyle: textFormFieldErrorStyle(),
          labelStyle: textFormFieldLabelStyle(),
          hintStyle: textFormFieldHintStyle(),
          hintText: widget.hintText,
          counterText: '',
          contentPadding: const EdgeInsets.only(
              left: 16.0, right: 16.0, top: 16.0, bottom: 0.0),
          filled: true,
          fillColor: Colors.white,
          border: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}



class CommonNormalWithFocusTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputAction? textInputAction;
  final String? Function(String? msg)? validator;
  final TextInputType? keyboardType;
  final int maxLength;
  final bool obscureText;
  final bool isReadyOnly;
  void Function(String)? onChanged;
  final Widget? suffixIcon;
  void Function()? onTaps;
  bool autoFocus = true;
  TextCapitalization textCapitalization;
  Widget? prefixIcon;
  FocusNode? focusNode;

  CommonNormalWithFocusTextFormField({
    required this.textInputAction,
    required this.validator,
    this.maxLength = 1024,
    required this.focusNode,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.textCapitalization = TextCapitalization.none,
    this.onTaps,
    this.suffixIcon,
    this.autoFocus = true,
    this.onChanged,
    this.isReadyOnly = false,
    this.obscureText = false,
    required this.keyboardType,
  });

  @override
  State<CommonNormalWithFocusTextFormField> createState() =>
      _CommonNormalWithFocusTextFormFieldState();
}

class _CommonNormalWithFocusTextFormFieldState
    extends State<CommonNormalWithFocusTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: widget.onTaps,
      focusNode: widget.focusNode,
      onChanged: widget.onChanged,
      readOnly: widget.isReadyOnly,
      obscureText: widget.obscureText,
      maxLength: widget.maxLength,
      textInputAction: widget.textInputAction,
      validator: widget.validator,
      controller: widget.controller,
      style: textFormFieldTextStyle(),
      cursorColor: Colors.black,
      keyboardType: widget.keyboardType,
      textCapitalization: widget.textCapitalization,
      autofocus: widget.autoFocus,
      decoration: InputDecoration(
        labelText: widget.hintText,
        errorStyle: textFormFieldErrorStyle(),
        contentPadding: const EdgeInsets.only(
            left: 16.0, right: 16.0, top: 16.0, bottom: 16.0),
        labelStyle: textFormFieldLabelStyle(),
        suffixIcon: widget.suffixIcon,
        prefixIcon: widget.prefixIcon,
        counterText: "",
        hintText:
        null,
        hintStyle: textFormFieldHintStyle(),
        filled: true,
        fillColor: HexColor(CommonColors.whiteColor),
        border: commonBorder(),
        errorBorder: commonErrorBorder(),
        enabledBorder: (widget.controller!.text.trim().toString().isEmpty)
            ? commonEnableBorder()
            : commonTextBorderAfterText(),
        focusedBorder: commonFocusBorder(),
        focusedErrorBorder: commonErrorBorder(),
      ),
    );
  }
}
