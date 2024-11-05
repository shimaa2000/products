import 'dart:ui';

import '../enum/post_status_enum.dart';
import '../theme/colors/app_colors.dart';


class PostStatusHelper {
  static Color getStatusColor(PostStatusEnum status) {
    return switch (status) {
      PostStatusEnum.notposted => AppColors.pendingStatusColor,
      _ => AppColors.successStatusColor,
    };
  }

  static Color getStatusTextColor(PostStatusEnum status) {
    return switch (status) {
      PostStatusEnum.notposted => AppColors.pendingStatusTextColor,
      _ => AppColors.successStatusTextColor,
    };
  }
}
