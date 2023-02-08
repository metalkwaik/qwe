import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/profile/controller/profile_controller.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: const [
            _ProfileHeader(),
            _ProfileBody(),
          ],
        ),
      ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader();
  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundColor: Colors.teal,
      radius: 60,
    );
  }
}

class _ProfileBody extends StatelessWidget {
  const _ProfileBody();
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ProfileController>();
    return Column(
      children: List.generate(
        controller.data?.length ?? 0,
        (index) => Text(controller.data?[index] ?? ''),
      ),
    );
  }
}
