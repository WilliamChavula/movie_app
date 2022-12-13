import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'image_icon.dart';
import '../common/common.dart';
import '../extensions/extensions.dart';

class SearchField extends ConsumerStatefulWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  ConsumerState<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends ConsumerState<SearchField> {
  String _searchText = string.empty;
  late final TextEditingController _controller;
  late final FocusNode _focusNode;

  @override
  void initState() {
    _controller = TextEditingController(text: _searchText);
    _focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: AppDimensions.smY,
        right: AppDimensions.smX,
        bottom: AppDimensions.smY,
        left: AppDimensions.smX,
      ),
      child: Material(
        color: Colors.transparent,
        child: TextField(
          controller: _controller,
          focusNode: _focusNode,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
          onSubmitted: (String searchText) {
            setState(() {
              _searchText = searchText;
            });
          },
          decoration: const InputDecoration()
              .applyDefaults(Theme.of(context).inputDecorationTheme)
              .copyWith(
                suffixIcon: Padding(
                  padding: EdgeInsetsDirectional.only(end: AppDimensions.xLgX),
                  child: ImageIconWidget(
                    width: AppDimensions.smIconImageSizeX,
                    height: AppDimensions.smIconImageSizeY,
                    imageResource: context.isDarkMode
                        ? ImageResource.searchIcon
                        : ImageResource.searchIconLight,
                  ),
                ),
                hintText: StringResource.searchText,
              ),
        ),
      ),
    );
  }
}
