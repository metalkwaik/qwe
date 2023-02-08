import 'package:flutter/material.dart';

import 'home_body.dart';
import 'home_header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        HomeHeader(),
        HomeBody(),
      ],
    );
  }
}
