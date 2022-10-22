import 'package:flutter/material.dart';

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
              children: const[
                Icon(Icons.refresh, color: Colors.black87),
                SizedBox(width: 10),
                Text('Loading more...'),
              ],
            ),
          )
      ],
    );
  }
}
