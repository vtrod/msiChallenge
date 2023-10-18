import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_page.dart';
import 'login_page.dart';

//ao abrir aplicativo
class ObraPrimaHomePage extends StatefulWidget {
  const ObraPrimaHomePage({super.key});

  @override
  State<ObraPrimaHomePage> createState() => _ObraPrimaHomePageState();
}

class _ObraPrimaHomePageState extends State<ObraPrimaHomePage> {


//se o usuario esta logado, vai para a index, se não volta para a pagina de login
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    verificaUsuario().then((UserExists) {
      if (UserExists) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
        );
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Obra Prima Page')
      )
    );
  }
//para integrar com formulario em banco de dados posteriormente, pega o token e valida se o usuario existe
  Future<bool> verificaUsuario() async{
    SharedPreferences _sharedpreferences = await SharedPreferences.getInstance();
    String? token = _sharedpreferences.getString('token');
    if(token == null){
      return false;
      }else{
      return true;
    }
  }
}
