import 'package:flutter/material.dart';

class InicioScreen extends StatelessWidget {
  const InicioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Definimos los colores aquí para no depender de otro archivo
    const Color azulPrimario = Color(0xFF0056A4);
    const Color amarilloBoton = Color(0xFFFFD700);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Título con el estilo de la Imagen 1
              const Text(
                '¡Bienvenido a Yeyo Dwelings!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28, 
                  fontWeight: FontWeight.bold, 
                  color: azulPrimario,
                ),
              ),
              const SizedBox(height: 50),
              
              // IMAGEN DE LA CASA DESDE LA URL PROPORCIONADA
              Expanded(
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15), // Bordes redondeados opcionales
                    child: Image.network(
                      'https://raw.githubusercontent.com/DiegoCruz0475/Casas_Imagenes_GIJUUUU/refs/heads/main/Imagenes_Gijuuuu/casa10.jpg',
                      fit: BoxFit.contain,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const Center(child: CircularProgressIndicator());
                      },
                      errorBuilder: (context, error, stackTrace) => 
                          const Icon(Icons.broken_image, size: 100, color: Colors.grey),
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 50),

              // Botones amarillos
              _buildYellowButton(context, 'Ingresar', '/login', amarilloBoton, azulPrimario),
              const SizedBox(height: 20),
              _buildYellowButton(context, 'Registrar', '/signup', amarilloBoton, azulPrimario),
            ],
          ),
        ),
      ),
    );
  }

  // Widget auxiliar para los botones
  Widget _buildYellowButton(BuildContext context, String text, String routeName, Color bgColor, Color textColor) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor: textColor,
        minimumSize: const Size(double.infinity, 55),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5), // Bordes poco redondeados como la Imagen 1
        ),
        textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        elevation: 2,
      ),
      onPressed: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Text(text),
    );
  }
}