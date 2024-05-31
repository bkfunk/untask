import "package:flutter/material.dart";

class MemosListNavbar extends StatelessWidget {
  const MemosListNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.list), label: "List"),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: "Today",
        ),
      ],
    );
  }
}
