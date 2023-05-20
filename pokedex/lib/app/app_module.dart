import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/modules/details/details_module.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: HomeModule()),
    //ModuleRoute('/home/', module: HomeModule()),
    ModuleRoute('/detail/', module: DetailsModule()),
  ];
}
