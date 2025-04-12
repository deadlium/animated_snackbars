import 'package:flutter/material.dart';
import 'package:animated_snackbars/animated_snackbars.dart';

class SnackbarUtils {
  /// Shows an animated snackbar with customizable properties
  ///
  /// [context] - BuildContext to show the snackbar
  /// [message] - Main message/title of the snackbar
  /// [description] - Description text shown below the message
  /// [color] - Background color of the snackbar (Defaults to error red)
  /// [duration] - How long the snackbar stays visible (Defaults to 2 seconds)
  static void showAnimatedSnackbar({
    required BuildContext context,
    required String message,
    required String description,
    Color color = const Color(0xDDC72C41), // Default red error color
    Duration duration = const Duration(milliseconds: 2000),
  }) {
    // Dismiss any existing snackbars first
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    // Create the animated snackbar with directional animation
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder:
          (context) => _DirectionalSnackbar(
        message: message,
        description: description,
        color: color,
        duration: duration,
      ),
    );

    // Show the animated snackbar
    overlay.insert(overlayEntry);

    // Remove the snackbar after the duration
    Future.delayed(duration).then((_) {
      overlayEntry.remove();
    });
  }

  /// Shows a success animated snackbar with green background
  static void showSuccessSnackbar({
    required BuildContext context,
    required String message,
    required String description,
    Duration duration = const Duration(milliseconds: 2000),
  }) {
    showAnimatedSnackbar(
      context: context,
      message: message,
      description: description,
      color: const Color(0xDD28A745), // Success green color
      duration: duration,
    );
  }

  /// Shows an error animated snackbar with red background
  static void showErrorSnackbar({
    required BuildContext context,
    required String message,
    required String description,
    Duration duration = const Duration(milliseconds: 2000),
  }) {
    showAnimatedSnackbar(
      context: context,
      message: message,
      description: description,
      color: const Color(0xDDC72C41), // Error red color
      duration: duration,
    );
  }

  /// Shows an info animated snackbar with blue background
  static void showInfoSnackbar({
    required BuildContext context,
    required String message,
    required String description,
    Duration duration = const Duration(milliseconds: 2000),
  }) {
    showAnimatedSnackbar(
      context: context,
      message: message,
      description: description,
      color: const Color(0xDD007BFF), // Info blue color
      duration: duration,
    );
  }

  /// Shows a warning animated snackbar with yellow/orange background
  static void showWarningSnackbar({
    required BuildContext context,
    required String message,
    required String description,
    Duration duration = const Duration(milliseconds: 2000),
  }) {
    showAnimatedSnackbar(
      context: context,
      message: message,
      description: description,
      color: const Color(0xDDFFC107), // Warning yellow color
      duration: duration,
    );
  }
}

/// Custom widget that handles the directional animation of the snackbar
class _DirectionalSnackbar extends StatefulWidget {
  final String message;
  final String description;
  final Color color;
  final Duration duration;

  const _DirectionalSnackbar({
    required this.message,
    required this.description,
    required this.color,
    required this.duration,
  });

  @override
  _DirectionalSnackbarState createState() => _DirectionalSnackbarState();
}

class _DirectionalSnackbarState extends State<_DirectionalSnackbar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    // Create animation controller
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    // Create animations
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1), // Start from below the screen
      end: Offset.zero, // End at the target position
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6, curve: Curves.easeIn),
      ),
    );

    // Start entry animation
    _controller.forward();

    // Schedule exit animation
    Future.delayed(widget.duration - const Duration(milliseconds: 500)).then((
        _,
        ) {
      if (mounted) {
        // Change slide animation for exit
        _slideAnimation = Tween<Offset>(
          begin: Offset.zero, // Start from current position
          end: const Offset(0, -1), // Exit towards the top
        ).animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeInCubic),
        );

        _opacityAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.4, 1.0, curve: Curves.easeOut),
          ),
        );

        _controller.forward(from: 0.0);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final safeBottomPadding = MediaQuery.of(context).padding.bottom;
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    // Calculate bottom position - appear above keyboard when it's visible
    final bottomPosition =
    keyboardHeight > 0
        ? keyboardHeight +
        8.0 // Position just above keyboard with small margin
        : safeBottomPadding +
        20.0; // Default position when keyboard is hidden

    return Positioned(
      bottom: bottomPosition,
      left: 16,
      right: 16,
      child: SlideTransition(
        position: _slideAnimation,
        child: FadeTransition(
          opacity: _opacityAnimation,
          child: Material(
            color: Colors.transparent,
            elevation: 0,
            child: SnackBarWidget(
              message: widget.message,
              description: widget.description,
              color: widget.color,
            ),
          ),
        ),
      ),
    );
  }
}
