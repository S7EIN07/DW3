import 'package:flutter/material.dart';

void main() {
  runApp(const AmniporaApp());
}

class AmniporaApp extends StatelessWidget {
  const AmniporaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amnipora',
      debugShowCheckedModeBanner: false,
      home: const SinglePage(),
    );
  }
}

class SinglePage extends StatefulWidget {
  const SinglePage({super.key});

  @override
  State<SinglePage> createState() => _SinglePageState();
}

class _SinglePageState extends State<SinglePage> {
  final ScrollController _scrollController = ScrollController();

  final aboutKey = GlobalKey();
  final partnersKey = GlobalKey();
  final objectivesKey = GlobalKey();
  final registerKey = GlobalKey();
  final reviewKey = GlobalKey();

  void scrollTo(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: const Text('Amnipora', style: TextStyle(color: Colors.black)),
        actions: [
          TextButton(
            onPressed: () => scrollTo(registerKey),
            child: const Text(
              'Cadastre-se',
              style: TextStyle(color: Colors.blue),
            ),
          ),
          TextButton(
            onPressed: () => scrollTo(partnersKey),
            child: const Text('Produtos', style: TextStyle(color: Colors.blue)),
          ),
          TextButton(
            onPressed: () => scrollTo(aboutKey),
            child: const Text(
              'Sobre Nós',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Sobre Nós
            Container(
              key: aboutKey,
              padding: const EdgeInsets.all(32),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Somos a Amnipora',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'A Amnipora é uma empresa especializada na gestão de negócios de delivery. '
                          'Oferecemos soluções que otimizam processos, melhoram a operação e aumentam os lucros. '
                          'Nosso objetivo é simplificar a gestão, trazer mais eficiência e ajudar seu delivery a crescer de forma organizada e sustentável.',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: null,
                          child: Text('Saiba Mais'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Container(
                    width: 200,
                    height: 200,
                    color: Colors.blue[900],
                    child: const Center(
                      child: Icon(
                        Icons.phone_android,
                        color: Colors.white,
                        size: 80,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Parcerias
            Container(
              key: partnersKey,
              color: Colors.blue[900],
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Parcerias fechadas com:',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      partnershipCard('Burger King'),
                      partnershipCard('KFC'),
                      partnershipCard('Padaria Exemplo'),
                      partnershipCard('Lalamove'),
                      partnershipCard('McDonald\'s'),
                      partnershipCard('Restaurante X'),
                    ],
                  ),
                ],
              ),
            ),

            // Objetivos
            Container(
              key: objectivesKey,
              padding: const EdgeInsets.all(32),
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Qual o nosso objetivo?',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          '1 - Otimizar a gestão de negócios de delivery\n'
                          'Ajudamos empresas a organizar pedidos, finanças e logística, tornando a gestão mais simples e eficiente.\n',
                        ),
                        Text(
                          '2 - Aumentar a eficiência e os lucros dos clientes\n'
                          'Oferecemos soluções que reduzem custos, otimizam processos e aumentam a produtividade.\n',
                        ),
                        Text(
                          '3 - Oferecer soluções práticas para crescimento sustentável\n'
                          'Ferramentas para que os negócios cresçam de forma estruturada, rentável e duradoura.\n',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Container(
                    width: 250,
                    height: 200,
                    color: Colors.grey[300],
                    child: const Center(child: Icon(Icons.group, size: 80)),
                  ),
                ],
              ),
            ),

            // Cadastro e Login
            Container(
              key: registerKey,
              padding: const EdgeInsets.all(32),
              color: Colors.white,
              child: Column(
                children: [
                  const Text(
                    'Cadastre-se',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      formCard('Cadastrar-se', 3),
                      const SizedBox(width: 32),
                      formCard('Fazer Login', 2),
                    ],
                  ),
                ],
              ),
            ),

            // Avaliações
            Container(
              key: reviewKey,
              padding: const EdgeInsets.all(32),
              color: Colors.blue[900],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Nossas Avaliações',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      reviewCard('“Ótimo serviço”'),
                      reviewCard('“Equipe muito eficiente”'),
                      reviewCard('“Soluções que transformaram meu negócio”'),
                    ],
                  ),
                ],
              ),
            ),

            // Rodapé
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.blue[900],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text('Amnipora', style: TextStyle(color: Colors.white)),
                  Text('Produtos', style: TextStyle(color: Colors.white)),
                  Text('Cadastre-se', style: TextStyle(color: Colors.white)),
                  Text('Sobre Nós', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ----- Widgets Auxiliares -----

  Widget partnershipCard(String name) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Container(
            height: 80,
            color: Colors.grey[300],
            child: const Center(child: Icon(Icons.store, size: 40)),
          ),
          const SizedBox(height: 8),
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
          const Text('Parceria fechada', textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget formCard(String title, int fields) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: 200,
      decoration: BoxDecoration(
        color: Colors.blue[900],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(title, style: const TextStyle(color: Colors.white)),
          const SizedBox(height: 8),
          for (var i = 0; i < fields; i++)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Container(height: 30, color: Colors.white),
            ),
        ],
      ),
    );
  }

  Widget reviewCard(String review) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(review, textAlign: TextAlign.center),
          const SizedBox(height: 8),
          const CircleAvatar(radius: 16),
          const SizedBox(height: 4),
          const Text('Nome', style: TextStyle(fontWeight: FontWeight.bold)),
          const Text('Descrição', style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
