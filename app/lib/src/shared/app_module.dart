import 'package:flutter_modular/flutter_modular.dart';
import 'package:realm/realm.dart';

import '../configuration/configuration_page.dart';
import '../configuration/services/configuration_service.dart';
import '../configuration/services/configuration_service_impl.dart';
import '../home/home_module.dart';
import 'services/realm/realm_config.dart';
import 'store/app_store.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.instance<Realm>(Realm(config)),
        AutoBind.factory<ConfigurationService>(ConfigurationServiceImpl.new),
        AutoBind.singleton(AppStore.new),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/home', module: HomeModule()),
        ChildRoute(
          '/config',
          child: (context, args) => const ConfigurationPage(),
        ),
      ];
}
