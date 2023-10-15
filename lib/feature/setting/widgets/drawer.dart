import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/Utils/approuter.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
            ),
            child: Center(
              child: Text(
                'Menu',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
          ),
          TextButton.icon(
              onPressed: () {
                GoRouter.of(context).push(Approute.kSettingPage);
              },
              icon: const Icon(Icons.settings),
              label: const Text('Setting'))
        ],
      ),
    );
  }
}
