import 'package:flutter/material.dart';

import '../../../../core/images/images_assets.dart' as assets;


enum TypeEmptyState { empty, resource, happy, support }

///[TypeEmptyState] indicate empty state
///
///
/// image that indicates unavailable content
/// * resource
///
/// image for states of celebration
/// * happy
///
/// image that indicates help
/// * support
///
/// image that indicates no content
/// * default
class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget(
      {Key? key,
      required this.title,
      this.subTitle = '',
      this.spaceTop = 70,
      this.childrens = const <Widget>[],
      this.typeEmptyState = TypeEmptyState.empty})
      : super(key: key);

  final String title;
  final String subTitle;
  final double spaceTop;

  final List<Widget> childrens;
  final TypeEmptyState typeEmptyState;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.top,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(height: spaceTop),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              _BuildImageWidget(typeEmptyState: typeEmptyState),
            ],
          ),
          if (title.isNotEmpty) const SizedBox(height: 10),
          if (title.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Text(
                title,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black54),
                textAlign: TextAlign.center,
              ),
            ),
          if (subTitle.isNotEmpty) const SizedBox(height: 5),
          if (subTitle.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Text(
                subTitle,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black45),
                textAlign: TextAlign.center,
              ),
            ),
          if (childrens.isNotEmpty)
            Column(
              children: childrens,
            )
        ],
      ),
    );
  }
}


class _BuildImageWidget extends StatelessWidget {
  const _BuildImageWidget({Key? key, required this.typeEmptyState}) : super(key: key);
  final TypeEmptyState typeEmptyState;
  @override
  Widget build(BuildContext context) {
    switch(typeEmptyState){
      case TypeEmptyState.empty:
        return const Image(
          width: 150,
          filterQuality: FilterQuality.medium,
          image: AssetImage(assets.emptyState),
        );
      case TypeEmptyState.resource:
        return const Image(
          width: 150,
          filterQuality: FilterQuality.medium,
          image: AssetImage(assets.resourcesNotFound),
        );
      case TypeEmptyState.happy:
        return const Image(
          width: 150,
          filterQuality: FilterQuality.medium,
          image: AssetImage(assets.handshake),
        );
      case TypeEmptyState.support:
        return const Image(
          width: 170,
          filterQuality: FilterQuality.medium,
          image: AssetImage(assets.womansuport),
        );
    }
  }
}
