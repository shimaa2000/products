import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../theme/fonts_styles/app_font_styles.dart';


class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.images.emptyList.svg(),
            Text(
              "no_invoices_found",
              style: FontStyles.instance.p16,
            ),
          ],
        ),
      ),
    );
  }
}
