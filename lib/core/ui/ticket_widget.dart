import 'package:flutter/material.dart';

class TicketWidget extends StatefulWidget {
  final double? width;
  final double? height;
  final Widget child;
  final Color color;
  final bool isCornerRounded;

  TicketWidget({
    this.width,
    this.height,
    required this.child,
    this.color = Colors.white,
    this.isCornerRounded = false,
  });

  @override
  _TicketWidgetState createState() => _TicketWidgetState();
}

class _TicketWidgetState extends State<TicketWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TicketClipper(),
      child: AnimatedContainer(
        duration: Duration(seconds: 3),
        width: widget.width,
        height: widget.height,
        child: widget.child,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: widget.isCornerRounded
              ? BorderRadius.circular(20.0)
              : BorderRadius.circular(0.0),
        ),
      ),
    );
  }
}

class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    path.addOval(
        Rect.fromCircle(center: Offset(0.0, size.height / 2), radius: 20.0));
    path.addOval(Rect.fromCircle(
        center: Offset(size.width, size.height / 2), radius: 20.0));

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
