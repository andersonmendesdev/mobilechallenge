import 'package:flutter/material.dart';
import '../../../../core/extension/extension_string.dart';
import '../../../../domain/entities/user_entity.dart';
import '../../widget/avatar/avatar_user_widget.dart';

class CardUserWidget extends StatelessWidget {
  const CardUserWidget({
    Key? key,
    required this.userEntity,
    required this.onShowProfile,
  }) : super(key: key);
  final UserEntity userEntity;
  final VoidCallback onShowProfile;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Card(
        margin: const EdgeInsets.only(
            left: 15.0, top: 5.0, bottom: 5.0, right: 15.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(4.0),
            onTap: onShowProfile,
            child: Row(
              children: [
                AvatarUserWidget(
                  uri: userEntity.picture.large,
                  radius: 40,
                  margin: const EdgeInsets.only(left: 15, right: 15),
                ),
                const SizedBox(width: 10.0),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: [
                          Flexible(
                            child: Text(userEntity.fullName,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700),
                                softWrap: true),
                          ),
                        ],
                      ),
                      Text(
                        userEntity.location.country,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(
                            fontSize: 15,
                            color: Colors.black.withOpacity(0.6),
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 6),
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              userEntity.gender.toUpperCasePartial(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                      fontSize: 15,
                                      color: Colors.black.withOpacity(0.6),
                                      fontWeight: FontWeight.w600),
                            ),
                            Text(
                              userEntity.birthDay,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                      fontSize: 15,
                                      color: Colors.black.withOpacity(0.6),
                                      fontWeight: FontWeight.w500),
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
