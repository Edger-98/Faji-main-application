import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/presentation/widgets/common/animated_button.dart';

class OrganizerChatScreen extends StatefulWidget {
  const OrganizerChatScreen({super.key});

  @override
  State<OrganizerChatScreen> createState() => _OrganizerChatScreenState();
}

class _OrganizerChatScreenState extends State<OrganizerChatScreen> {
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
              child: Row(
                children: [
                  // Back button
                  Container(
                    width: 50.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: context.colors.searchBarBackground,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios_new, size: 16.sp),
                      color: context.colors.onSurface,
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  const Spacer(),
                  // More options
                  Container(
                    width: 50.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: context.colors.searchBarBackground,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.more_horiz, size: 16.sp),
                      color: context.colors.onSurface,
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(width: 8.w),
                  // Search
                  Container(
                    width: 50.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: context.colors.searchBarBackground,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.search, size: 18.sp),
                      color: context.colors.onSurface,
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(width: 8.w),
                  // Call
                  Container(
                    width: 50.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: context.colors.searchBarBackground,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.phone_outlined, size: 16.sp),
                      color: context.colors.onSurface,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 6.h),
            // Organizer info
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                children: [
                  // Organizer avatar
                  Container(
                    width: 54.w,
                    height: 54.h,
                    decoration: BoxDecoration(
                      color: context.colors.surfaceContainerHighest,
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                        image: NetworkImage('https://i.pravatar.cc/150?img=12'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  // Organizer details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText.bodyMedium(
                          'Rolling 5T0NES',
                          color: context.colors.onSurface,
                        ),
                        SizedBox(height: 2.h),
                        AppText.bodySmall(
                          'Organizer',
                          color: AppColors.textTertiary,
                        ),
                      ],
                    ),
                  ),
                  // Online indicator
                  Container(
                    width: 13.w,
                    height: 13.h,
                    decoration: BoxDecoration(
                      color: context.colors.successGreen,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            // Messages
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                children: [
                  _buildMessageBubble(
                    context,
                    'Libero voluptas et est est. Sit sint in dolorem expedita. Et dignissimos sed cupiditate.',
                    '4:32 PM',
                    isOrganizer: true,
                  ),
                  SizedBox(height: 14.h),
                  _buildMessageBubble(
                    context,
                    'Libero voluptas et est est :)',
                    '4:32 PM',
                    isUser: true,
                  ),
                  SizedBox(height: 14.h),
                  _buildMessageBubble(
                    context,
                    'Repellat eos fuga eveniet. Inventore aperiam expedita vero austo eveniet qui. Et libero ipsa ut velit nobis. Est animi earum eveniet atque velit. Est voluptatum rerum maxime odit nesciunt ipsum inventore molestiae inventore. Blanditiis eos ut. eos fuga eveniet. Inventore aperiam expedita vero a usto eveniet qui.',
                    '4:32 PM',
                    isOrganizer: true,
                  ),
                  SizedBox(height: 14.h),
                ],
              ),
            ),
            // Message input
            Container(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
              margin: EdgeInsets.all(4.w),
              decoration: BoxDecoration(
                color: context.colors.searchBarBackground,
                borderRadius: BorderRadius.circular(34.5.r),
              ),
              child: Row(
                children: [
                  SizedBox(width: 20.w),
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      style: TextStyle(
                        fontFamily: AppTypography.modicaPro,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w100,
                        color: context.colors.onSurface,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Message',
                        hintStyle: TextStyle(
                          fontFamily: AppTypography.modicaPro,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w100,
                          color: context.colors.onSurface.withOpacity(0.5),
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                      ),
                      maxLines: null,
                    ),
                  ),
                  AnimatedButton(
                    onTap: () {
                      // Handle send message
                      if (_messageController.text.isNotEmpty) {
                        HapticFeedback.mediumImpact();
                        // TODO: Send message logic
                        _messageController.clear();
                      }
                    },
                    child: Container(
                      width: 47.w,
                      height: 47.h,
                      decoration: BoxDecoration(
                        color: context.colors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.arrow_upward,
                        color: context.colors.background,
                        size: 20.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageBubble(
    BuildContext context,
    String message,
    String time, {
    bool isOrganizer = false,
    bool isUser = false,
  }) {
    return Column(
      crossAxisAlignment: isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        if (!isUser)
          AppText.bodyMedium(
            isOrganizer ? 'Rolling 5T0NES' : 'Lola Schmidt',
            color: isOrganizer ? context.colors.primary : AppColors.eventCardYellow,
          ),
        SizedBox(height: 6.h),
        Container(
          constraints: BoxConstraints(
            maxWidth: isUser ? 177.w : 269.w,
          ),
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
          //  color: context.colors.messageBubbleBackground,
            borderRadius: BorderRadius.circular(isUser ? 18.r : 21.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message,
                style: TextStyle(
                  fontFamily: AppTypography.modicaPro,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w100,
                  color: context.colors.onSurface,
                  height: 1.11,
                ),
              ),
              SizedBox(height: 8.h),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  time,
                  style: TextStyle(
                    fontFamily: AppTypography.modicaPro,
                    fontSize: isUser ? 10.sp : 12.sp,
                    fontWeight: FontWeight.w100,
                    color: context.colors.onSurface,
                    height: 1.11,
                  ),
                ),
              ),
            ],
          ),
        ),
        if (isUser) ...[
          SizedBox(height: 6.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 44.w,
                height: 44.h,
                decoration: BoxDecoration(
                  color: context.colors.surfaceContainerHighest,
                  shape: BoxShape.circle,
                  image: const DecorationImage(
                    image: NetworkImage('https://i.pravatar.cc/150?img=8'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}
