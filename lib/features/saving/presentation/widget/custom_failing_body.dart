import 'package:flutter/material.dart';

class CustomFailingBody extends StatelessWidget {
  const CustomFailingBody({super.key, required this.error});
  final String error;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(error),
    );
  }
}
