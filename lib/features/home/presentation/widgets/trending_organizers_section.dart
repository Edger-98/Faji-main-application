import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fajimobileapp/features/home/presentation/widgets/widgets.dart';

/// Trending organizers horizontal scrollable section
class TrendingOrganizersSection extends StatelessWidget {
  const TrendingOrganizersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(
          title: 'Trending Organizers',
          onViewAll: () {
            // TODO: Navigate to all organizers
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
              final names = [
                'Raul Steuber',
                'Delia Ferry',
                'Marcus Johnson',
                'Sarah Williams',
                'Alex Chen'
              ];
              return OrganizerCard(
                imageUrl: 'https://i.pravatar.cc/196?img=${index + 10}',
                name: names[index],
                onTap: () {
                  // TODO: Navigate to organizer profile
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
