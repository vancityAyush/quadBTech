import 'package:flutter/material.dart';

import '../../../../../utils/app_theme/app_config.dart';
import '../../../../../utils/font_size.dart';

class CustomSearchField extends StatefulWidget {
  final Function filter;
  final Function onClear;
  final String hintText;
  final EdgeInsets contentPadding;
  final Widget prefixIcon;
  final double? fontsize;
  const CustomSearchField(
      {Key? key,
      required this.filter,
      required this.contentPadding,
      required this.hintText,
      this.fontsize,
      required this.onClear,
      required this.prefixIcon})
      : super(key: key);

  @override
  State<CustomSearchField> createState() => CustomSearchFieldState();
}

class CustomSearchFieldState extends State<CustomSearchField> {
  final TextEditingController _controller = TextEditingController();

  void clearSearchBox() => setState(() => _controller.clear());

  @override
  Widget build(BuildContext context) {
    final theme = AppConfig.of(context).appTheme;
    return TextField(
      controller: _controller,
      cursorColor: theme.colorTextPrimary,
      onChanged: (String s) {
        widget.filter(s);
        setState(() {});
      },
      style: TextStyle(
        fontSize: widget.fontsize,
        color: theme.colorTextPrimary,
      ),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontSize: widget.fontsize ?? FontSize.s,
          fontWeight: FontWeight.w400,
          color: theme.colorTextPrimary.withOpacity(0.6),
        ),
        suffixIcon: _controller.text.isEmpty
            ? null
            : IconButton(
                onPressed: () {
                  widget.onClear();
                  clearSearchBox();
                },
                color: theme.colorTextPrimary,
                icon: const Icon(
                  Icons.close,
                ),
              ),
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                widget.prefixIcon,
                VerticalDivider(
                  color: theme.dividerColor,
                  thickness: 2,
                  indent: 10,
                  endIndent: 10,
                ),
              ],
            ),
          ),
        ),
        suffixIconConstraints: const BoxConstraints(maxHeight: 32),
        border: const UnderlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          ),
        ),
      ),
    );
  }
}
