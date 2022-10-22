import 'package:flutter/material.dart';

import '../../../../core/extension/extension_string.dart';
import '../../../../domain/entities/user_entity.dart';
import '../../widget/avatar/avatar_user_widget.dart';
import '../../widget/text/_export.dart';

class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({Key? key, required this.user}) : super(key: key);

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Positioned.fill(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(child: SubTitleResumeWidget(text: user.fullName))
                ],
              ),
              Body2ResumePage(text: user.email),

              const SizedBox(height: 20),
              Body2ResumePage(text: user.gender.toUpperCasePartial(),color: Colors.black87),
              Body2ResumePage(text: user.birthDay,color: Colors.black87),
              Body2ResumePage(text: user.phone,color: Colors.black87),
              Body2ResumePage(text: user.nat,color: Colors.black87),
              const SizedBox(height: 20),
              Body2ResumePage(text: user.location.streetNumber,color: Colors.black87),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(child: Body2ResumePage(text: user.location.cityCountryZip,color: Colors.black87)),
                ],
              ),
              Body2ResumePage(text: user.location.country,color: Colors.black87),
              const SizedBox(height: 20),
              Body2ResumePage(text: user.id.fullId,color: Colors.black87),

            ],
          ),
        ),
        PositionedAvatarWidget(uri: user.picture.large),
        const _ButtonCloseWidget(),
      ],
    );
  }
}

class PositionedAvatarWidget extends StatelessWidget {
  const PositionedAvatarWidget({Key? key, required this.uri}) : super(key: key);
  final String uri;

  @override
  Widget build(BuildContext context) {
    return Positioned(top: -60, child: AvatarUserWidget(uri: uri));
  }
}

class _ButtonCloseWidget extends StatelessWidget {
  const _ButtonCloseWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 15,
      right: 15,
      child: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.close, color: Colors.black, size: 30),
      ),
    );
  }
}

// FractionalTranslation(
//     translation:const Offset(0.0, -0.5),
//     child: AvatarUserWidget(uri: user.picture.large)),
