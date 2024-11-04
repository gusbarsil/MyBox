import 'package:caso_de_estudo/src/screens/boxes_screen.dart';
import 'package:caso_de_estudo/src/screens/login_screen.dart';
import 'package:caso_de_estudo/src/screens/orders_screen.dart';
import 'package:caso_de_estudo/src/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf5f5f5),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFf5f5f5),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Builder(
              builder: (context) {
                return IconButton(
                  icon: Icon(FontAwesomeIcons.barsStaggered),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                );
              },
            ),
            Image.asset(
              'assets/images/logo.png',
              width: 30,
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.circleQuestion),
              onPressed: () {
                showModalBottomSheet(
                  backgroundColor: Colors.black,
                  context: context,
                  builder: (BuildContext context) {
                    return SingleChildScrollView(
                      child: SizedBox(
                        height: 550,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Dúvidas frequentes',
                                      style: GoogleFonts.kaushanScript(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Column(
                                  children: [
                                    Container(
                                      width: 380,
                                      height: 150,
                                      decoration: BoxDecoration(
                                        color: Color(0xffdadada),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Para o que serve o "MyBox"?',
                                                  style: GoogleFonts.kanit(
                                                    color: Colors.black,
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                Text(
                                                  'Com ele você pode rastrear qualquer\nencomenda atribuída ao seu CPF.\nSeja ela internacional, ou nacional.',
                                                  style: GoogleFonts.kanit(
                                                      color: Colors.black54,
                                                      fontSize: 16),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Column(
                                  children: [
                                    Container(
                                      width: 380,
                                      height: 150,
                                      decoration: BoxDecoration(
                                        color: Color(0xffdadada),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Como é feita a busca?',
                                                  style: GoogleFonts.kanit(
                                                    color: Colors.black,
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                Text(
                                                  'A busca é realizada atráves dos meios oficiais\ndo governo. Garantindo segurança e qualidade.',
                                                  style: GoogleFonts.kanit(
                                                      color: Colors.black54,
                                                      fontSize: 16),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Column(
                                  children: [
                                    Container(
                                      width: 380,
                                      height: 150,
                                      decoration: BoxDecoration(
                                        color: Color(0xffdadada),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'O que ocorre com os meus dados?',
                                                  style: GoogleFonts.kanit(
                                                    color: Colors.black,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                Text(
                                                  'Pode ficar de boa! Os seus dados estão\nguardados em criptografia no nosso banco \nde dados, e são usados somente para\nconsultas relacionadas à encomendas.',
                                                  style: GoogleFonts.kanit(
                                                      color: Colors.black54,
                                                      fontSize: 16),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: Color(0xFFf5f5f5),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      width: 150,
                    ),
                    Text(
                      'My\nBox',
                      style: GoogleFonts.oi(fontSize: 30),
                    )
                  ],
                ),
              ),
              Divider(
                color: Colors.black,
                thickness: 2,
                indent: 30,
                endIndent: 30,
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(FontAwesomeIcons.solidUser),
                    SizedBox(width: 30),
                    Text(
                      'Perfil',
                      style: GoogleFonts.kanit(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 25,
                      height: 5,
                      decoration: BoxDecoration(color: Colors.redAccent),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => OrdersScreen()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(FontAwesomeIcons.box),
                    SizedBox(width: 30),
                    Text(
                      'Encomendas',
                      style: GoogleFonts.kanit(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(FontAwesomeIcons.gear),
                  SizedBox(width: 30),
                  Text(
                    'Configurações',
                    style: GoogleFonts.kanit(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Divider(
                color: Colors.grey,
                thickness: 1,
                indent: 30,
                endIndent: 30,
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sobre nós',
                    style: GoogleFonts.kanit(
                        fontSize: 15, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Termos de Uso',
                    style: GoogleFonts.kanit(
                        fontSize: 15, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              SizedBox(height: 150),
              Text(
                'MyBox ©',
                style: GoogleFonts.kanit(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey),
              ),
              SizedBox(height: 20),
              IconButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                icon: Icon(FontAwesomeIcons.arrowRightFromBracket),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                children: [
                  Text(
                    'Quarta-feira',
                    style: GoogleFonts.kaushanScript(fontSize: 30),
                  ),
                  SizedBox(width: 5),
                  Text(
                    '(09)',
                    style: GoogleFonts.kaushanScript(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 350,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sugestão',
                          style: GoogleFonts.kanit(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Acompanhe a sua encomenda\ninternacional ao vivo pelo MyBoxNow!',
                          style: GoogleFonts.kanit(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: Icon(
                          FontAwesomeIcons.angleRight,
                          size: 25,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
              child: Row(
                children: [
                  Text(
                    'Suas encomendas',
                    style: GoogleFonts.kanit(
                        color: Colors.black, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BoxesScreen()));
              },
              child: Column(
                children: [
                  Container(
                    width: 350,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Color(0xffdadada),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '1328XXHUFSI23',
                                style: GoogleFonts.kanit(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Status',
                                style: GoogleFonts.kanit(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Uhull! Saiu para entrega.',
                                style: GoogleFonts.kanit(
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Center(
                              child: Icon(
                                FontAwesomeIcons.truck,
                                size: 20,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Column(
              children: [
                Container(
                  width: 350,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Color(0xffdadada),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'JHSFD8234901F',
                              style: GoogleFonts.kanit(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Status',
                              style: GoogleFonts.kanit(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Vem de longe! Saiu do país de origem.',
                              style: GoogleFonts.kanit(
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: Icon(
                              FontAwesomeIcons.plane,
                              size: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Column(
              children: [
                Container(
                  width: 350,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Color(0xffdadada),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'LKJACIUH8912G',
                              style: GoogleFonts.kanit(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Status',
                              style: GoogleFonts.kanit(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Aí sim! Pedido em separação.',
                              style: GoogleFonts.kanit(
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: Icon(
                              FontAwesomeIcons.boxesStacked,
                              size: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Isso é tudo',
                    style: GoogleFonts.kanit(
                        fontWeight: FontWeight.w300, color: Colors.grey),
                  ),
                  SizedBox(width: 5),
                  Icon(
                    FontAwesomeIcons.faceSmile,
                    color: Colors.grey,
                    size: 15,
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            Divider(
              color: Colors.grey,
              thickness: 2,
              indent: 35,
              endIndent: 35,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'MyBox por aí...',
                  style: GoogleFonts.kanit(
                      fontWeight: FontWeight.w500, color: Colors.grey),
                ),
                SizedBox(width: 10),
                Icon(
                  FontAwesomeIcons.personRunning,
                  color: Colors.grey,
                  size: 15,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(
                    FontAwesomeIcons.facebook,
                    color: Color(0xFF8A8A8A),
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    FontAwesomeIcons.instagram,
                    color: Color(0xFF8A8A8A),
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    FontAwesomeIcons.xTwitter,
                    color: Color(0xFF8A8A8A),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
