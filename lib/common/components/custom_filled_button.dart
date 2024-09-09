import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kaui_cs/common/app_colors.dart';
import 'package:sizer/sizer.dart';

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton({
    required bool isLoading,
    required String text,
    VoidCallback? onPressed,
    double? width,
    double? height,
    Color? backgroundColor,
    super.key,
  })  : _onPressed = onPressed,
        _isLoading = isLoading,
        _text = text,
        _width = width,
        _height = height,
        _backgroundColor = backgroundColor;

  final VoidCallback? _onPressed;
  final String _text;
  final double? _width;
  final double? _height;
  final Color? _backgroundColor;
  final bool _isLoading;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: _onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.resolveWith(
          (states) => RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        fixedSize: MaterialStateProperty.resolveWith(
          (states) => Size(_width ?? 75.w, _height ?? 56),
        ),
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (!states.contains(MaterialState.disabled)) {
              return _backgroundColor ?? AppColors.red;
            }
            return _backgroundColor;
          },
        ),
      ),
      child: _isLoading
          ? const Center(
              child: SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              ),
            )
          : Text(
              _text,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
    );
  }
}
