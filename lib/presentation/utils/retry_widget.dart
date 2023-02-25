import 'package:flutter/material.dart';

class RetryWidget extends StatelessWidget {
  final Function()? onPressed;

  const RetryWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        style: const ButtonStyle(
          iconColor: MaterialStatePropertyAll<Color>(Colors.white),
          backgroundColor: MaterialStatePropertyAll<Color>(Colors.green),
          padding: MaterialStatePropertyAll<EdgeInsets>(
            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              'Retry',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            SizedBox(
              width: 2,
            ),
            Icon(Icons.refresh),
          ],
        ),
      ),
    );
  }
}
