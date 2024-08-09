import 'package:bitirmeprojesi/forgot_pw_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bitirmeprojesi/register_page.dart';

class LoginPage extends StatefulWidget{
  final VoidCallback showRegisterPage;
  const LoginPage ({Key? key, required this.showRegisterPage}): super (key: key);

  @override
  State<LoginPage>createState()=>_LoginPageState();
}
class _LoginPageState extends State<LoginPage>{

  //CONTROLLER
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
    );
}

@override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment:  MainAxisAlignment.center,
              children: [
                const SizedBox(height: 25),
                const Icon(
                    Icons.sports_soccer,
                          size: 100,
                ),
                //HOŞGELDİNİZ YAZISI
              const Text(
                "Yedinci OL!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
                ),
               const SizedBox(height: 10),
                const Text(
                "Uygulamamıza Hoşgeldiniz",
                 style: TextStyle(
                   fontSize: 30,
                     ),
                ),
                const SizedBox(height: 40),
                //E-MAİL GİRİŞİ
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      hintText: "E-Mailiniz",
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
              ),
                const SizedBox(height: 20),
                //ŞİFRE GİRİŞİ
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: "Şifreniz",
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),

                const SizedBox(height: 5),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                          context,
                          MaterialPageRoute(
                          builder: (context) {
                            return const ForgotPasswordPage ();
                              },
                            ),
                          );
                        },
                        child: const Text(
                          "Şifrenizi mi Unuttunuz?",
                            style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                           ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),
                //GİRİŞ BUTONU
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: GestureDetector(
                      onTap: signIn,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text(
                          "Giriş Yapınız",
                              style: TextStyle(
                              color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                          ),
                        ),
                      ),
                    )
                ),
                const SizedBox(height: 15),
                //ÜYE OLMA BUTONU
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Üye Değil misiniz?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                )
                    ),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return RegisterPage(showLoginPage: () {  },);
                            },
                          ),
                        );
                      },
                      child: const Text(
                        "Hemen Üye Olun!",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],),
          ) ,
    ),
    ),
    );
  }
}