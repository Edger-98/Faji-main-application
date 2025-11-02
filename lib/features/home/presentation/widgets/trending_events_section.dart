import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:fajimobileapp/core/routing/route_manager.dart';
import 'package:fajimobileapp/features/home/presentation/widgets/widgets.dart';

/// Trending events horizontal scrollable section
class TrendingEventsSection extends StatelessWidget {
  const TrendingEventsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(
          title: 'Trending Events',
          onViewAll: () {
            // TODO: Navigate to all trending events
          },
        ),
        SizedBox(height: 20.h),
        SizedBox(
          height: 267.h,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            separatorBuilder: (context, index) => SizedBox(width: 16.w),
            itemBuilder: (context, index) {
              return EventCard(
                imageUrl: 'https://picsum.photos/306/244?random=$index',
                title: 'GENfest Music Festival 2024 - Multi - sensorial Audio Interface',
                date: 'Wed 22/03',
                time: '08:30 PM',
                price: 'From \$40.00',
                isLive: index == 0,
                onTap: () {
                  context.push(RouteManager.eventDetails);
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
