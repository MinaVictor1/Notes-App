import 'package:flutter/material.dart';
import 'package:flutterapp/feature/home/Presentation/view/widgets/addcategorybody.dart';

class AddCategory extends StatelessWidget {
  const AddCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Category'),
        ),
        body: const AddCategoryBody(),
      ),
    );
  }
}
