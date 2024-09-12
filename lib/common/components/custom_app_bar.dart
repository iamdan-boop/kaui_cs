import 'package:flutter/material.dart';
import 'package:kaui_cs/common/helpers.dart';
import 'package:sizer/sizer.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    required String title,
    VoidCallback? onBackPressed,
    ShapeBorder? shapeBorder,
    Color? color,
    List<Widget>? actions,
    super.key,
  })  : _title = title,
        _onBackPressed = onBackPressed,
        _shapeBorder = shapeBorder,
        _color = color,
        _actions = actions;

  final String _title;
  final VoidCallback? _onBackPressed;
  final ShapeBorder? _shapeBorder;
  final List<Widget>? _actions;
  final Color? _color;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      backgroundColor: _color,
      shadowColor: Colors.black,
      shape: _shapeBorder,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: _onBackPressed ?? () => context.popSafely(),
      ),
      title: Text(
        _title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      actions: _actions,
    );
  }

  @override
  Size get preferredSize => Size(100.w, 70);
}