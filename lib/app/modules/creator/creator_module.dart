import 'creator_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'creator_page.dart';

class CreatorModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CreatorController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => CreatorPage()),
      ];

  static Inject get to => Inject<CreatorModule>.of();
}
