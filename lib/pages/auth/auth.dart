import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/auth/controller/auth_controller.dart';
import 'package:provider/provider.dart';

import '../../widgets/my_text_field/my_text_field.dart';

const titles = <String>['name' ,'adress', 'phone', 'ph'];
const icons = <IconData>[Icons.home, Icons.phone];

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = context.read<AuthController>();
    final textEdi = controller.textEdi(titles);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            const _TitleAuth(),
            Column(
              children: List.generate(
                titles.length,
                (index) => MyTextField(
                  controller: textEdi[index],
                  icon: icons.length > titles.length ? icons[index] : null,
                  hintText: titles[index],
                ),
              ),
            ),
            Center(
              child: InkWell(
                onTap: () =>
                   controller.showMainPage(textEdi , context),

                child: const Text('data'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TitleAuth extends StatelessWidget {
  const _TitleAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('data'),
      ],
    );
  }
}
