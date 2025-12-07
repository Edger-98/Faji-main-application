import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/core/routing/route_manager.dart';
import 'package:fajimobileapp/presentation/widgets/common/animated_button.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _recentSearches = [
    'Lorem',
    'Ispum di',
    'duie',
    'vuty',
    'gtfwqop',
    'sda',
    'upaya',
  ];

  final List<Map<String, String>> _artists = [
    {'name': 'Neil Collins', 'image': 'https://i.pravatar.cc/150?img=11'},
    {'name': 'Willis Casper', 'image': 'https://i.pravatar.cc/150?img=12'},
    {'name': 'Dexter Crist', 'image': 'https://i.pravatar.cc/150?img=13'},
    {'name': 'Eunice Ebert', 'image': 'https://i.pravatar.cc/150?img=14'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 64.h),
          // Header
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Row(
              children: [
                AnimatedButton(
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
                const Spacer(),
                Text(
                  'Search',
                  style: TextStyle(
                    fontFamily: AppTypography.modicaPro,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w500,
                    height: 1.2,
                    color: context.colors.onSurface,
                  ),
                ),
                const Spacer(),
                Container(
                  width: 50.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainerHighest,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.filter_list,
                    color: const Color(0xFFDCDCDC),
                    size: 18.sp,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          // Search bar
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Container(
              height: 69.h,
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(34.5.r),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    color: const Color(0xFFA1A1A1),
                    size: 18.sp,
                  ),
                  SizedBox(width: 15.w),
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      style: TextStyle(
                        fontFamily: AppTypography.modicaPro,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w100,
                        height: 1.2,
                        color: context.colors.onSurface,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Search on Faji',
                        hintStyle: TextStyle(
                          fontFamily: AppTypography.modicaPro,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w100,
                          height: 1.2,
                          color: const Color(0xFFA1A1A1),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  AppText.labelLarge(
                    'Cancel',
                    color: context.colors.onSurface,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 23.h),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Recent Searches
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText.headlineMedium(
                        'Recent Searches',
                        color: context.colors.onSurface,
                      ),
                      Text(
                        'Clear all',
                        style: TextStyle(
                          fontFamily: AppTypography.modicaPro,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w100,
                          height: 1.2,
                          color: const Color(0xFFA1A1A1),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 17.h),
                  Wrap(
                    spacing: 5.w,
                    runSpacing: 5.h,
                    children: _recentSearches.map((search) {
                      return _buildSearchChip(search);
                    }).toList(),
                  ),
                  SizedBox(height: 25.h),
                  // Artists recommend
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText.headlineMedium(
                        'Artists recommend',
                        color: context.colors.onSurface,
                      ),
                      Text(
                        'View all',
                        style: TextStyle(
                          fontFamily: AppTypography.modicaPro,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w100,
                          height: 1.2,
                          color: const Color(0xFFA1A1A1),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: _artists.map((artist) {
                      return _buildArtistAvatar(
                        artist['name']!,
                        artist['image']!,
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 24.h),
                  // Popular near you
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText.headlineMedium(
                        'Popular near you',
                        color: context.colors.onSurface,
                      ),
                      Text(
                        'View all',
                        style: TextStyle(
                          fontFamily: AppTypography.modicaPro,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w100,
                          height: 1.2,
                          color: const Color(0xFFA1A1A1),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  _buildEventCard(
                    'https://picsum.photos/163/119?random=300',
                    'GENfest Music Festival 2024 - Multi -  sensorial Audio Interface',
                    'Wed 22/03',
                    '08:30 PM',
                    'From \$40.00',
                  ),
                  SizedBox(height: 16.h),
                  _buildEventCard(
                    'https://picsum.photos/163/119?random=301',
                    'GENfest Music Festival 2024 - Multi -  sensorial Audio Interface',
                    'Wed 22/03',
                    '08:30 PM',
                    'From \$40.00',
                  ),
                  SizedBox(height: 100.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchChip(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(37.r),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: AppTypography.modicaPro,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          height: 1.2,
          color: const Color(0xFFD6D6D6),
        ),
      ),
    );
  }

  Widget _buildArtistAvatar(String name, String imageUrl) {
    return Column(
      children: [
        Container(
          width: 61.2.w,
          height: 61.2.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 5.h),
        SizedBox(
          width: 71.w,
          child: Text(
            name,
            style: TextStyle(
              fontFamily: AppTypography.modicaPro,
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              height: 1.2,
              color: const Color(0xFFD6D6D6),
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildEventCard(
      String imageUrl,
      String title,
      String date,
      String time,
      String price,
      ) {
    return GestureDetector(
      onTap: () {
        context.push(RouteManager.eventDetails);
      },
      child: Row(
        children: [
          Container(
            width: 163.w,
            height: 119.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(26.r),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 13.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText.bodyMedium(
                  title,
                  color: context.colors.onSurface,
                  maxLines: 3,
                ),
                SizedBox(height: 11.h),
                Row(
                  children: [
                    AppText.bodySmall(
                      date,
                      color: AppColors.textSecondary,
                    ),
                    SizedBox(width: 6.w),
                    Container(
                      width: 3.w,
                      height: 3.h,
                      decoration: const BoxDecoration(
                        color: AppColors.dotSeparator,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 6.w),
                    AppText.bodySmall(
                      time,
                      color: AppColors.textSecondary,
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
                AppText.bodySmall(
                  price,
                  color: context.colors.primary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
