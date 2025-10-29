import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fajimobileapp/features/home/presentation/widgets/widgets.dart';

/// Your events horizontal scrollable section
class YourEventsSection extends StatelessWidget {
  const YourEventsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(
          title: 'Your Events',
          onViewAll: () {
            // TODO: Navigate to all your events
          },
        ),
        SizedBox(height: 20.h),
        SizedBox(
          height: 267.h,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            separatorBuilder: (context, index) => SizedBox(width: 16.w),
            itemBuilder: (context, index) {
              return EventCard(
                imageUrl: 'https://picsum.photos/306/244?random=${index + 20}',
                title: 'GENfest Music Festival 2024 - Multi - sensorial Audio Interface',
                date: 'Wed 22/03',
                time: '08:30 PM',
                price: 'From \$40.00',
                isLive: index == 0,
                onTap: () {
                  // TODO: Navigate to event details
                },
                onFavorite: () {
                  // TODO: Toggle favorite
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
