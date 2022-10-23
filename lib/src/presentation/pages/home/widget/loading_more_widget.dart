import 'package:flutter/material.dart';

import '../../widget/loading/jumping_dots_widget.dart';

class  LoadingMoreWidget extends StatelessWidget {
  const LoadingMoreWidget({Key? key, required this.query}) : super(key: key);

  final String query;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (query.isEmpty)
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.refresh, color: Colors.black87),
                SizedBox(width: 10),
                Text('Loading more'),
                SizedBox(width: 5),
                JumpingDots(sizeDots: 4, animationDuration: 370, heightHeel: -5)
              ],
            ),
          )
      ],
    );
  }
}
