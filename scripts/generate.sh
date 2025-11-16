#!/bin/bash

# Script to run code generation for the project

echo "🚀 Starting code generation..."
echo ""

# Clean previous builds
echo "🧹 Cleaning previous builds..."
flutter clean
flutter pub get

echo ""
echo "⚙️  Running build_runner..."
flutter pub run build_runner build --delete-conflicting-outputs

echo ""
echo "✅ Code generation complete!"
echo ""
echo "📝 Generated files:"
echo "   - *.freezed.dart (Freezed models)"
echo "   - *.g.dart (JSON serialization & Retrofit)"
echo ""
echo "🎉 Ready to run the app!"
