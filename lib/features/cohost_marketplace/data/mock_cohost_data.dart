import 'package:fajimobileapp/features/cohost_marketplace/domain/entities/cohost_resource_entity.dart';
import 'package:fajimobileapp/features/cohost_marketplace/domain/entities/resource_category.dart';

/// Mock data for co-host resources (will be replaced with API data)
class MockCohostData {
  static List<CohostResourceEntity> getMockResources({ResourceCategory? category}) {
    final allResources = <CohostResourceEntity>[
      // Venue resources
      const CohostResourceEntity(
        id: 'venue_1',
        cohostId: 'user_1',
        cohostName: 'Sarah Johnson',
        category: ResourceCategory.venue,
        title: 'Luxury Penthouse - Victoria Island',
        description: 'Stunning 3-floor penthouse with panoramic city views. Perfect for upscale events up to 150 guests. Includes rooftop terrace, modern kitchen, and premium sound system.',
        photos: <String>[],
        basePrice: 500000,
        isAvailable: true,
        rating: 4.9,
        reviewCount: 47,
        eventsCompleted: 52,
        isVerified: true,
      ),
      const CohostResourceEntity(
        id: 'venue_2',
        cohostId: 'user_2',
        cohostName: 'Michael Okonkwo',
        category: ResourceCategory.venue,
        title: 'Garden Event Space - Lekki',
        description: 'Beautiful outdoor garden venue with covered pavilion. Ideal for weddings and large gatherings up to 300 guests. Includes parking for 50 cars.',
        photos: <String>[],
        basePrice: 350000,
        isAvailable: true,
        rating: 4.7,
        reviewCount: 38,
        eventsCompleted: 41,
        isVerified: true,
      ),

      // Entertainment resources
      const CohostResourceEntity(
        id: 'dj_1',
        cohostId: 'user_3',
        cohostName: 'DJ Spinmaster',
        category: ResourceCategory.entertainment,
        title: 'Professional DJ Services',
        description: 'Experienced DJ with 10+ years in the industry. Specializing in Afrobeats, Hip-Hop, and House music. Includes professional equipment and lighting.',
        photos: <String>[],
        basePrice: 150000,
        isAvailable: true,
        rating: 4.8,
        reviewCount: 89,
        eventsCompleted: 120,
        isVerified: true,
      ),
      const CohostResourceEntity(
        id: 'band_1',
        cohostId: 'user_4',
        cohostName: 'The Groove Band',
        category: ResourceCategory.entertainment,
        title: 'Live Band Performance',
        description: '5-piece live band playing jazz, soul, and contemporary hits. Perfect for weddings, corporate events, and upscale parties.',
        photos: <String>[],
        basePrice: 400000,
        isAvailable: true,
        rating: 4.9,
        reviewCount: 56,
        eventsCompleted: 78,
        isVerified: true,
      ),

      // Promotion resources
      const CohostResourceEntity(
        id: 'promo_1',
        cohostId: 'user_5',
        cohostName: 'Chioma Adeleke',
        category: ResourceCategory.promotion,
        title: 'Social Media Influencer - 500K Followers',
        description: 'Lifestyle and events influencer with 500K+ followers across Instagram, Twitter, and TikTok. Specializing in event promotion and brand partnerships.',
        photos: <String>[],
        basePrice: 200000,
        isAvailable: true,
        rating: 4.6,
        reviewCount: 34,
        eventsCompleted: 45,
        isVerified: true,
      ),

      // Security resources
      const CohostResourceEntity(
        id: 'security_1',
        cohostId: 'user_6',
        cohostName: 'Elite Security Services',
        category: ResourceCategory.security,
        title: 'Professional Event Security Team',
        description: 'Licensed security personnel with experience in high-profile events. Includes guest screening, crowd control, and emergency response. Team of 5-10 guards.',
        photos: <String>[],
        basePrice: 180000,
        isAvailable: true,
        rating: 4.9,
        reviewCount: 67,
        eventsCompleted: 95,
        isVerified: true,
      ),

      // Catering resources
      const CohostResourceEntity(
        id: 'catering_1',
        cohostId: 'user_7',
        cohostName: "Chef Amaka's Kitchen",
        category: ResourceCategory.catering,
        title: 'Full Service Catering',
        description: 'Professional catering for events of all sizes. Specializing in Nigerian and continental cuisine. Includes setup, service staff, and cleanup.',
        photos: <String>[],
        basePrice: 300000,
        isAvailable: true,
        rating: 4.8,
        reviewCount: 72,
        eventsCompleted: 88,
        isVerified: true,
      ),

      // Media resources
      const CohostResourceEntity(
        id: 'media_1',
        cohostId: 'user_8',
        cohostName: 'Lens & Light Studios',
        category: ResourceCategory.media,
        title: 'Photography & Videography',
        description: 'Professional event coverage with 2 photographers and 1 videographer. Includes drone shots, same-day highlights, and full edited gallery within 2 weeks.',
        photos: <String>[],
        basePrice: 250000,
        isAvailable: true,
        rating: 4.9,
        reviewCount: 91,
        eventsCompleted: 134,
        isVerified: true,
      ),

      // Equipment resources
      const CohostResourceEntity(
        id: 'equipment_1',
        cohostId: 'user_9',
        cohostName: 'SoundWave Rentals',
        category: ResourceCategory.equipment,
        title: 'Professional Sound & Lighting',
        description: 'Premium sound system and stage lighting rental. Includes setup, operation, and breakdown. Perfect for concerts and large events.',
        photos: <String>[],
        basePrice: 120000,
        isAvailable: true,
        rating: 4.7,
        reviewCount: 53,
        eventsCompleted: 67,
        isVerified: true,
      ),

      // Staffing resources
      const CohostResourceEntity(
        id: 'staffing_1',
        cohostId: 'user_10',
        cohostName: 'Premier Event Staff',
        category: ResourceCategory.staffing,
        title: 'Professional Event Coordinators & Servers',
        description: 'Experienced event staff including coordinators, servers, and bartenders. Uniformed, professional, and trained in hospitality.',
        photos: <String>[],
        basePrice: 100000,
        isAvailable: true,
        rating: 4.8,
        reviewCount: 64,
        eventsCompleted: 102,
        isVerified: true,
      ),
    ];

    if (category != null) {
      return allResources.where((CohostResourceEntity resource) => resource.category == category).toList();
    }

    return allResources;
  }
}
