import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';

class FaqsScreen extends StatefulWidget {
  const FaqsScreen({super.key});

  @override
  State<FaqsScreen> createState() => _FaqsScreenState();
}

class _FaqsScreenState extends State<FaqsScreen> {
  int? _expandedIndex;

  final List<Map<String, String>> _faqs = [
    {
      'question': 'What is Faji?',
      'answer':
          'Faji is a comprehensive event management platform that connects event organizers with vendors, handles ticketing, payments, and provides tools to create and manage successful events.',
    },
    {
      'question': 'How do I create an event?',
      'answer':
          'Tap the "+" button on the My Events tab, fill in your event details including title, description, date, location, and ticket pricing. You can also add vendors from our marketplace.',
    },
    {
      'question': 'How does payment work?',
      'answer':
          'Payments are processed securely through Stripe. For ticket purchases, funds are held in escrow until event verification. Vendors receive payment after successful event completion.',
    },
    {
      'question': 'What is event verification?',
      'answer':
          'After your event, attendees verify that it took place as described. Once verified, payments are released to organizers and vendors. This protects both buyers and sellers.',
    },
    {
      'question': 'How do I become a vendor?',
      'answer':
          'Go to your Profile, tap "Become a Vendor", fill in your business details, select your service categories, and submit for approval. Once approved, you can list your services.',
    },
    {
      'question': 'How do vendor bookings work?',
      'answer':
          'Browse vendors in the Marketplace, send a booking request with your event details. Vendors can accept, decline, or send a counter-offer. Once agreed, the booking is confirmed.',
    },
    {
      'question': 'Can I get a refund?',
      'answer':
          'Refunds are available if an event is cancelled by the organizer or doesn\'t meet the described criteria. Refund requests are reviewed within 3-5 business days.',
    },
    {
      'question': 'How do I contact support?',
      'answer':
          'Email us at support@faji.app for any questions, issues, or feedback. We typically respond within 24 hours.',
    },
    {
      'question': 'Is my payment information secure?',
      'answer':
          'Yes! We use Stripe for payment processing, which is PCI-DSS compliant and uses industry-standard encryption. We never store your full card details.',
    },
    {
      'question': 'Can I edit my event after publishing?',
      'answer':
          'Yes, go to My Events, select your event, and tap the Edit tab. You can update most details, but changes to pricing or date may require notifying ticket holders.',
    },
    {
      'question': 'How do I share my vendor profile?',
      'answer':
          'On your vendor profile, tap the share icon in the top right. This creates a shareable link you can post on social media or send to potential clients.',
    },
    {
      'question': 'What happens if I miss an event I bought tickets for?',
      'answer':
          'Tickets are non-transferable and non-refundable for no-shows. However, you can contact the event organizer directly to discuss options.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
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
                    'FAQs',
                    style: AppTypography.headlineMedium.copyWith(
                      color: AppColors.onSurface,
                      fontWeight: AppTypography.medium,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(width: 50.w),
                ],
              ),
            ),
            // Content
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
                itemCount: _faqs.length,
                separatorBuilder: (context, index) => SizedBox(height: 12.h),
                itemBuilder: (context, index) {
                  final faq = _faqs[index];
                  final isExpanded = _expandedIndex == index;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _expandedIndex = isExpanded ? null : index;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: AppColors.searchBarBackground,
                        borderRadius: BorderRadius.circular(16.r),
                        border: isExpanded
                            ? Border.all(
                                color: AppColors.primary.withOpacity(0.3),
                                width: 1.5,
                              )
                            : null,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  faq['question']!,
                                  style: AppTypography.bodyLarge.copyWith(
                                    color: AppColors.onSurface,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Icon(
                                isExpanded
                                    ? Icons.keyboard_arrow_up_rounded
                                    : Icons.keyboard_arrow_down_rounded,
                                color: AppColors.onSurface,
                                size: 24.sp,
                              ),
                            ],
                          ),
                          if (isExpanded) ...[
                            SizedBox(height: 12.h),
                            Text(
                              faq['answer']!,
                              style: AppTypography.bodyMedium.copyWith(
                                color: AppColors.onSurfaceVariant,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
