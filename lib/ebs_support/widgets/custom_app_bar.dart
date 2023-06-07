import 'package:flutter/material.dart';

import '../utils/constants/text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key, required this.appBarTitle, this.onLeadingPress})
      : super(key: key);
  final String appBarTitle;
  final VoidCallback? onLeadingPress;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.indigo),
        onPressed: onLeadingPress ?? () => Navigator.of(context).pop(),
      ),
      title: Text(appBarTitle,
          textAlign: TextAlign.center, style: whiteBoldHeaderTextStyle),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
