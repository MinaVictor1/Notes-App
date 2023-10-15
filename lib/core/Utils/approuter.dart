import 'package:flutterapp/feature/home/Presentation/view/addcategory.dart';
import 'package:flutterapp/feature/home/Presentation/view/editnote.dart';
import 'package:flutterapp/feature/home/Presentation/view/homepage.dart';
import 'package:flutterapp/feature/home/data/models/notemodel.dart';
import 'package:flutterapp/feature/setting/setting.dart';
import 'package:go_router/go_router.dart';
import '../../feature/Auth/Presentation/view/login_page.dart';
import '../../feature/Auth/Presentation/view/register_page.dart';
import '../../feature/home/Presentation/view/noteWidget.dart';

abstract class Approute {
  static const kRegisterPage = '/RegisterPage';
  static const kHomePage = '/HomePage';
  static const kSettingPage = '/Setting';
  static const kAddCategoryPage = '/kAddCategoryPage';
  static const kTitleNote = '/kTitleNote';
  static const kEditNote = '/kEditNote';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: kRegisterPage,
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: kHomePage,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: kSettingPage,
        builder: (context, state) => const Setting(),
      ),
      GoRoute(
        path: kAddCategoryPage,
        builder: (context, state) => const AddCategory(),
      ),
      GoRoute(
        path: kTitleNote,
        builder: (context, state) => NoteWidget(note: state.extra as Note),
      ),
      GoRoute(
        path: kEditNote,
        builder: (context, state) => EditNote(note: state.extra as Note),
      ),
    ],
  );
}
