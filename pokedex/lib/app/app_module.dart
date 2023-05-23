import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/common/repositories/pokemon_repository.dart';
import 'package:pokedex/app/core/data/http/http.dart';
import 'package:pokedex/app/modules/details/details_module.dart';
import 'package:pokedex/app/modules/home/presentation/controllers/home_controller.dart';
import 'package:pokedex/app/modules/splash_screen/splash_screen_module.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton(
      (i) => HomeController(
        PokemonRepositoryImp(
          HttpClientImp(),
        ),
      ),
    )
  ];
  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: SplashScreenModule()),
    ModuleRoute('/home/', module: HomeModule()),
    ModuleRoute('/detail/', module: DetailsModule()),
  ];
}
