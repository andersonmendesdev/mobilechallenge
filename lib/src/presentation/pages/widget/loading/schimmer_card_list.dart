import 'package:flutter/material.dart';

import '../../library/shimmer.dart';

enum TypeSchimmerCard { expense, none }

class SchimmerCards extends StatelessWidget {
  const SchimmerCards({Key? key, this.isColumn = false}) : super(key: key);
  final bool isColumn;
  @override
  Widget build(BuildContext context) {
    var widget = const _CardDefault();
    var listWidget = <Widget>[
      widget,
      widget,
      widget,
      widget,
      widget,
      widget,
      widget,
      widget,
      widget,
      widget,
    ];
    if (isColumn) {
      return Column(children: listWidget);
    }
    return ListView(padding: const EdgeInsets.all(0), children: listWidget);
  }
}

class _CardDefault extends StatelessWidget {
  const _CardDefault({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Card(
        margin: const EdgeInsets.only(
            left: 15.0, top: 5.0, bottom: 5.0, right: 15.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4.0),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[350]!,
            highlightColor: Colors.grey[100]!,
            child: Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  margin: const EdgeInsets.only(left: 15, right: 15),
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                ),
                const SizedBox(width: 10.0),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _Container(
                        child: Text('userEntity.fullName',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    fontSize: 17, fontWeight: FontWeight.w700),
                            softWrap: true),
                      ),
                      const SizedBox(height: 2),
                      _Container(
                        child: Text(
                          'userEntity',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontSize: 15,
                                  color: Colors.black.withOpacity(0.6),
                                  fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _Container(
                              child: Text(
                                'male',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        fontSize: 15,
                                        color: Colors.black.withOpacity(0.6),
                                        fontWeight: FontWeight.w500),
                              ),
                            ),
                            _Container(
                              child: Text(
                                '00/00/0000',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        fontSize: 15,
                                        color: Colors.black.withOpacity(0.6),
                                        fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Container extends StatelessWidget {
  const _Container({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: child,
    );
  }
}
