import 'package:flutter/material.dart';
import 'main.dart'; // Importamos para acceder a DatosUsuario

class RegistroScreen extends StatelessWidget {
  const RegistroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailCtrl = TextEditingController();
    final TextEditingController passCtrl = TextEditingController();

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0, iconTheme: const IconThemeData(color: Color(0xFF0056A4))),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Sign up', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF0056A4))),
            const Text('Crea una cuenta para empezar', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 30),
            _inputField("Email", controller: emailCtrl),
            const SizedBox(height: 15),
            _inputField("Password", controller: passCtrl, isPassword: true),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFD700), foregroundColor: const Color(0xFF0056A4),
                minimumSize: const Size(double.infinity, 55), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              onPressed: () {
                if (emailCtrl.text.isNotEmpty && passCtrl.text.isNotEmpty) {
                  // GUARDAR EN LA LISTA GLOBAL
                  DatosUsuario.usuariosRegistrados.add({
                    'email': emailCtrl.text,
                    'pass': passCtrl.text,
                  });
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("¡Registro exitoso! Ya puedes iniciar sesión.")));
                  Navigator.pop(context); // Regresa al inicio
                }
              },
              child: const Text('Registrar Cuenta', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputField(String label, {required TextEditingController controller, bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: isPassword,
          decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
        ),
      ],
    );
  }
}