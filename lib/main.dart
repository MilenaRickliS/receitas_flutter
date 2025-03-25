import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 8, 8, 7),
        scaffoldBackgroundColor: Color.fromARGB(255, 0, 0, 0),
        fontFamily: 'Raleway',
      ),
      home: MenuReceitas(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MenuReceitas extends StatelessWidget {
  const MenuReceitas({super.key});

  static const List<Map<String, String>> receitas = [
    {
      'nome': 'Guacamole',
      'descricao': 'Essa pasta mexicana funciona perfeitamente como entrada em almoços e jantares, como petisco se servida junto com nachos ou torradinhas, ou até mesmo em sanduíches para dar mais cremosidade.',
      'imagem': 'assets/guacamole.jpg',
      'detalhes': 'Ingredientes: Abacate, cebola, tomate, limão, sal.\n\nModo de preparo: Amasse o abacate, misture os outros ingredientes e sirva.'
    },
    {
      'nome': 'Ceviche tradicional',
      'descricao': 'O ceviche é uma receita deliciosa e superfácil de ser feita. Originalmente um prato peruano, ele vem da tradição dos pescadores de pescar, cortar, temperar e comer os peixes dentro do próprio barco.',
      'imagem': 'assets/Ceviche.jpeg',
      'detalhes': 'Ingredientes: Peixe fresco, limão, cebola roxa, coentro, pimenta.\n\nModo de preparo: Corte o peixe, tempere com limão e misture os outros ingredientes.'
    },
    {
      'nome': 'Arroz à grega',
      'descricao': 'Arroz à grega é um prato brasileiro que consiste em arroz cozido com passas e legumes picados. Os legumes mais utilizados na preparação do prato são cenoura, ervilhas, milho e cebolinha.',
      'imagem': 'assets/arroz.jpg',
      'detalhes': 'Ingredientes: Arroz, passas, cenoura, ervilhas, milho.\n\nModo de preparo: Cozinhe o arroz e misture os outros ingredientes.'
    },
    {
      'nome': 'Torta de frango',
      'descricao': 'Se você busca praticidade, essa é a receita ideal! Aprenda agora mesmo a fazer essa torta de frango simples e fácil!',
      'imagem': 'assets/tortafrango.jpg',
      'detalhes': 'Ingredientes: Frango, massa, temperos.\n\nModo de preparo: Cozinhe o frango, prepare a massa e asse.'
    },
    {
      'nome': 'Dadinho de tapioca',
      'descricao': 'Um petisco delicioso de boteco que fica perfeito com uma geleia de pimenta: aprenda como fazer dadinho de tapioca!',
      'imagem': 'assets/dadinho.jpg',
      'detalhes': 'Ingredientes: Tapioca, queijo coalho, temperos.\n\nModo de preparo: Misture os ingredientes, molde e frite.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Receitas',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 228, 224, 193),
        centerTitle: true,
      
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(20.0),
        itemCount: receitas.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 8.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: AssetImage(receitas[index]['imagem']!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 20),
                      Text(
                        receitas[index]['nome']!,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        receitas[index]['descricao']!,
                        textAlign: TextAlign.left,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetalhesReceita(
                                receita: receitas[index],
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 72, 41, 30),
                          padding: EdgeInsets.symmetric( horizontal: 20, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text(
                          'Ver Receita',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class DetalhesReceita extends StatelessWidget {
  final Map<String, String> receita;

  const DetalhesReceita({super.key, required this.receita});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receita['nome']!,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
        ),
        
        backgroundColor: Color.fromARGB(255, 252, 248, 215),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 700,
                height: 550,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: AssetImage(receita['imagem']!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Ingredientes:',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(receita['detalhes']!,
              style: TextStyle(fontSize: 17),),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 72, 41, 30),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Voltar',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),        
      ),
    );
  }
}