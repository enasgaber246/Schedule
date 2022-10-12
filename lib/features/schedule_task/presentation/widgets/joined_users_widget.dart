import 'package:flutter/material.dart';
import 'package:schedule/core/utils/app_colors.dart';
import 'package:schedule/features/schedule_task/data/datasources/network/endpoints.dart';
import 'package:schedule/features/schedule_task/data/models/EventsResponse.dart';

class JoinedUsersWidget extends StatelessWidget {
  final List<Users> users;

  const JoinedUsersWidget({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: (25 * 3),
          height: 32,
          child: Stack(
            children: [
              if (users.isNotEmpty)
                Positioned(
                  left: (16.0 * 0),
                  child: userImg(users[0].profilePicture ?? ''),
                ),
              if (users.length >= 2)
                Positioned(
                  left: (16.0 * 1),
                  child: userImg(users[1].profilePicture ?? ''),
                ),
              if (users.length >= 3)
                Positioned(
                  left: (16.0 * 2),
                  child: userImg(users[2].profilePicture ?? ''),
                )
            ],
          ),
        ),
      ],
    );
  }

  Widget userImg(String img) {
    return Container(
      width: 28,
      height: 28,
      margin: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: Colors.red,
        border: Border.all(color: AppColors.white, width: 2),
        shape: BoxShape.circle,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Image.network(
          '${Endpoints.imageUrl}$img',
          fit: BoxFit.cover,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          },
        ),
      ),
    );
  }
}
