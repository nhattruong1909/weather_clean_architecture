import 'package:flutter/cupertino.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, this.error});
  final String? error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        error ?? '',
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}
