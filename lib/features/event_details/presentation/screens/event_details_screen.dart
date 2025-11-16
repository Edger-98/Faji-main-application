import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/core/routing/route_manager.dart';
import 'package:fajimobileapp/presentation/widgets/common/animated_button.dart';

class EventDetailsScreen extends StatelessWidget {
  const EventDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hero Image
              Stack(
                children: [
                  Container(
                    height: 456.h,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 4.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(55.r),
                      image: const DecorationImage(
                        image: NetworkImage('https://picsum.photos/382/456?random=100'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                // Back button
                Positioned(
                  top: MediaQuery.of(context).padding.top + 10,
                  left: 24.w,
                  child: AnimatedButton(
                    onTap: () {
                      HapticFeedback.lightImpact();
                      context.pop();
                    },
                    child: Container(
                      width: 50.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: AppColors.surfaceContainerHighest,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: context.colors.onSurface,
                        size: 16.sp,
                      ),
                    ),
                  ),
                ),
                // Share button
                Positioned(
                  top: MediaQuery.of(context).padding.top + 10,
                  right: 80.w,
                  child: AnimatedButton(
                    onTap: () {
                      HapticFeedback.lightImpact();
                      // Share functionality
                    },
                    child: Container(
                      width: 50.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: AppColors.surfaceContainerHighest,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.share_outlined,
                        color: context.colors.onSurface,
                        size: 18.sp,
                      ),
                    ),
                  ),
                ),
                // Favorite button
                Positioned(
                  top: MediaQuery.of(context).padding.top + 10,
                  right: 24.w,
                  child: AnimatedButton(
                    onTap: () {
                      HapticFeedback.mediumImpact();
                      // Toggle favorite
                    },
                    child: Container(
                      width: 50.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: AppColors.surfaceContainerHighest,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.favorite_border,
                        color: context.colors.onSurface,
                        size: 19.sp,
                      ),
                    ),
                  ),
                ),
                ],
              ),
              SizedBox(height: 22.h),
            // Event title
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: AppText.displayMedium(
                'GENfest Music Festival 2024 - Multi - sensorial Audio Interface',
                color: context.colors.onSurface,
                maxLines: 3,
              ),
            ),
            SizedBox(height: 9.h),
            // Event meta info
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                children: [
                  AppText.bodySmall(
                    'Wed 22/03',
                    color: AppColors.textSecondary,
                  ),
                  SizedBox(width: 10.w),
                  Container(
                    width: 3.w,
                    height: 3.h,
                    decoration: const BoxDecoration(
                      color: AppColors.dotSeparator,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  AppText.bodySmall(
                    '08:30 PM',
                    color: AppColors.textSecondary,
                  ),
                  SizedBox(width: 10.w),
                  Container(
                    width: 3.w,
                    height: 3.h,
                    decoration: const BoxDecoration(
                      color: AppColors.dotSeparator,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  AppText.bodySmall(
                    'From \$40.00',
                    color: context.colors.primary,
                  ),
                ],
              ),
            ),
            SizedBox(height: 46.h),
            // Organizer info
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                children: [
                  Container(
                    width: 78.w,
                    height: 78.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(49.r),
                      image: const DecorationImage(
                        image: NetworkImage('https://i.pravatar.cc/150?img=12'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 13.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText.labelLarge(
                          'Rolling 5T0NES',
                          color: context.colors.onSurface,
                        ),
                        SizedBox(height: 3.h),
                        AppText.bodySmall(
                          '10M Followers',
                          color: AppColors.textSecondary,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 86.w,
                    height: 39.h,
                    decoration: BoxDecoration(
                      color: AppColors.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(34.5.r),
                    ),
                    alignment: Alignment.center,
                    child: AppText.bodyMedium(
                      'Follow',
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5.h),
            // Chat button
            Padding(
              padding: EdgeInsets.only(right: 24.w),
              child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    context.push(RouteManager.organizerChat);
                  },
                  child: Container(
                    width: 86.w,
                    height: 39.h,
                    decoration: BoxDecoration(
                      color: AppColors.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(34.5.r),
                    ),
                    alignment: Alignment.center,
                    child: AppText.bodyMedium(
                      'Chat',
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 47.h),
            // About section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: AppText.headlineMedium(
                'About the event',
                color: context.colors.onSurface,
              ),
            ),
            SizedBox(height: 5.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: AppText.bodyMedium(
                'Nesciunt alias a. Nihil sint et nihil atque. Omnis quis rerum. Quibusdam ex excepturi est ex aliquam quasi. Assumenda amet ut cumque et cumque.',
                color: AppColors.textSecondary,
                maxLines: 3,
              ),
            ),
            SizedBox(height: 18.h),
            Padding(
              padding: EdgeInsets.only(right: 24.w),
              child: Align(
                alignment: Alignment.centerRight,
                child: AppText.bodyMedium(
                  'Read more',
                  color: context.colors.primary,
                ),
              ),
            ),
            SizedBox(height: 23.h),
            // Event details card
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Container(
                width: 337.w,
                height: 194.h,
                padding: EdgeInsets.all(34.w),
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(34.5.r),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          color: AppColors.textSecondary,
                          size: 15.sp,
                        ),
                        SizedBox(width: 23.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText.bodySmall(
                              'Date',
                              color: AppColors.textSecondary,
                            ),
                            SizedBox(height: 6.h),
                            AppText.bodySmall(
                              '03 Mar 2023',
                              color: context.colors.onSurface,
                            ),
                          ],
                        ),
                        const Spacer(),
                        Icon(
                          Icons.access_time,
                          color: AppColors.textSecondary,
                          size: 16.sp,
                        ),
                        SizedBox(width: 24.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText.bodySmall(
                              'Time',
                              color: AppColors.textSecondary,
                            ),
                            SizedBox(height: 6.h),
                            AppText.bodySmall(
                              '10:00 PM - End',
                              color: context.colors.onSurface,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 21.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: AppColors.textSecondary,
                          size: 13.sp,
                        ),
                        SizedBox(width: 21.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText.bodySmall(
                                'Location',
                                color: AppColors.textSecondary,
                              ),
                              SizedBox(height: 6.h),
                              AppText.bodySmall(
                                'Bossier City South',
                                color: context.colors.onSurface,
                              ),
                              SizedBox(height: 1.h),
                              AppText.bodySmall(
                                'Wehner Rest Avon',
                                color: context.colors.onSurface,
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.push(RouteManager.eventDirection);
                          },
                          child: Container(
                            width: 108.w,
                            height: 41.h,
                            decoration: BoxDecoration(
                              color: context.colors.primary,
                              borderRadius: BorderRadius.circular(34.5.r),
                            ),
                            alignment: Alignment.center,
                            child: AppText.bodyMedium(
                              'Show map',
                              color: AppColors.onPrimary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 32.h),
            // Ticket Information section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: AppText.headlineMedium(
                'Ticket Information',
                color: context.colors.onSurface,
              ),
            ),
            SizedBox(height: 23.h),
            // Ticket cards
            SizedBox(
              height: 73.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 24.w),
                children: [
                  _buildTicketCard(context, 'GENfest Ticket', '\$40,00', '104 seats', AppColors.primary),
                  SizedBox(width: 9.w),
                  _buildTicketCard(context, 'GENfest Ticket', '\$40,00', '104 seats', AppColors.eventCardBlue),
                ],
              ),
            ),
            SizedBox(height: 39.h),
            // Participants section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText.headlineMedium(
                    'Participants',
                    color: context.colors.onSurface,
                  ),
                  AppText.bodySmall(
                    'View',
                    color: context.colors.primary,
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                children: [
                  _buildParticipantAvatar('https://i.pravatar.cc/150?img=1'),
                  _buildParticipantAvatar('https://i.pravatar.cc/150?img=2'),
                  _buildParticipantAvatar('https://i.pravatar.cc/150?img=3'),
                  _buildParticipantAvatar('https://i.pravatar.cc/150?img=4'),
                  SizedBox(width: 7.w),
                  AppText.bodySmall(
                    '+200 Joined',
                    color: AppColors.textSecondary,
                  ),
                ],
              ),
            ),
            SizedBox(height: 31.h),
            // Reviews section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText.headlineMedium(
                    'Reviews',
                    color: context.colors.onSurface,
                  ),
                  AppText.bodySmall(
                    '200+ reviews',
                    color: AppColors.textSecondary,
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            // Review cards
            _buildReviewCard(context, 'Walter Kris', 5.0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor. Rthr trsfk asdring ispum.'),
            SizedBox(height: 8.h),
            _buildReviewCard(context, 'Denise Tremblay', 5.0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor. Rthr trsfk asdring ispum.'),
            SizedBox(height: 8.h),
            Center(
              child: AppText.bodySmall(
                'View alll',
                color: AppColors.textSecondary,
              ),
            ),
            SizedBox(height: 35.h),
            // Book button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: AnimatedButton(
                onTap: () {
                  HapticFeedback.mediumImpact();
                  context.push(RouteManager.ticketInformation);
                },
                child: Container(
                  width: 337.w,
                  height: 69.h,
                  decoration: BoxDecoration(
                    color: context.colors.primary,
                    borderRadius: BorderRadius.circular(34.5.r),
                  ),
                  alignment: Alignment.center,
                  child: AppText.labelLarge(
                    'Book a ticket',
                    color: context.colors.background,
                  ),
                ),
              ),
            ),
            SizedBox(height: 88.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTicketCard(BuildContext context, String title, String price, String seats, Color accentColor) {
    return Container(
      width: 261.w,
      height: 73.h,
      padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 3.h),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(36.5.r),
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'GEN',
                style: TextStyle(
                  fontFamily: 'Ceviche One',
                  fontSize: 40.sp,
                  fontWeight: FontWeight.w400,
                  height: 1.043,
                  color: accentColor,
                ),
              ),
              Text(
                'fest',
                style: TextStyle(
                  fontFamily: 'Ceviche One',
                  fontSize: 40.sp,
                  fontWeight: FontWeight.w400,
                  height: 1.043,
                  color: accentColor,
                ),
              ),
            ],
          ),
          SizedBox(width: 24.w),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText.bodyMedium(
                  title,
                  color: context.colors.onSurface,
                ),
                SizedBox(height: 2.h),
                Row(
                  children: [
                    AppText.bodySmall(
                      price,
                      color: context.colors.primary,
                    ),
                    SizedBox(width: 11.w),
                    Container(
                      width: 3.w,
                      height: 3.h,
                      decoration: const BoxDecoration(
                        color: AppColors.dotSeparator,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 11.w),
                    AppText.bodySmall(
                      seats,
                      color: AppColors.textSecondary,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: context.colors.onSurface,
            size: 11.sp,
          ),
        ],
      ),
    );
  }

  Widget _buildParticipantAvatar(String imagePath) {
    return Transform.translate(
      offset: Offset(-11.w, 0),
      child: Container(
        width: 30.6.w,
        height: 30.6.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.background, width: 2.w),
          image: DecorationImage(
            image: NetworkImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildReviewCard(BuildContext context, String name, double rating, String review) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Container(
        width: 337.w,
        padding: EdgeInsets.all(26.w),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(37.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 31.65.w,
                  height: 31.65.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage('https://i.pravatar.cc/150?img=5'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 5.w),
                AppText.bodySmall(
                  name,
                  color: AppColors.textSecondary,
                ),
              ],
            ),
            SizedBox(height: 14.h),
            Row(
              children: [
                ...List.generate(5, (index) => Icon(
                  Icons.star,
                  color: const Color(0xFFFEB822),
                  size: 7.93.sp,
                )),
                SizedBox(width: 8.w),
                Text(
                  rating.toString(),
                  style: TextStyle(
                    fontFamily: AppTypography.ppNeueMontreal,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    height: 1.2,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
            SizedBox(height: 14.h),
            Text(
              '"$review',
              style: TextStyle(
                fontFamily: AppTypography.ppNeueMontreal,
                fontSize: 13.sp,
                fontWeight: FontWeight.w100,
                height: 1.2,
                color: const Color(0xFF9C9C9C),
              ),
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}
