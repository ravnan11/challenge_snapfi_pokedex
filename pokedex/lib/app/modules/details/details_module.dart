import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/controllers/details_controller.dart';
import 'presentation/page/details_page.dart';

class DetailsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => DetailsController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => DetailsPage(
        pokemon: args.data['pokemon'],
        controllerHome: args.data['controller'],
      ),
    ),
  ];
}
