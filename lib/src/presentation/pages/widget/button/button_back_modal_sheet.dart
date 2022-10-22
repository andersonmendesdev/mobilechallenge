import 'package:flutter/material.dart';

class ButtonBackModalSheet extends StatelessWidget {
  const ButtonBackModalSheet(
      {Key? key, this.borderRadius, this.color, this.onTap})
      : super(key: key);

  final BorderRadiusGeometry? borderRadius;
  final Color? color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: color, borderRadius: borderRadius),
      child: InkWell(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        // splashColor: Colors.transparent,
        // highlightColor: Colors.transparent,
        onTap: onTap ?? () => Navigator.of(context).pop(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 20, top: 20),
              decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
            ),
          ],
        ),
      ),
    );
  }
}
