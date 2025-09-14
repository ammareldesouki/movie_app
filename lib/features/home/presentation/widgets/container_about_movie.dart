import 'package:flutter/material.dart';

class ContainerAboutMovie extends StatelessWidget {
  final String title;
  final IconData icon;

  const ContainerAboutMovie({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Color(0xff282A28),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Icon(icon, color: Colors.amber, size: 24),
              SizedBox(width: 8),
              Text(
                title ?? "-",
                style: Theme.of(
                  context,
                ).textTheme.titleLarge!.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
