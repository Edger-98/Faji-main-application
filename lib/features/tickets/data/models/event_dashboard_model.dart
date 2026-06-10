/// Event Dashboard Model - matches GET /events/:eventId/dashboard
class EventDashboardModel {
  EventDashboardModel({
    required this.event,
    required this.ticketing,
    required this.guests,
    required this.verification,
    required this.recentActivity,
  });

  factory EventDashboardModel.fromJson(Map<String, dynamic> json) {
    final data = (json['data'] ?? json) as Map<String, dynamic>;
    return EventDashboardModel(
      event: DashboardEventInfo.fromJson(data['event'] as Map<String, dynamic>? ?? {}),
      ticketing: DashboardTicketing.fromJson(data['ticketing'] as Map<String, dynamic>? ?? {}),
      guests: DashboardGuests.fromJson(data['guests'] as Map<String, dynamic>? ?? {}),
      verification: DashboardVerification.fromJson(data['verification'] as Map<String, dynamic>? ?? {}),
      recentActivity: (data['recentActivity'] as List<dynamic>?)
              ?.map((e) => DashboardActivity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  final DashboardEventInfo event;
  final DashboardTicketing ticketing;
  final DashboardGuests guests;
  final DashboardVerification verification;
  final List<DashboardActivity> recentActivity;
}

class DashboardEventInfo {
  DashboardEventInfo({
    required this.id,
    required this.name,
    required this.status,
    required this.startDate,
    required this.endDate,
    this.imageUrl,
  });

  factory DashboardEventInfo.fromJson(Map<String, dynamic> json) => DashboardEventInfo(
        id: json['id'] as String? ?? '',
        name: json['name'] as String? ?? '',
        status: json['status'] as String? ?? '',
        startDate: json['startDate'] as String? ?? '',
        endDate: json['endDate'] as String? ?? '',
        imageUrl: json['imageUrl'] as String?,
      );

  final String id;
  final String name;
  final String status;
  final String startDate;
  final String endDate;
  final String? imageUrl;
}

class DashboardTicketing {
  DashboardTicketing({
    required this.totalTickets,
    required this.soldTickets,
    required this.availableTickets,
    required this.revenue,
    required this.platformFee,
    required this.netRevenue,
    required this.currency,
  });

  factory DashboardTicketing.fromJson(Map<String, dynamic> json) => DashboardTicketing(
        totalTickets: json['totalTickets'] as int? ?? 0,
        soldTickets: json['soldTickets'] as int? ?? 0,
        availableTickets: json['availableTickets'] as int? ?? 0,
        revenue: (json['revenue'] as num?)?.toDouble() ?? 0.0,
        platformFee: (json['platformFee'] as num?)?.toDouble() ?? 0.0,
        netRevenue: (json['netRevenue'] as num?)?.toDouble() ?? 0.0,
        currency: json['currency'] as String? ?? 'USD',
      );

  final int totalTickets;
  final int soldTickets;
  final int availableTickets;
  final double revenue;
  final double platformFee;
  final double netRevenue;
  final String currency;
}

class DashboardGuests {
  DashboardGuests({
    required this.expected,
    required this.confirmed,
    required this.checkedIn,
    required this.checkInRate,
  });

  factory DashboardGuests.fromJson(Map<String, dynamic> json) => DashboardGuests(
        expected: json['expected'] as int? ?? 0,
        confirmed: json['confirmed'] as int? ?? 0,
        checkedIn: json['checkedIn'] as int? ?? 0,
        checkInRate: (json['checkInRate'] as num?)?.toDouble() ?? 0.0,
      );

  final int expected;
  final int confirmed;
  final int checkedIn;
  final double checkInRate;
}

class DashboardVerification {
  DashboardVerification({
    required this.isVerified,
    required this.checkInPercentage,
    required this.paymentsReleased,
    this.verifiedAt,
  });

  factory DashboardVerification.fromJson(Map<String, dynamic> json) => DashboardVerification(
        isVerified: json['isVerified'] as bool? ?? false,
        checkInPercentage: (json['checkInPercentage'] as num?)?.toDouble() ?? 0.0,
        paymentsReleased: json['paymentsReleased'] as bool? ?? false,
        verifiedAt: json['verifiedAt'] as String?,
      );

  final bool isVerified;
  final double checkInPercentage;
  final bool paymentsReleased;
  final String? verifiedAt;
}

class DashboardActivity {
  DashboardActivity({
    required this.type,
    required this.description,
    required this.timestamp,
  });

  factory DashboardActivity.fromJson(Map<String, dynamic> json) => DashboardActivity(
        type: json['type'] as String? ?? '',
        description: json['description'] as String? ?? '',
        timestamp: json['timestamp'] as String? ?? '',
      );

  final String type;
  final String description;
  final String timestamp;
}
