import 'package:mobx/mobx.dart';

// Include generated file
part 'auth.g.dart';

// This is the class used by rest of your codebase
// ignore: library_private_types_in_public_api
class Auth = _Auth with _$Auth;

// The store-class
abstract class _Auth with Store {
  @observable
  String value = 'Default';

  @observable
  String descriptionPackMock =
      'isso não é um jogo é uma ferramenta (infalível) para gerar conexões (profundas e descontraídas) com amigos, família, dates, somos feitos para todos. através de perguntas, divididas em 4 níveis você vai aumentando a conexão na medida que avança de nível. você irá descobrir o que não tinha idéia sobre quem você acabou de conhecer ou quem vive ao seu lado e até sobre você mesmo. 1-10 jogadores 112 perguntas 2 cartas finais';

  @observable
  bool isAuthenticated = false;

  @action
  void setIsAuthenticated() {
    isAuthenticated = true;
  }
}
