import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/Utils/approuter.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () {
          GoRouter.of(context).push(Approute.kAddCategoryPage);
        },
        child: const Icon(Icons.add));
  }
}
