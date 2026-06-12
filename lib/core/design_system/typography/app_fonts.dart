/// Font family registry.
///
/// To switch the app font, change [primary] to any registered family name.
/// The family must be declared in pubspec.yaml under flutter > fonts.
class AppFonts {
  AppFonts._();

  // ── Available families ──────────────────────────────────────────────────────
  static const String sfProDisplay = 'SF Pro Display';
  static const String modicaPro = 'Modica Pro';

  // ── Active font ─────────────────────────────────────────────────────────────
  // Change this one line to swap the entire app font.
  static const String primary = sfProDisplay;
}
