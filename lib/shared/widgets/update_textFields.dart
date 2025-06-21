import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shego/shared/theme/app_colors.dart';

class UpdateTextField extends StatefulWidget {
  // Controller and basic properties
  final TextEditingController? controller;
  final String hintText;
  final bool enabled;
  final bool autofocus;
  final FocusNode? focusNode;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final AutovalidateMode? autovalidateMode;

  // Text styling
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final TextAlign textAlign;

  // Input type and validation
  final TextInputType keyboardType;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldSetter<String>? onSaved;
  final VoidCallback? onTap;

  // Container styling
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? contentPadding;
  final Color? fillColor;
  final bool filled;
  final double borderRadius;
  final Color? borderColor;
  final double borderWidth;
  final Color? focusedBorderColor;
  final double focusedBorderWidth;
  final Color? errorBorderColor;
  final double errorBorderWidth;

  // Icons
  final String? prefixIconPath;
  final Widget? prefixIcon;
  final double prefixIconSize;
  final Color? prefixIconColor;
  final bool applyPrefixIconColor;
  final EdgeInsetsGeometry? prefixIconPadding;

  final String? suffixIconPath;
  final Widget? suffixIcon;
  final double suffixIconSize;
  final Color? suffixIconColor;
  final EdgeInsetsGeometry? suffixIconPadding;
  final VoidCallback? onSuffixIconTap;

  // Password field specific
  final bool isPasswordField;
  final String? passwordVisibleIconPath;
  final String? passwordHiddenIconPath;
  final Widget? passwordVisibleIcon;
  final Widget? passwordHiddenIcon;

  // Dropdown specific
  final List<DropdownMenuItem<String>>? dropdownItems;
  final String? dropdownValue;
  final Color? dropdownIconColor;
  final double? dropdownMaxHeight;

  // Shadow and elevation
  final List<BoxShadow>? boxShadow;

  const UpdateTextField({
    super.key,
    // Required
    required this.hintText,

    // Controller and basic properties
    this.controller,
    this.enabled = true,
    this.autofocus = false,
    this.focusNode,
    this.maxLength,
    this.maxLines,
    this.minLines,
    this.autovalidateMode,

    // Text styling
    this.textStyle,
    this.hintStyle,
    this.textAlign = TextAlign.start,

    // Input type and validation
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.onSaved,
    this.onTap,

    // Container styling
    this.height,
    this.width,
    this.contentPadding,
    this.fillColor,
    this.filled = true,
    this.borderRadius = 25.0,
    this.borderColor,
    this.borderWidth = 2.0,
    this.focusedBorderColor,
    this.focusedBorderWidth = 2.0,
    this.errorBorderColor,
    this.errorBorderWidth = 2.0,

    // Icons
    this.prefixIconPath,
    this.prefixIcon,
    this.prefixIconSize = 24.0,
    this.prefixIconColor,
    this.applyPrefixIconColor = true,
    this.prefixIconPadding,

    this.suffixIconPath,
    this.suffixIcon,
    this.suffixIconSize = 24.0,
    this.suffixIconColor,
    this.suffixIconPadding,
    this.onSuffixIconTap,

    // Password field specific
    this.isPasswordField = false,
    this.passwordVisibleIconPath,
    this.passwordHiddenIconPath,
    this.passwordVisibleIcon,
    this.passwordHiddenIcon,

    // Dropdown specific
    this.dropdownItems,
    this.dropdownValue,
    this.dropdownIconColor,
    this.dropdownMaxHeight,

    // Shadow and elevation
    this.boxShadow,
  });

  @override
  State<UpdateTextField> createState() => _UpdateTextFieldState();
}

class _UpdateTextFieldState extends State<UpdateTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPasswordField ? true : widget.obscureText;
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  // Default theme-based colors with fallbacks
  Color get _defaultFillColor =>
      widget.fillColor ??
      Theme.of(context).inputDecorationTheme.fillColor ??
      Theme.of(context).cardColor;

  Color get _defaultBorderColor =>
      widget.borderColor ??
      Theme.of(context).inputDecorationTheme.enabledBorder?.borderSide.color ??
      const Color(0xFFE91E63);

  Color get _defaultFocusedBorderColor =>
      widget.focusedBorderColor ??
      Theme.of(context).inputDecorationTheme.focusedBorder?.borderSide.color ??
      Theme.of(context).primaryColor;

  Color get _defaultErrorBorderColor =>
      widget.errorBorderColor ??
      Theme.of(context).inputDecorationTheme.errorBorder?.borderSide.color ??
      Theme.of(context).colorScheme.error;

  Color get _defaultIconColor => widget.prefixIconColor ?? AppColors.primary;

  TextStyle get _defaultTextStyle =>
      widget.textStyle ??
      Theme.of(context).inputDecorationTheme.hintStyle ??
      Theme.of(context).textTheme.bodyMedium ??
      const TextStyle(fontSize: 16);

  TextStyle get _defaultHintStyle =>
      widget.hintStyle ??
      Theme.of(context).inputDecorationTheme.hintStyle ??
      Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.6),
      ) ??
      const TextStyle(fontSize: 16, color: Colors.grey);

  Widget? _buildPrefixIcon() {
    if (widget.prefixIcon != null) {
      return Padding(
        padding: widget.prefixIconPadding ?? const EdgeInsets.all(12.0),
        child: widget.prefixIcon,
      );
    }

    if (widget.prefixIconPath != null && widget.prefixIconPath!.isNotEmpty) {
      return Padding(
        padding: widget.prefixIconPadding ?? const EdgeInsets.all(12.0),
        child: SvgPicture.asset(
          widget.prefixIconPath!,
          width: widget.prefixIconSize,
          height: widget.prefixIconSize,
          // MODIFIED: Only apply color filter if applyPrefixIconColor is true
          colorFilter:
              widget.applyPrefixIconColor
                  ? (widget.prefixIconColor != null
                      ? ColorFilter.mode(
                        widget.prefixIconColor!,
                        BlendMode.srcIn,
                      )
                      : ColorFilter.mode(_defaultIconColor, BlendMode.srcIn))
                  : null,
        ),
      );
    }

    return null;
  }

  Widget? _buildSuffixIcon() {
    if (widget.isPasswordField) {
      return _buildPasswordToggleIcon();
    }

    if (widget.suffixIcon != null) {
      return GestureDetector(
        onTap: widget.onSuffixIconTap,
        child: Padding(
          padding: widget.suffixIconPadding ?? const EdgeInsets.all(12.0),
          child: widget.suffixIcon,
        ),
      );
    }

    if (widget.suffixIconPath != null && widget.suffixIconPath!.isNotEmpty) {
      return GestureDetector(
        onTap: widget.onSuffixIconTap,
        child: Padding(
          padding: widget.suffixIconPadding ?? const EdgeInsets.all(12.0),
          child: SvgPicture.asset(
            widget.suffixIconPath!,
            width: widget.suffixIconSize,
            height: widget.suffixIconSize,
            colorFilter:
                widget.suffixIconColor != null
                    ? ColorFilter.mode(widget.suffixIconColor!, BlendMode.srcIn)
                    : ColorFilter.mode(_defaultIconColor, BlendMode.srcIn),
          ),
        ),
      );
    }

    return null;
  }

  Widget _buildPasswordToggleIcon() {
    Widget iconWidget;

    if (_obscureText) {
      if (widget.passwordHiddenIcon != null) {
        iconWidget = widget.passwordHiddenIcon!;
      } else if (widget.passwordHiddenIconPath != null &&
          widget.passwordHiddenIconPath!.isNotEmpty) {
        iconWidget = SvgPicture.asset(
          widget.passwordHiddenIconPath!,
          width: widget.suffixIconSize,
          height: widget.suffixIconSize,
          colorFilter:
              widget.suffixIconColor != null
                  ? ColorFilter.mode(widget.suffixIconColor!, BlendMode.srcIn)
                  : ColorFilter.mode(_defaultIconColor, BlendMode.srcIn),
        );
      } else {
        iconWidget = Icon(
          Icons.visibility_off,
          size: widget.suffixIconSize,
          color: widget.suffixIconColor ?? _defaultIconColor,
        );
      }
    } else {
      if (widget.passwordVisibleIcon != null) {
        iconWidget = widget.passwordVisibleIcon!;
      } else if (widget.passwordVisibleIconPath != null &&
          widget.passwordVisibleIconPath!.isNotEmpty) {
        iconWidget = SvgPicture.asset(
          widget.passwordVisibleIconPath!,
          width: widget.suffixIconSize,
          height: widget.suffixIconSize,
          colorFilter:
              widget.suffixIconColor != null
                  ? ColorFilter.mode(widget.suffixIconColor!, BlendMode.srcIn)
                  : ColorFilter.mode(_defaultIconColor, BlendMode.srcIn),
        );
      } else {
        iconWidget = Icon(
          Icons.visibility,
          size: widget.suffixIconSize,
          color: widget.suffixIconColor ?? _defaultIconColor,
        );
      }
    }

    return GestureDetector(
      onTap: _togglePasswordVisibility,
      child: Padding(
        padding: widget.suffixIconPadding ?? const EdgeInsets.all(12.0),
        child: iconWidget,
      ),
    );
  }

  InputDecoration _buildInputDecoration() {
    return InputDecoration(
      hintText: widget.hintText,
      hintStyle: _defaultHintStyle,
      filled: widget.filled,
      fillColor: _defaultFillColor,
      contentPadding:
          widget.contentPadding ??
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),

      // Borders
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        borderSide: BorderSide(
          color: _defaultBorderColor,
          width: widget.borderWidth,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        borderSide: BorderSide(
          color: _defaultBorderColor,
          width: widget.borderWidth,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        borderSide: BorderSide(
          color: _defaultFocusedBorderColor,
          width: widget.focusedBorderWidth,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        borderSide: BorderSide(
          color: _defaultErrorBorderColor,
          width: widget.errorBorderWidth,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        borderSide: BorderSide(
          color: _defaultErrorBorderColor,
          width: widget.errorBorderWidth,
        ),
      ),

      // Icons
      prefixIcon: _buildPrefixIcon(),
      suffixIcon: _buildSuffixIcon(),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget textField;

    // Handle dropdown
    if (widget.dropdownItems != null && widget.dropdownItems!.isNotEmpty) {
      textField = DropdownButtonFormField<String>(
        value: widget.dropdownValue,
        items: widget.dropdownItems,
        onChanged:
            widget.enabled
                ? (value) => widget.onChanged?.call(value ?? '')
                : null,
        decoration: _buildInputDecoration(),
        style: _defaultTextStyle,
        dropdownColor: _defaultFillColor,
        iconEnabledColor: widget.dropdownIconColor ?? _defaultIconColor,
        validator: widget.validator,
        autovalidateMode: widget.autovalidateMode,
        menuMaxHeight: widget.dropdownMaxHeight,
      );
    } else {
      // Regular text field
      textField = TextFormField(
        controller: widget.controller,
        enabled: widget.enabled,
        autofocus: widget.autofocus,
        focusNode: widget.focusNode,
        maxLength: widget.maxLength,
        maxLines:
            widget.maxLines ??
            (widget.keyboardType == TextInputType.multiline ? null : 1),
        minLines:
            widget.minLines ??
            (widget.keyboardType == TextInputType.multiline ? 3 : null),
        autovalidateMode: widget.autovalidateMode,
        obscureText: _obscureText,
        keyboardType: widget.keyboardType,
        textAlign: widget.textAlign,
        style: _defaultTextStyle,
        decoration: _buildInputDecoration(),
        validator: widget.validator,
        onChanged: widget.onChanged,
        onFieldSubmitted: widget.onFieldSubmitted,
        onSaved: widget.onSaved,
        onTap: widget.onTap,
      );
    }

    // Wrap with container for additional styling if needed
    if (widget.height != null ||
        widget.width != null ||
        widget.boxShadow != null) {
      return Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(boxShadow: widget.boxShadow),
        child: textField,
      );
    }

    return textField;
  }
}

// Usage example and extension for common field types
class CustomTextFieldVariants {
  static UpdateTextField email({
    required String hintText,
    TextEditingController? controller,
    String? prefixIconPath,
    FormFieldValidator<String>? validator,
    ValueChanged<String>? onChanged,
    Color? fillColor,
    Color? borderColor,
    Color? focusedBorderColor,
    Color? prefixIconColor,
    bool applyPrefixIconColor = true,
  }) {
    return UpdateTextField(
      hintText: hintText,
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      prefixIconPath: prefixIconPath,
      prefixIconColor: prefixIconColor,
      applyPrefixIconColor: applyPrefixIconColor,
      validator:
          validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'Email is required';
            }
            const emailRegex =
                r'^[a-zA-Z0-9.a-zA-Z0-9.!#$%&*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
            if (!RegExp(emailRegex).hasMatch(value)) {
              return 'Please enter a valid email';
            }
            return null;
          },
      onChanged: onChanged,
      fillColor: fillColor,
      borderColor: borderColor,
      focusedBorderColor: focusedBorderColor,
    );
  }

  static UpdateTextField password({
    required String hintText,
    TextEditingController? controller,
    String? prefixIconPath,
    String? passwordVisibleIconPath,
    String? passwordHiddenIconPath,
    FormFieldValidator<String>? validator,
    ValueChanged<String>? onChanged,
    Color? fillColor,
    Color? borderColor,
    Color? focusedBorderColor,
    Color? prefixIconColor,
    bool applyPrefixIconColor = true,
  }) {
    return UpdateTextField(
      hintText: hintText,
      controller: controller,
      isPasswordField: true,
      prefixIconPath: prefixIconPath,
      prefixIconColor: prefixIconColor,
      applyPrefixIconColor: applyPrefixIconColor,
      passwordVisibleIconPath: passwordVisibleIconPath,
      passwordHiddenIconPath: passwordHiddenIconPath,
      validator: validator,
      onChanged: onChanged,
      fillColor: fillColor,
      borderColor: borderColor,
      focusedBorderColor: focusedBorderColor,
    );
  }

  static UpdateTextField search({
    required String hintText,
    TextEditingController? controller,
    String? prefixIconPath,
    String? suffixIconPath,
    VoidCallback? onSuffixIconTap,
    ValueChanged<String>? onChanged,
    Color? fillColor,
    Color? borderColor,
    double borderRadius = 25.0,
    Color? prefixIconColor,
    bool applyPrefixIconColor = true,
  }) {
    return UpdateTextField(
      hintText: hintText,
      controller: controller,
      prefixIconPath: prefixIconPath,
      prefixIconColor: prefixIconColor,
      applyPrefixIconColor: applyPrefixIconColor,
      suffixIconPath: suffixIconPath,
      onSuffixIconTap: onSuffixIconTap,
      onChanged: onChanged,
      fillColor: fillColor,
      borderColor: borderColor,
      borderRadius: borderRadius,
    );
  }
}
