import 'package:flutter/material.dart';

class OnTabRating extends StatefulWidget {
  const OnTabRating({Key? key}) : super(key: key);

  @override
  _OnTabRatingState createState() => _OnTabRatingState();
}

class _OnTabRatingState extends State<OnTabRating> {
  bool _active = false;

  void _handelTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handelTap,
      child: Icon(Icons.star, color: _active ? Colors.red : Colors.grey),
    );
  }
}

class RatingStar extends StatelessWidget {
  const RatingStar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: const <Widget>[
        OnTabRating(),
        OnTabRating(),
        OnTabRating(),
        OnTabRating(),
        OnTabRating(),
      ],
    );
  }
}
