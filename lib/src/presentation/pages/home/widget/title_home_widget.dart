import 'package:flutter/material.dart';

import '../../widget/text/title_resume_widget.dart';

class TitleHomeWidget extends StatelessWidget {
  const TitleHomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [TitleResumeWidget(text: 'Users')],
      ),
    );
  }
}
