/// Consistent spacing system based on 4px grid
/// Provides standardized spacing tokens for layouts
class AppSpacing {
  AppSpacing._();

  // Base unit (4px)
  static const double _baseUnit = 4;

  // Spacing scale
  static const double none = 0;
  static const double xs = _baseUnit;          // 4px
  static const double sm = _baseUnit * 2;     // 8px
  static const double md = _baseUnit * 3;     // 12px
  static const double lg = _baseUnit * 4;     // 16px
  static const double xl = _baseUnit * 5;     // 20px
  static const double xxl = _baseUnit * 6;    // 24px
  static const double xxxl = _baseUnit * 8;   // 32px
  static const double huge = _baseUnit * 10;  // 40px
  static const double massive = _baseUnit * 12; // 48px

  // Semantic spacing
  static const double elementSpacing = sm;     // 8px - between related elements
  static const double sectionSpacing = lg;    // 16px - between sections
  static const double pageSpacing = xl;       // 20px - page margins
  static const double cardPadding = lg;       // 16px - card internal padding
  static const double listItemSpacing = md;   // 12px - between list items
  static const double buttonSpacing = md;     // 12px - between buttons
  static const double iconSpacing = sm;       // 8px - icon to text spacing

  // Layout spacing
  static const double screenPadding = lg;     // 16px - screen edge padding
  static const double contentPadding = xl;    // 20px - main content padding
  static const double modalPadding = xxl;     // 24px - modal/dialog padding
  static const double bottomSheetPadding = xxl; // 24px - bottom sheet padding

  // Component spacing
  static const double inputPadding = lg;      // 16px - input field padding
  static const double chipSpacing = sm;       // 8px - between chips
  static const double tabSpacing = md;        // 12px - tab padding
  static const double appBarPadding = lg;     // 16px - app bar padding

  // Grid spacing
  static const double gridGutter = lg;        // 16px - grid gutter
  static const double columnSpacing = lg;     // 16px - between columns
  static const double rowSpacing = md;        // 12px - between rows

  /// Get responsive spacing based on screen size
  static double getResponsiveSpacing(double baseSpacing, double screenWidth) {
    // Mobile: base spacing
    if (screenWidth < 600) {
      return baseSpacing;
    }
    
    // Tablet: 25% larger
    if (screenWidth < 1200) {
      return baseSpacing * 1.25;
    }
    
    // Desktop: 50% larger
    return baseSpacing * 1.5;
  }

  /// Get all spacing values as a map for debugging/documentation
  static Map<String, double> get allSpacing => <String, double>{
        'none': none,
        'xs': xs,
        'sm': sm,
        'md': md,
        'lg': lg,
        'xl': xl,
        'xxl': xxl,
        'xxxl': xxxl,
        'huge': huge,
        'massive': massive,
      };
}