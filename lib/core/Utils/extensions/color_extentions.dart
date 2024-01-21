// Import necessary dependency
import 'dart:ui';

// Extension on the Color class to provide additional functionality
extension ColorExtension on Color {
  /// Convert the color to a darken color based on the [percent]
  Color darken([int percent = 40]) {
    // Ensure that the percent value is within a valid range
    assert(1 <= percent && percent <= 100);

    // Calculate the darkened color value
    final value = 1 - percent / 100;

    // Return a new Color with darkened components
    return Color.fromARGB(
      alpha,
      (red * value).round(),
      (green * value).round(),
      (blue * value).round(),
    );
  }

  /// Convert the color to a lighten color based on the [percent]
  Color lighten([int percent = 40]) {
    // Ensure that the percent value is within a valid range
    assert(1 <= percent && percent <= 100);

    // Calculate the lightened color value
    final value = percent / 100;

    // Return a new Color with lightened components
    return Color.fromARGB(
      alpha,
      (red + ((255 - red) * value)).round(),
      (green + ((255 - green) * value)).round(),
      (blue + ((255 - blue) * value)).round(),
    );
  }

  /// Calculate the average color between this color and [other]
  Color avg(Color other) {
    // Calculate the average components between this color and the provided color
    final red = (this.red + other.red) ~/ 2;
    final green = (this.green + other.green) ~/ 2;
    final blue = (this.blue + other.blue) ~/ 2;
    final alpha = (this.alpha + other.alpha) ~/ 2;

    // Return a new Color with averaged components
    return Color.fromARGB(alpha, red, green, blue);
  }
}
