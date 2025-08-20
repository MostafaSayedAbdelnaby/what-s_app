import 'package:flutter/material.dart';
import 'package:whats_app/core/resources/color_manager.dart';

class SendMessage extends StatefulWidget {
  final VoidCallback onSend;
  const SendMessage({super.key, required this.onSend});

  @override
  State<SendMessage> createState() => _SendMessageState();
}

class _SendMessageState extends State<SendMessage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scale;
  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _scale = Tween<double>(begin: 1.0, end: 1.4).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _opacity = Tween<double>(begin: 1.0, end: 0.5).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  void _animateAndSend() {
    // Call the onSend callback immediately to add the message to the list
    widget.onSend();
    // Then, run the animation
    _controller.forward().then((_) {
      _controller.reverse();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scale,
      child: FadeTransition(
        opacity: _opacity,
        child: IconButton(
          icon: Icon(Icons.send, color: ColorManager.textChatDark),
          onPressed: _animateAndSend,
        ),
      ),
    );
  }
}
