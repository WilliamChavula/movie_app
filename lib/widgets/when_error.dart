import 'package:flutter/material.dart';

import '../common/common.dart';

class DisplayError extends StatelessWidget {
  final String errorMessage;
  const DisplayError({Key? key, required this.errorMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(AppDimensions.smX),
      padding: EdgeInsets.all(AppDimensions.smX),
      decoration: BoxDecoration(
        color: AppColors.lightThemeSwatch[700],
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            offset: Offset(.5, .5),
            blurRadius: 4.0,
            spreadRadius: 4.0,
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(AppDimensions.xsX)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            StringResource.somethingWentWrong,
            style: Theme.of(context).textTheme.headline6,
          ),
          Divider(
            color: Theme.of(context).dividerColor,
            height: AppDimensions.xsY,
          ),
          SizedBox(height: AppDimensions.smY),
          Text(
            errorMessage,
            style: Theme.of(context).textTheme.bodyText2,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
