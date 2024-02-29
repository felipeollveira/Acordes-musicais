

class Acorde {
  final String nome;
  final List<String> notas;

  Acorde(this.nome, this.notas);
}



List<Acorde> arrayCampoHarmonico() {
  return [
    Acorde('C', ['C','Dm', 'Em', 'F','G','Am','Bo']),
    Acorde('C#', ['C#','D#m', 'E#m', 'F#m','G#','A#m','B#o']),
    Acorde('D', ['D','Em', 'F#m', 'G','A','Bm','C#o']),
    Acorde('Eb', ['Eb','Fm', 'Gm', 'Ab','Bb','Cm','Do']),
    Acorde('E', ['E','F#m', 'G#m', 'A','B','C#m','D#o']),
    Acorde('F', ['F','Gm', 'Am', 'Bb','C','Dm','Eo']),
    Acorde('F#', ['F#','G#m', 'A#m', 'B','C#','D#m','E#o']),
    Acorde('G', ['G','Am', 'Bm', 'C','D','Em','F#o']),
    Acorde('Ab', ['Ab','Bbm', 'Cm', 'Db','Eb','Fm','Go']),
    Acorde('A', ['A','Bm', 'C#m', 'D','E','F#m','G#o']),
    Acorde('Bb', ['Bb','Cm', 'Dm', 'Eb','F','Gm','Ao']),
    Acorde('B', ['B','C#m', 'D#m', 'E','F#','G#m','A#o']),
  ];
}                                                                                                                                                                                                                              
