import 'package:fajimobileapp/core/models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/features/organize_event/presentation/providers/message_providers.dart';

/// CHAT Tab - Shows event chat with planners with REAL API DATA
class ChatTab extends ConsumerStatefulWidget {

  const ChatTab({super.key, required this.eventId});
  final String eventId;

  @override
  ConsumerState<ChatTab> createState() => _ChatTabState();
}

class _ChatTabState extends ConsumerState<ChatTab> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _sendMessage() async {
    if (_messageController.text.trim().isEmpty) return;

    final String content = _messageController.text.trim();
    _messageController.clear();

    try {
      await ref.read(messageSendProvider.notifier).sendMessage(
            widget.eventId,
            content,
          );

      // Force immediate refresh of message list
      ref.invalidate(messageListProvider(widget.eventId));
      
      // Wait a bit for the new message to appear, then scroll
      Future.delayed(const Duration(milliseconds: 500), () {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to send message: $e'),
            backgroundColor: Colors.red,
          ),
        );
        // Restore message on error
        _messageController.text = content;
      }
    }
  }

  String _formatTime(DateTime time) {
    final List<String> months = <String>['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    final int hour = time.hour > 12 ? time.hour - 12 : time.hour;
    final String period = time.hour >= 12 ? 'PM' : 'AM';
    return '${months[time.month - 1]} ${time.day}, ${hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')} $period';
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<MessageModel>> messagesAsync = ref.watch(messageListProvider(widget.eventId));

    return Column(
      children: <Widget>[
        Expanded(
          child: messagesAsync.when(
            data: (List<MessageModel> messages) {
              if (messages.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.chat_bubble_outline,
                        size: 64.sp,
                        color: AppColors.onSurfaceVariant.withOpacity(0.3),
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        'No messages yet',
                        style: TextStyle(
                          fontFamily: AppTypography.modicaPro,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.onSurface,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'Start the conversation!',
                        style: TextStyle(
                          fontFamily: AppTypography.modicaPro,
                          fontSize: 14.sp,
                          color: AppColors.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                );
              }

              return RefreshIndicator(
                onRefresh: () async {
                  ref.invalidate(messageListProvider(widget.eventId));
                },
                child: ListView.builder(
                  controller: _scrollController,
                  padding: EdgeInsets.all(16.w),
                  itemCount: messages.length,
                  itemBuilder: (BuildContext context, int index) {
                    final MessageModel message = messages[index];
                    return Padding(
                      padding: EdgeInsets.only(bottom: 12.h),
                      child: message.type == 'system'
                          ? _buildSystemMessage(
                              message.content,
                              _formatTime(message.timestamp),
                            )
                          : _buildUserMessage(
                              message.content,
                              _formatTime(message.timestamp),
                              message.senderName ?? 'Unknown',
                            ),
                    );
                  },
                ),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (Object error, StackTrace stack) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.error_outline, size: 48.sp, color: Colors.red),
                  SizedBox(height: 16.h),
                  const Text('Failed to load messages'),
                  SizedBox(height: 8.h),
                  ElevatedButton(
                    onPressed: () =>
                        ref.invalidate(messageListProvider(widget.eventId)),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          ),
        ),
        _buildChatInput(),
      ],
    );
  }

  Widget _buildSystemMessage(String message, String time) => Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: const Color(0xFF2A3A4A),
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              message,
              style: TextStyle(
                fontFamily: AppTypography.modicaPro,
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 4.h),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  time,
                  style: TextStyle(
                    fontFamily: AppTypography.modicaPro,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white.withOpacity(0.6),
                  ),
                ),
                SizedBox(width: 4.w),
                Icon(Icons.done_all, size: 12.sp, color: const Color(0xFF5B9BD5)),
              ],
            ),
          ],
        ),
      ),
    );

  Widget _buildUserMessage(String message, String time, String senderName) => Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: const Color(0xFF2A3A4A),
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (senderName.isNotEmpty)
              Padding(
                padding: EdgeInsets.only(bottom: 4.h),
                child: Text(
                  senderName,
                  style: TextStyle(
                    fontFamily: AppTypography.modicaPro,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFFFF8C42),
                  ),
                ),
              ),
            Text(
              message,
              style: TextStyle(
                fontFamily: AppTypography.modicaPro,
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 4.h),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  time,
                  style: TextStyle(
                    fontFamily: AppTypography.modicaPro,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white.withOpacity(0.6),
                  ),
                ),
                SizedBox(width: 4.w),
                Icon(Icons.done_all,
                    size: 12.sp, color: const Color(0xFF5B9BD5)),
              ],
            ),
          ],
        ),
      ),
    );

  Widget _buildChatInput() {
    final bool isSending = ref.watch(messageSendProvider).isLoading;

    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 16.h),
      decoration: BoxDecoration(
        color: AppColors.background,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A1A),
                borderRadius: BorderRadius.circular(24.r),
                border: Border.all(color: const Color(0xFF2A2A2A)),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      enabled: !isSending,
                      style: TextStyle(
                        fontFamily: AppTypography.modicaPro,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.onSurface,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Chat with planners...',
                        hintStyle: TextStyle(
                          fontFamily: AppTypography.modicaPro,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.onSurfaceVariant.withOpacity(0.5),
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 12.h),
                      ),
                      onSubmitted: (_) => _sendMessage(),
                      onChanged: (String value) => setState(() {}),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Attach file feature coming soon')),
                      );
                    },
                    icon: Icon(Icons.attach_file,
                        size: 20.sp, color: AppColors.onSurfaceVariant),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                  SizedBox(width: 8.w),
                  IconButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Camera feature coming soon')),
                      );
                    },
                    icon: Icon(Icons.camera_alt_outlined,
                        size: 20.sp, color: AppColors.onSurfaceVariant),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 12.w),
          GestureDetector(
            onTap: isSending ? null : _sendMessage,
            child: Container(
              width: 44.w,
              height: 44.h,
              decoration: BoxDecoration(
                color: isSending
                    ? const Color(0xFF2A2A2A)
                    : _messageController.text.isEmpty
                        ? const Color(0xFF2A2A2A)
                        : const Color(0xFF4CAF50),
                shape: BoxShape.circle,
              ),
              child: isSending
                  ? Padding(
                      padding: EdgeInsets.all(12.w),
                      child: const CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    )
                  : Icon(
                      Icons.send,
                      size: 20.sp,
                      color: Colors.white,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
