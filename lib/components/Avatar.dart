import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String src;
  final double size;
  const Avatar({Key key, this.src, this.size}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return (CircleAvatar(
        child: ClipRRect(
            child: CircleAvatar(
                child: Image.network(src), radius: size == null ? 28 : size),
            borderRadius: BorderRadius.circular(size == null ? 28 : size)),
        radius: size == null ? 28 : size));
  }
}
