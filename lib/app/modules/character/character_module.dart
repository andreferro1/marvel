import 'character_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'character_page.dart';

class CharacterModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CharacterController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => CharacterPage()),
      ];

  static Inject get to => Inject<CharacterModule>.of();
}
