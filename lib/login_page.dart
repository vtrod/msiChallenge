import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:untitled/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

//pagina de login
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  bool _versenha = false;


  ///cria formulario para preenchimento de login e senha
  ///contém verificações de login
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    label: Text('e-mail'),
                    hintText: 'nome@email.com'
                  ),
                  validator: (email) {
                    if (email == null || email.isEmpty) {
                      return 'Digite seu e-mail corporativo';
                    } else if (email != 'admin@admin.com') {
                      return 'E-mail deve ser "admin@admin.com" (somente para teste)';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _senhaController,
                  obscureText: _versenha,
                  decoration: InputDecoration(
                      label: Text('senha'),
                      hintText: 'Digite sua senha',
                      suffixIcon: IconButton(
                        icon :Icon(_versenha ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                        onPressed: (){
                          setState(() {
                            _versenha = !_versenha;
                          });
                        },
                  ),
                  ),
                  validator: (senha) {
                    if (senha == null || senha.isEmpty) {
                      return 'Digite sua senha';
                    } else if (senha != 'admin') {
                      return 'Senha deve ser a de admin (somente para teste)';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 12,
                ),
                ElevatedButton(
                  onPressed: () {
                  if(_formKey.currentState!.validate()){
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => HomePage(),
                       ),
                      );
                    }
                  },
                  child: Text(
                    'Entrar',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }


}
