import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:fajimobileapp/core/routing/route_manager.dart';
import 'package:fajimobileapp/features/home/presentation/widgets/widgets.dart';

/// Upcoming events horizontal scrollable section
class UpcomingEventsSection extends StatelessWidget {
  const UpcomingEventsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(
          title: 'Upcoming Events',
          onViewAll: () {
            // TODO: Navigate to all upcoming events
          },
        ),
        SizedBox(height: 20.h),
        SizedBox(
          height: 267.h,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            separatorBuilder: (context, index) => SizedBox(width: 8.w),
            itemBuilder: (context, index) {
              return UpcomingEventCard(
                imageUrl: 'https://picsum.photos/196/267?random=${index + 10}',
                month: 'MAR',
                day: '${28 + index}',
                organizerName: 'Raul Steuber',
                organizerLocation: 'California, USA',
                organizerAvatar: 'https://i.pravatar.cc/150?img=${index + 1}',
                isLive: index == 0,
                onTap: () {
                  context.push(RouteManager.eventDetails);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
