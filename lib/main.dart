import 'dart:ui';
import 'package:flutter/material.dart';

class Cardapio {
  final String images;
  final String name;
  final String description;
  final double price;

  Cardapio(
      {required this.images,
      required this.name,
      required this.description,
      required this.price});
}

class TelaCardapio extends StatelessWidget {
  final List<Cardapio> menuItems = [
    Cardapio(
      images: 'assets/cap.jpg',
      name: 'Capitão Burguer',
      description:
          'Lute contra a fome como se ela tivesse as 6 jóias do infinito. [Diversas Opções] (Hamburguer artesanal 120g)',
      price: 19.99,
    ),
    Cardapio(
      images: 'assets/pok2.jpg',
      name: 'Poke fome',
      description:
          'Po, que fome. entendeu? a piada? nao zera a nota. [Diversas Opções] (Metade frango/catupiry, Metade calabresa.)',
      price: 34.99,
    ),
    Cardapio(
      images: 'assets/pac.jpg',
      name: 'Cookie-Man',
      description:
          'Ele vai comê-los antes de você. [Diversas Opções] (Cookies de chocolate.)',
      price: 29.99,
    ),
    Cardapio(
      images: 'assets/stars.jpg',
      name: 'Star Faminto',
      description:
          'Que a Fome esteja com você, Padawan. [Diversas Opções] (Bolachas recheadas, sabores diversos.)',
      price: 24.99,
    ),
    Cardapio(
      images: 'assets/bat.jpg',
      name: 'BatRango',
      description:
          'Você tem preparo pra comer isso? [Diversas Opções] (Batata rústica + molho barbecue com corante.)',
      price: 22.99,
    ),
    Cardapio(
      images: 'assets/mine.jpg',
      name: 'Bomb Cake',
      description:
          'Uma explosão de sabores! [Diversas Opções] (Bolo de chocolate e limão, e pitadas de menta.)',
      price: 29.99,
    ),
  ];

  TelaCardapio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 250,
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        elevation: 30,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(30),
          child: Container(
            alignment: Alignment.bottomCenter,
            child: const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Text(
                      'Geek Edition',
                      style: TextStyle(
                        fontSize: 23,
                        fontFamily: 'Oswald',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Para todos os gostos! Saboreie o melhor do seu personagem.',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Oswald',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 0),
                    Text(
                      'Faça o seu pedido agora mesmo.',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Oswald',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        flexibleSpace: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/trooper.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color:
                    const Color.fromARGB(255, 187, 185, 185).withOpacity(0.3),
              ),
            ),
            ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                child: Container(
                  color: const Color.fromARGB(0, 19, 18, 18),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: const Center(
                      child: Text(
                        'Mobile Burger',
                        style: TextStyle(
                          fontSize: 70,
                          fontFamily: 'Caveat',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/geek.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
              child: Container(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
          ),
          Container(
            color: Colors.transparent,
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 15),
              itemCount: menuItems.length,
              itemBuilder: (BuildContext context, int index) {
                Cardapio menuItem = menuItems[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  color: const Color.fromARGB(52, 0, 0, 0),
                  elevation: 0,
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        menuItem.images,
                        fit: BoxFit.cover,
                        width: 80,
                        height: 80,
                      ),
                    ),
                    title: Text(
                      menuItem.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Oswald',
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          menuItem.description,
                          style: const TextStyle(
                            fontSize: 14,
                            fontFamily: 'Oswald',
                          ),
                        ),
                        Text(
                          'Preço: R\$${menuItem.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Oswald',
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: TelaCardapio(),
  ));
}
