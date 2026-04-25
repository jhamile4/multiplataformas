import 'package:flutter/material.dart';

void main() => runApp(const CalculadoraApp());

class CalculadoraApp extends StatelessWidget {
  const CalculadoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const CalculadoraScreen(),
    );
  }
}

class CalculadoraScreen extends StatefulWidget {
  const CalculadoraScreen({super.key});

  @override
  State<CalculadoraScreen> createState() => _CalculadoraScreenState();
}

class _CalculadoraScreenState extends State<CalculadoraScreen> {
  String _display = "0";
  String _historial = "";
  double? _num1;
  String? _operacion;
  bool _debeLimpiar = false;

  void _onTap(String texto) {
    setState(() {
      if (texto == "AC") {
        _display = "0";
        _historial = "";
        _num1 = null;
        _operacion = null;
      } else if (texto == "⌫") {
        if (_display.length > 1) {
          _display = _display.substring(0, _display.length - 1);
        } else {
          _display = "0";
        }
      } else if (texto == "±") {
        if (_display != "0") {
          _display = _display.startsWith("-") ? _display.substring(1) : "-$_display";
        }
      } else if (["÷", "×", "-", "+"].contains(texto)) {
        _num1 = double.tryParse(_display);
        _operacion = texto;
        _historial = "$_display $texto";
        _debeLimpiar = true;
      } else if (texto == "=") {
        if (_num1 != null && _operacion != null) {
          double num2 = double.parse(_display);
          double res = 0;
          if (_operacion == "+") res = _num1! + num2;
          if (_operacion == "-") res = _num1! - num2;
          if (_operacion == "×") res = _num1! * num2;
          if (_operacion == "÷") res = num2 != 0 ? _num1! / num2 : 0;

          _historial = "$_num1 $_operacion $num2 =";
          _display = res.toString().endsWith(".0") 
              ? res.toString().substring(0, res.toString().length - 2) 
              : res.toString();
          _num1 = null;
          _operacion = null;
          _debeLimpiar = true;
        }
      } else {
        if (_display == "0" || _debeLimpiar) {
          _display = texto;
          _debeLimpiar = false;
        } else {
          if (texto == "." && _display.contains(".")) return;
          _display += texto;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea( // Evita que el contenido choque con la cámara/notch
        child: Column(
          children: [
            // 1. PANTALLA (Usa Expanded para no empujar los botones)
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.all(12),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xFF11141D),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(_historial, style: const TextStyle(color: Colors.white54, fontSize: 18)),
                    const SizedBox(height: 5),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        _display,
                        style: const TextStyle(color: Colors.white, fontSize: 80, fontWeight: FontWeight.w200),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // 2. BOTONERA (Usa otro Expanded para ajustarse al resto del espacio)
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  children: [
                    _buildRow(["AC", "⌫", "%", "÷"]),
                    _buildRow(["7", "8", "9", "×"]),
                    _buildRow(["4", "5", "6", "-"]),
                    _buildRow(["1", "2", "3", "+"]),
                    _buildRow(["±", "0", ".", "="]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(List<String> labels) {
    return Expanded(
      child: Row(
        children: labels.map((l) => _buildButton(l)).toList(),
      ),
    );
  }

  Widget _buildButton(String label) {
    Color bg = Colors.white;
    Color txt = const Color(0xFF11141D);

    if (["AC", "⌫", "%", "±"].contains(label)) bg = const Color(0xFFF1F3F5);
    if (["÷", "×", "-", "+"].contains(label)) { bg = const Color(0xFFF9A01C); txt = Colors.white; }
    if (label == "=") { bg = const Color(0xFF10B981); txt = Colors.white; }

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Material(
          color: bg,
          borderRadius: BorderRadius.circular(20),
          elevation: 2,
          shadowColor: Colors.black12,
          child: InkWell(
            onTap: () => _onTap(label),
            borderRadius: BorderRadius.circular(20),
            child: Center(
              child: Text(
                label,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: txt),
              ),
            ),
          ),
        ),
      ),
    );
  }
}