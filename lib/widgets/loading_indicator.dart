import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/common.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          ImageResource.loadingAnimationImage,
          fit: BoxFit.contain,
          height: AppDimensions.smContainerY,
          width: AppDimensions.smContainerX,
        ),
        Text(
          StringResource.loading,
          style: Theme.of(context).textTheme.bodyText2,
        )
      ],
    );
  }
}
