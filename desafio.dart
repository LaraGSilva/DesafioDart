void main() {
  final List<String> pacientes = [
    'Rodrigo Rahma|35|Desenvolvedor|SP',
    'Manoel Silva|12|Estudante|AL',
    'Joaquim Rahma|18|Estudante|SP',
    'Fernando Verne|35|Estudante|PE',
    'Gustavo Silva|40|Desenvolvedor|CE',
    'Sandra Silva|40|Desenvolvedor|MG',
    'Regina Verne|36|Dentista|MG',
    'Joao Rahma|55|Jornalista|RJ',
  ];

  // Cria lista de informações dos pacientes
  List<Map<String, dynamic>> pacientesInfos = pacientes.map((paciente) {
    List<String> dados = paciente.split('|');
    return {
      'nome': dados[0],
      'idade': int.tryParse(dados[1]) ?? 0,
      'profissao': dados[2],
      'estado': dados[3],
    };
  }).toList();

  // 2. Quantidade total de pacientes
  print('Quantidade total de pacientes: ${pacientesInfos.length}');

  // 3. Pacientes com mais de 20 anos
  List<Map<String, dynamic>> pacientesMaisDe20Anos = pacientesInfos
      .where((paciente) => paciente['idade'] > 20)
      .toList();
  print('Pacientes com mais de 20 anos:');
  pacientesMaisDe20Anos.forEach((paciente) => print(paciente['nome']));

  // 4. Quantidade de pacientes por profissão
  Map<String, int> pacientesPorProfissao = {};
  for (var paciente in pacientesInfos) {
    String profissao = paciente['profissao'];
    pacientesPorProfissao[profissao] = pacientesPorProfissao.putIfAbsent(profissao, () => 0) + 1;
  }
  print('Quantidade de pacientes por profissão:');
  pacientesPorProfissao.forEach((profissao, quantidade) => print('$profissao: $quantidade'));

  // 5. Pacientes que moram em SP
  int pacientesEmSP = pacientesInfos.where((paciente) => paciente['estado'] == 'SP').length;
  print('Quantidade de pacientes que moram em SP: $pacientesEmSP');
}
