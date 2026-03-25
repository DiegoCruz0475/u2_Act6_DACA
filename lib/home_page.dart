import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Color azul oscuro de la barra superior en image_2.png
    const Color dcpBlue = Color(0xFF0046A7); 
    // Color azul de los botones en image_2.png (un poco más claro que la barra)
    const Color buttonBlue = Color(0xFF0056D2);

    return Scaffold(
      backgroundColor: Colors.white, // Fondo blanco como en la imagen
      appBar: AppBar(
        backgroundColor: dcpBlue,
        elevation: 0,
        automaticallyImplyLeading: false, // Quita la flecha de "atrás"
        title: const Text(
          'DCP Inmobiliaria',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        actions: [
          // Icono de perfil circular gris
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: CircleAvatar(
              backgroundColor: Colors.grey[300],
              child: Icon(Icons.person, color: Colors.grey[600]),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Lista de botones azules
            _buildMenuButton('Vendedores', buttonBlue),
            _buildMenuButton('Casas - Venta', buttonBlue),
            _buildMenuButton('Casas - Renta', buttonBlue),
            _buildMenuButton('Contacto', buttonBlue),
            _buildMenuButton('Agendar Cita', buttonBlue),
            
            const SizedBox(height: 30),
            
            // Imagen de las casas (Placeholder o imagen real)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10), // Bordes redondeados para la imagen
                child: Image.network(
                  'https://raw.githubusercontent.com/DiegoCruz0475/Casas_Imagenes_GIJUUUU/refs/heads/main/Imagenes_Gijuuuu/casa1.jpg', // Imagen de ejemplo de casas modernas
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 200,
                    color: Colors.grey[200],
                    child: const Icon(Icons.image, size: 50, color: Colors.grey),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Widget auxiliar para crear los botones del menú
  Widget _buildMenuButton(String text, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: SizedBox(
        width: double.infinity,
        height: 60, // Botones altos como en image_2.png
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            foregroundColor: Colors.white,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5), // Bordes poco redondeados
            ),
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {
            // No funcional por ahora
          },
          child: Text(text),
        ),
      ),
    );
  }
}