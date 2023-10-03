import 'package:mobx/mobx.dart';

// Include generated file
part 'details.g.dart';

// This is the class used by rest of your codebase
// ignore: library_private_types_in_public_api
class Details = _Details with _$Details;

// The store-class
abstract class _Details with Store {
  @observable
  String value = 'Default';
  String descriptionPackMock =
      'isso não é um jogo é uma ferramenta (infalível) para gerar conexões (profundas e descontraídas) com amigos, família, dates, somos feitos para todos. através de perguntas, divididas em 4 níveis você vai aumentando a conexão na medida que avança de nível. você irá descobrir o que não tinha idéia sobre quem você acabou de conhecer ou quem vive ao seu lado e até sobre você mesmo. 1-10 jogadores 112 perguntas 2 cartas finais';

  @action
  void selectPack(String pack) {
    value = pack;
  }
}
