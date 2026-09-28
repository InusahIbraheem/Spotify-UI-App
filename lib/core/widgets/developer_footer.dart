import 'package:flutter/material.dart';
import 'package:spotify_ui_clone/core/constants/app_constants.dart';
import 'package:spotify_ui_clone/core/theme/app_colors.dart';

class DeveloperFooter extends StatelessWidget {
  const DeveloperFooter({super.key, this.padding = const EdgeInsets.only(top: 24, bottom: 8)});

  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Center(
        child: Text(
          AppConstants.developerCredit,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.footerGray,
                fontSize: 11,
                letterSpacing: 0.2,
              ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
