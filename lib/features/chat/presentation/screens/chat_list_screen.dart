import 'package:flutter/material.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  bool _showEventsChat = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: Row(
                children: [
                  // Back button
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.searchBarBackground,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new, size: 16),
                      color: AppColors.onSurface,
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  const Spacer(),
                  // Title
                  Text(
                    'Chat',
                    style: AppTypography.headlineMedium.copyWith(
                      color: AppColors.onSurface,
                      fontWeight: AppTypography.medium,
                    ),
                  ),
                  const Spacer(),
                  // Settings button
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.searchBarBackground,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.more_horiz, size: 16),
                      color: AppColors.onSurface,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 13),
            // Search bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                height: 51,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  color: AppColors.searchBarBackground,
                  borderRadius: BorderRadius.circular(34.5),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: AppColors.onSurfaceVariant,
                      size: 18,
                    ),
                    const SizedBox(width: 15),
                    Text(
                      'Search chat',
                      style: AppTypography.labelLarge.copyWith(
                        color: AppColors.onSurfaceVariant,
                        fontWeight: AppTypography.thin,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Filter tabs
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  _buildFilterChip('Events chat', _showEventsChat, () {
                    setState(() => _showEventsChat = true);
                  }),
                  const SizedBox(width: 9),
                  _buildFilterChip('Organizers', !_showEventsChat, () {
                    setState(() => _showEventsChat = false);
                  }),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Chat list
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                children: [
                  _buildChatItem(
                    name: 'GENfest',
                    message: 'asperiores laboriosam volup...',
                    time: '17:36',
                    unreadCount: 5,
                    isEvent: true,
                  ),
                  const SizedBox(height: 15),
                  _buildChatItem(
                    name: 'Generator Man',
                    message: 'velit veniam et',
                    time: '17:36',
                    unreadCount: 3,
                    hasAvatar: true,
                  ),
                  const SizedBox(height: 15),
                  _buildChatItem(
                    name: 'Matthew Boyle',
                    message: 'distinctio qui necessitatibus',
                    time: '17:36',
                    unreadCount: 2,
                    hasAvatar: true,
                  ),
                  const SizedBox(height: 15),
                  _buildChatItem(
                    name: 'Ejinne Seun',
                    message: 'sint corporis debitis',
                    time: '17:36',
                    isTyping: true,
                    hasAvatar: true,
                  ),
                  const SizedBox(height: 15),
                  _buildChatItem(
                    name: 'Bolu Shakur',
                    message: 'debitis et qui',
                    time: '17:36',
                    hasAvatar: true,
                  ),
                  const SizedBox(height: 15),
                  _buildChatItem(
                    name: 'Jane Neigbour',
                    message: 'optio fuga nemo',
                    time: '17:36',
                    hasAvatar: true,
                  ),
                  const SizedBox(height: 15),
                  _buildChatItem(
                    name: 'Tuski Morgan',
                    message: 'voluptatem tenetur eius',
                    time: '17:36',
                    unreadCount: 1,
                    hasAvatar: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 33,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: AppColors.categoryChipBackground,
          borderRadius: BorderRadius.circular(34.5),
        ),
        child: Center(
          child: Text(
            label,
            style: AppTypography.bodyLarge.copyWith(
              color: isSelected ? AppColors.primary : AppColors.textTertiary,
              fontWeight: AppTypography.regular,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildChatItem({
    required String name,
    required String message,
    required String time,
    int? unreadCount,
    bool isTyping = false,
    bool isEvent = false,
    bool hasAvatar = false,
  }) {
    return Row(
      children: [
        // Avatar
        Container(
          width: isEvent ? 46 : 45,
          height: isEvent ? 46 : 45,
          decoration: BoxDecoration(
            color: isEvent ? const Color(0xFF3E3E3E) : const Color(0xFFC4C4C4),
            shape: BoxShape.circle,
          ),
          child: isEvent
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'GEN',
                        style: AppTypography.bodyMedium.copyWith(
                          color: AppColors.primary,
                          fontWeight: AppTypography.regular,
                          fontSize: 22,
                          fontFamily: 'Ceviche One',
                          height: 1.04,
                        ),
                      ),
                      Text(
                        'fest',
                        style: AppTypography.bodyMedium.copyWith(
                          color: AppColors.primary,
                          fontWeight: AppTypography.regular,
                          fontSize: 22,
                          fontFamily: 'Ceviche One',
                          height: 1.04,
                        ),
                      ),
                    ],
                  ),
                )
              : null,
        ),
        const SizedBox(width: 20),
        // Chat info
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: AppTypography.bodyMedium.copyWith(
                  color: isTyping ? const Color(0xFFDDDDDD) : AppColors.onSurface,
                  fontWeight: AppTypography.regular,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                message,
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.textTertiary,
                  fontWeight: AppTypography.regular,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
        // Time and badge
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              time,
              style: AppTypography.bodySmall.copyWith(
                color: const Color(0xFF929191),
                fontWeight: AppTypography.regular,
                fontSize: 12,
              ),
            ),
            if (unreadCount != null) ...[
              const SizedBox(height: 4),
              Container(
                width: 21,
                height: 21,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '$unreadCount',
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.background,
                      fontWeight: AppTypography.regular,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            ],
            if (isTyping) ...[
              const SizedBox(height: 4),
              Text(
                'typing',
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.primary,
                  fontWeight: AppTypography.light,
                  fontSize: 12,
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}
