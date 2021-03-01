import 'comic_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'comic_page.dart';

class ComicModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ComicController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => ComicPage()),
      ];

  static Inject get to => Inject<ComicModule>.of();
}
