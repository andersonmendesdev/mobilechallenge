import 'package:flutter/material.dart';

import '../../../../core/library/shimmer.dart';


enum TypeSchimmerCard { expense, none }

class SchimmerCards extends StatelessWidget {
  const SchimmerCards(
      {Key? key,
      this.isColumn = false})
      : super(key: key);

  final bool isColumn;

  @override
  Widget build(BuildContext context) {
    var widget = const _CardDefault();
    if (isColumn) {
      return Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10.0, top: 10.0, bottom: 5.0),
            child: Shimmer.fromColors(
                baseColor: Colors.grey[350]!,
                highlightColor: Colors.grey[100]!,
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        color: Colors.white,
                      ),
                      height: 12,
                      width: 80,
                    ),
                  ],
                )),
          ),
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
        ],
      );
    }
    return ListView(
      padding: const EdgeInsets.all(0),
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10.0, top: 10.0, bottom: 5.0),
          child: Shimmer.fromColors(
              baseColor: Colors.grey[350]!,
              highlightColor: Colors.grey[100]!,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: Colors.white,
                    ),
                    height: 12,
                    width: 80,
                  ),
                ],
              )),
        ),
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
      ],
    );
  }
}

class _CardDefault extends StatelessWidget {
  const _CardDefault({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin:
          const EdgeInsets.only(left: 15.0, top: 5.0, bottom: 5.0, right: 15.0),
      child: Card(
        child: Shimmer.fromColors(
          baseColor: Colors.grey[350]!,
          highlightColor: Colors.grey[100]!,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: Row(
              children: [
                Container(
                  width: 4,
                  height: double.infinity,
                  color: Colors.white,
                ),
                Expanded(
                  child: Container(
                      padding:
                          const EdgeInsets.only(right: 3, bottom: 5, top: 5),
                      child: Row(
                        children: [
                          ConstrainedBox(
                            constraints: const BoxConstraints(
                                minWidth: 55.0, maxHeight: 60),
                            child: Container(
                                padding: const EdgeInsets.only(
                                    right: 8.0, left: 8.0),
                                decoration: const BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            width: 1.5, color: Colors.white))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      height: 10,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 2.0),
                                    Container(
                                      height: 10,
                                      width: 15,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 2.0),
                                    Container(
                                      height: 10,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 12,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 7.0),
                                Column(
                                  children: [
                                    Row(children: [
                                      Container(
                                        height: 8,
                                        width: 120,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                          color: Colors.white,
                                        ),
                                      ),
                                    ]),
                                    const SizedBox(height: 3.0),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 15,
                                          width: 60,
                                          margin:
                                              const EdgeInsets.only(right: 5.0),
                                          padding: const EdgeInsets.only(
                                              top: 2.0,
                                              bottom: 2.0,
                                              right: 6.0,
                                              left: 6.0),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}