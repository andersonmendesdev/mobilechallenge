import 'package:flutter/material.dart';
import '../pages/home/home_page.dart';
import '../pages/modal/modal_error.dart';
import '../pages/splash/splash_page.dart';
import 'app_routes.dart';
import 'pagebuilder/page_builder.dart' as pagebuider;

Route generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.modalError:
      return pagebuider.pageRouteBuilder(
          page: ModalPopupError(settings),
          barrierColor: Colors.black54,
          settings: settings,
          barrierDismissible: true);
    default:
      return pagebuider.materialBuilder(widget: const ErrorPage(), settings: settings);
  }
}

Map<String, WidgetBuilder> getRoutes() {
  return <String, WidgetBuilder>{
    AppRoutes.splash: (context) => const SplashPage(),
    AppRoutes.home: (context) => const HomePage(),
  };
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Error'),
      ),
      body: const Center(
        child: Text('Page notFound'),
      ),
    );
  }
}
