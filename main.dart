import 'package:flutter/material.dart';

void main() {
  runApp(AgroScanApp());
}

class AgroScanApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AgroScan IA',
      home: ChatScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<String> messages = [];
  final TextEditingController controller = TextEditingController();
  int step = 0;

  final List<String> questions = [
    "Olá! Bem-vindo ao AgroScan IA. Qual o tamanho total da sua área de cultivo?",
    "Qual a variedade de uva cultivada?",
    "Qual o tamanho da área monitorada por cada válvula?",
    "Qual o nome da praga ou doença observada?",
    "Em quais partes da planta a praga ou doença foi encontrada?",
    "Qual o status da infestação (baixo, médio, alto)?",
    "Quais observações adicionais você tem sobre a cultura?",
    "Em qual fase fisiológica a planta se encontra?",
    "Em qual etapa do ciclo da uva estamos?",
    "Obrigado! Calculando o índice e gerando o relatório...",
    "Relatório pronto. Com base na análise, recomendo: Produto X, dose 2mL/L, pH ideal 6.5. Deseja salvar esse relatório?"
  ];

  void sendMessage(String text) {
    setState(() {
      messages.add("Você: $text");
      if (step < questions.length - 1) {
        step++;
        messages.add("IA: ${questions[step]}");
      }
    });
    controller.clear();
  }

  @override
  void initState() {
    super.initState();
    messages.add("IA: ${questions[step]}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AgroScan IA')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: messages.length,
              itemBuilder: (context, index) => Text(messages[index]),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(labelText: 'Digite sua resposta...'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () => sendMessage(controller.text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
