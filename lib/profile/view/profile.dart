import 'package:flutter/material.dart';

import 'widgets/profile_calendar.dart';
import 'widgets/profile_header.dart';
import 'widgets/profile_training_history.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return CustomScrollView(
      slivers: [
        ProfileHeader(textTheme: textTheme),
        const ProfileCalendar(),
        SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.only(top: 32, bottom: 16),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Training History',
              style: textTheme.titleMedium,
            ),
          ),
        ),
        const ProfileTrainingHistory(),
      ],
    );
  }
}
