import 'dart:io';
import 'package:collection/collection.dart';
import 'acordes/acordes.dart';

void campoHarmonico(String acorde) {
  List<Acorde> campoHarmonico = arrayCampoHarmonico();

  // Procura o acorde informado
  Acorde? grauI = campoHarmonico.firstWhere((ac) => ac.nome == acorde);

  if (grauI != null) {
  print('${grauI.notas}');

  print('\nMonte seus acordes:');
  String? escolhaAcordes = stdin.readLineSync();
  List<String> acordesEscolhidos = escolhaAcordes?.trim().split(' ') ?? [];

  // Verifica se todos os acordes escolhidos estão na lista de notas do acorde no grau I
  if (grauI != null && acordesEscolhidos.every((acorde) => grauI.notas.contains(acorde))) {
    outrosAcordes(acordesEscolhidos, grauI, campoHarmonico);
  } else {
    print('A escolha contém notas que não estão no acorde $acorde no grau I.');
  }
} else {
  print('O acorde $acorde não foi encontrado.');
}
}


void outrosAcordes(List<String> acordesEscolhidos, Acorde grauI, List<Acorde> campoHarmonico) {
  // Lista para armazenar os índices de cada acorde escolhido em relação ao grau I
  List<int> indices = [];

  // Encontra o índice de cada acorde escolhido
  for (var acorde in acordesEscolhidos) {
    int indice = grauI.notas.indexWhere((nota) => nota == acorde);
    if (indice != -1) {
      indices.add(indice);
    }
  }
  // Imprime os acordes presentes em cada Acorde da lista campoHarmonico nos índices especificados
  print('\nEm outros acordes:');

  for (var i = 0; i < campoHarmonico.length; i++) {
    var acordeAtual = campoHarmonico[i];
    List<String> outrosAcordes = [];
  
    for (var j = 0; j < indices.length; j++) {
      var indice = indices[j];
      if (indice != -1 && indice < acordeAtual.notas.length) {
        var nomeAcorde = acordeAtual.notas[indice];
        outrosAcordes.add(nomeAcorde);
      }
    }

    // Verifica se a lista de outros acordes é diferente da lista de acordes escolhidos
    if (!IterableEquality().equals(outrosAcordes, acordesEscolhidos)) {
      if(acordesEscolhidos.length > 20) print('\n');
      print('${acordeAtual.nome}: $outrosAcordes');
    }
  }
  print('\n');
}

void acordes() {
  print('Digite o primeiro acorde:');
  String? acorde = stdin.readLineSync();

  if (acorde != null) {
    campoHarmonico(acorde);
  } else {
    print('A entrada está vazia.');
  }
}

