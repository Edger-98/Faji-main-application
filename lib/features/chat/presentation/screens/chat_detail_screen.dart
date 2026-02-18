import 'package:flutter/material.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';

class ChatDetailScreen extends StatelessWidget {
  const ChatDetailScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
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
                  // More options
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
                  const SizedBox(width: 8),
                  // Search
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.searchBarBackground,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.search, size: 18),
                      color: AppColors.onSurface,
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Call
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.searchBarBackground,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.phone_outlined, size: 16),
                      color: AppColors.onSurface,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 0),
            // Event info
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  // Event avatar
                  Container(
                    width: 58,
                    height: 58,
                    decoration: const BoxDecoration(
                      color: Color(0xFF3E3E3E),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'GEN',
                            style: AppTypography.bodyMedium.copyWith(
                              color: AppColors.primary,
                              fontWeight: AppTypography.regular,
                              fontSize: 28,
                              fontFamily: 'Ceviche One',
                              height: 1.04,
                            ),
                          ),
                          Text(
                            'fest',
                            style: AppTypography.bodyMedium.copyWith(
                              color: AppColors.primary,
                              fontWeight: AppTypography.regular,
                              fontSize: 28,
                              fontFamily: 'Ceviche One',
                              height: 1.04,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Event details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'GENfest Music Festival 2024 - Multi - \nsensorial Audio Interface',
                          style: AppTypography.bodyMedium.copyWith(
                            color: AppColors.onSurface,
                            fontWeight: AppTypography.regular,
                            fontSize: 15,
                          ),
                          maxLines: 2,
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Container(
                              width: 13,
                              height: 13,
                              decoration: const BoxDecoration(
                                color: Color(0xFF7FD249),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '200+ users',
                              style: AppTypography.bodySmall.copyWith(
                                color: AppColors.textTertiary,
                                fontWeight: AppTypography.regular,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 6),
            // Organizer badge
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: const BoxDecoration(
                      color: Color(0xFF3E3E3E),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.campaign_outlined,
                      color: AppColors.primary,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 6),
            // Messages
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                children: [
                  _buildMessageBubble(
                    'Libero voluptas et est est. Sit sint in dolorem expedita. Et dignissimos sed cupiditate nobis facere alias fugiat. Dolore perferendis qui suscipit ab.',
                    '4:32 PM',
                    isOrganizer: true,
                  ),
                  const SizedBox(height: 14),
                  Center(
                    child: Text(
                      'March 11, 2024',
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.onSurface,
                        fontWeight: AppTypography.regular,
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  _buildSystemMessage('+1 097 755 545 subscribed to the GENfest event'),
                  const SizedBox(height: 14),
                  _buildMessageBubble(
                    'Repellat eos fuga eveniet. Inventore aperiam expedita vero austo eveniet qui. Et libero ipsa ut velit nobis. Est animi earum eveniet atque velit. Est voluptatum rerum maxime odit nesciunt ipsum inventore molestiae inventore. Blanditiis eos ut. eos fuga eveniet. Inventore aperiam expedita vero a usto eveniet qui.',
                    '4:32 PM',
                    isOrganizer: true,
                  ),
                  const SizedBox(height: 14),
                  _buildMessageBubble(
                    'Libero voluptas et est est :)',
                    '4:32 PM',
                    isUser: true,
                  ),
                  const SizedBox(height: 14),
                ],
              ),
            ),
            // Admin only message
            Container(
              height: 102,
              color: AppColors.searchBarBackground,
              child: Center(
                child: Text(
                  'Only admins can send messages',
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.onSurface,
                    fontWeight: AppTypography.thin,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

  Widget _buildMessageBubble(String message, String time, {bool isOrganizer = false, bool isUser = false}) => Column(
      crossAxisAlignment: isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        if (!isUser)
          Text(
            isOrganizer ? 'GENfest' : 'Lola Schmidt',
            style: AppTypography.bodyMedium.copyWith(
              color: isOrganizer ? AppColors.primary : const Color(0xFFFEB822),
              fontWeight: AppTypography.regular,
              fontSize: 15,
            ),
          ),
        const SizedBox(height: 6),
        Container(
          constraints: BoxConstraints(
            maxWidth: isUser ? 177 : 318,
          ),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xCC282828),
            borderRadius: BorderRadius.circular(isUser ? 18 : 21),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message,
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.onSurface,
                  fontWeight: AppTypography.thin,
                  fontSize: 14,
                  height: 1.11,
                ),
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  time,
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.onSurface,
                    fontWeight: AppTypography.thin,
                    fontSize: isUser ? 10 : 12,
                    height: 1.11,
                  ),
                ),
              ),
            ],
          ),
        ),
        if (isUser) ...[
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: const BoxDecoration(
                  color: Color(0xFFD9D9D9),
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ],
      ],
    );

  Widget _buildSystemMessage(String message) => Container(
      height: 32,
      padding: const EdgeInsets.symmetric(horizontal: 34),
      decoration: BoxDecoration(
        color: AppColors.searchBarBackground,
        borderRadius: BorderRadius.circular(21),
      ),
      child: Center(
        child: Text(
          message,
          style: AppTypography.bodySmall.copyWith(
            color: AppColors.onSurface,
            fontWeight: AppTypography.thin,
          ),
        ),
      ),
    );
}
