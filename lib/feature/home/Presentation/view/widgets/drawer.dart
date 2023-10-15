import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../../core/Utils/approuter.dart';

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
              child:
                  Text('Menu', style: Theme.of(context).textTheme.displaySmall),
            ),
          ),
          TextButton.icon(
              onPressed: () {
                GoRouter.of(context).push(Approute.kSettingPage);
              },
              icon: const Icon(Icons.settings),
              label: const Text('setting')),
          TextButton.icon(
              onPressed: () async {
                GoogleSignIn googleSignIn = GoogleSignIn();
                googleSignIn.disconnect();
                await FirebaseAuth.instance.signOut();
                GoRouter.of(context).push('/');
              },
              icon: const Icon(Icons.exit_to_app),
              label: const Text('Exit'))
        ],
      ),
    );
  }
}
