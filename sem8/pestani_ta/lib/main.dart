import 'package:flutter/material.dart';

void main() {
  runApp(const MovilesApp());
}

class MovilesApp extends StatelessWidget {
  const MovilesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Móviles',
      theme: ThemeData(
        fontFamily: 'Roboto',
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6C5CE7),
          brightness: Brightness.light,
        ),
      ),
      home: const LoginPage(),
    );
  }
}

class AppColors {
  static const purple = Color(0xFF6C5CE7);
  static const pink = Color(0xFFFF4ECD);
  static const blue = Color(0xFF00B4D8);
  static const dark = Color(0xFF1E1E2F);
  static const soft = Color(0xFFF6F7FB);
}
class Product {
  final String name;
  final String price;
  final String category;
  final String stock;
  final String description;

  Product({
    required this.name,
    required this.price,
    required this.category,
    required this.stock,
    required this.description,
  });
}

class ProductStore {
  static final List<Product> products = [
    Product(
      name: 'Laptop gamer',
      price: '3500',
      category: 'Tecnología',
      stock: '8',
      description: 'Laptop potente para juegos y desarrollo.',
    ),
    Product(
      name: 'Mouse inalámbrico',
      price: '80',
      category: 'Accesorios',
      stock: '20',
      description: 'Mouse cómodo con conexión bluetooth.',
    ),
  ];
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.purple, AppColors.pink],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Container(
              padding: const EdgeInsets.all(26),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(28),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.18),
                    blurRadius: 30,
                    offset: const Offset(0, 16),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.lock_rounded, size: 70, color: AppColors.purple),
                  const SizedBox(height: 14),
                  const Text(
                    'Bienvenido',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: AppColors.dark,
                    ),
                  ),
                  const Text(
                    'Inicia sesión para continuar',
                    style: TextStyle(color: Colors.black54),
                  ),
                  const SizedBox(height: 28),
                  TextField(
                    controller: emailController,
                    decoration: inputDecoration('Email', Icons.email_rounded),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: inputDecoration('Password', Icons.password_rounded),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColors.purple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const MenuPage()),
                        );
                      },
                      child: const Text(
                        'LOGIN',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

InputDecoration inputDecoration(String label, IconData icon) {
  return InputDecoration(
    labelText: label,
    prefixIcon: Icon(icon),
    filled: true,
    fillColor: AppColors.soft,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide.none,
    ),
  );
}

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  void goTo(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    final options = [
      MenuOption('Home', Icons.home_rounded, const HomePage()),
      MenuOption('Profile', Icons.person_rounded, const ProfilePage()),
      MenuOption('Settings', Icons.settings_rounded, const SettingsPage()),
      MenuOption('ListView', Icons.list_alt_rounded, const ListViewPage()),
      MenuOption('Registrar producto', Icons.add_box_rounded, const ProductPage()),
    ];

    return Scaffold(
      backgroundColor: AppColors.soft,
      appBar: AppBar(
        title: const Text('Menú principal'),
        centerTitle: true,
        backgroundColor: AppColors.purple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.purple, AppColors.blue],
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hola, estudiante',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Selecciona una opción para navegar',
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.separated(
                itemCount: options.length,
                separatorBuilder: (_, __) => const SizedBox(height: 14),
                itemBuilder: (context, index) {
                  final item = options[index];

                  return ListTile(
                    tileColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    leading: CircleAvatar(
                      backgroundColor: AppColors.purple.withValues(alpha: 0.12),
                      child: Icon(item.icon, color: AppColors.purple),
                    ),
                    title: Text(
                      item.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 18),
                    onTap: () => goTo(context, item.page),
                  );
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton.icon(
                icon: const Icon(Icons.logout_rounded),
                label: const Text('Cerrar sesión'),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginPage()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuOption {
  final String title;
  final IconData icon;
  final Widget page;

  MenuOption(this.title, this.icon, this.page);
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicPage(
      title: 'Home',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          heroCard(
            icon: Icons.phone_android_rounded,
            title: 'Curso de móviles',
            text: 'Aplicación creada con Flutter usando Navigator, ListView y formularios.',
          ),
          const SizedBox(height: 18),
          heroCard(
            icon: Icons.star_rounded,
            title: 'Diseño moderno',
            text: 'Colores vibrantes, tarjetas suaves y una interfaz limpia.',
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicPage(
      title: 'Profile',
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(26),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.pink, AppColors.purple],
              ),
              borderRadius: BorderRadius.circular(28),
            ),
            child: const Column(
              children: [
                CircleAvatar(
                  radius: 58,
                  backgroundImage: NetworkImage(
                    'https://i.pravatar.cc/300?img=12',
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Ana Martínez',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Estudiante de plataformas móviles',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          heroCard(
            icon: Icons.school_rounded,
            title: 'Descripción',
            text:
                'Me gusta crear aplicaciones móviles modernas, funcionales y con buena experiencia visual.',
          ),
          const SizedBox(height: 14),
          heroCard(
            icon: Icons.code_rounded,
            title: 'Habilidades',
            text: 'Flutter, Dart, diseño UI, navegación y formularios.',
          ),
        ],
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicPage(
      title: 'Settings',
      child: Column(
        children: [
          SwitchListTile(
            tileColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            title: const Text('Notificaciones'),
            subtitle: const Text('Activar alertas de la aplicación'),
            value: true,
            onChanged: (_) {},
          ),
          const SizedBox(height: 14),
          SwitchListTile(
            tileColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            title: const Text('Modo moderno'),
            subtitle: const Text('Mantener diseño colorido'),
            value: true,
            onChanged: (_) {},
          ),
        ],
      ),
    );
  }
}
class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return BasicPage(
      title: 'Lista de productos',
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 50,
            child: FilledButton.icon(
              icon: const Icon(Icons.add_rounded),
              label: const Text('Registrar nuevo producto'),
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ProductPage()),
                );
                setState(() {});
              },
            ),
          ),
          const SizedBox(height: 18),
          ProductStore.products.isEmpty
              ? heroCard(
                  icon: Icons.inventory_2_rounded,
                  title: 'Sin productos',
                  text: 'Registra tu primer producto para verlo en esta lista.',
                )
              : ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: ProductStore.products.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final product = ProductStore.products[index];

                    return ListTile(
                      tileColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      leading: CircleAvatar(
                        backgroundColor: AppColors.blue.withValues(alpha: 0.15),
                        child: Text('${index + 1}'),
                      ),
                      title: Text(
                        product.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('S/ ${product.price} • ${product.category}'),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 18,
                        color: AppColors.purple,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ProductDetailPage(product: product),
                          ),
                        );
                      },
                    );
                  },
                ),
        ],
      ),
    );
  }
}

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final name = TextEditingController();
    final price = TextEditingController();
    final category = TextEditingController();
    final stock = TextEditingController();
    final description = TextEditingController();

    return BasicPage(
      title: 'Registro de productos',
      child: Column(
        children: [
          TextField(
            controller: name,
            decoration: inputDecoration('Nombre del producto', Icons.inventory_rounded),
          ),
          const SizedBox(height: 14),
          TextField(
            controller: price,
            keyboardType: TextInputType.number,
            decoration: inputDecoration('Precio', Icons.attach_money_rounded),
          ),
          const SizedBox(height: 14),
          TextField(
            controller: category,
            decoration: inputDecoration('Categoría', Icons.category_rounded),
          ),
          const SizedBox(height: 14),
          TextField(
            controller: stock,
            keyboardType: TextInputType.number,
            decoration: inputDecoration('Stock', Icons.numbers_rounded),
          ),
          const SizedBox(height: 14),
          TextField(
            controller: description,
            maxLines: 3,
            decoration: inputDecoration('Descripción', Icons.description_rounded),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 52,
            child: FilledButton.icon(
              icon: const Icon(Icons.save_rounded),
              label: const Text('GUARDAR PRODUCTO'),
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: () {
                if (name.text.isEmpty ||
                    price.text.isEmpty ||
                    category.text.isEmpty ||
                    stock.text.isEmpty ||
                    description.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Completa todos los campos'),
                      backgroundColor: Colors.redAccent,
                    ),
                  );
                  return;
                }

                final product = Product(
                  name: name.text,
                  price: price.text,
                  category: category.text,
                  stock: stock.text,
                  description: description.text,
                );

                ProductStore.products.add(product);

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProductDetailPage(product: product),
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


class BasicPage extends StatelessWidget {
  final String title;
  final Widget child;

  const BasicPage({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.soft,
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: AppColors.purple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: child,
      ),
    );
  }
}

Widget heroCard({
  required IconData icon,
  required String title,
  required String text,
}) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(22),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.06),
          blurRadius: 18,
          offset: const Offset(0, 8),
        ),
      ],
    ),
    child: Row(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: AppColors.purple.withValues(alpha: 0.12),
          child: Icon(icon, color: AppColors.purple),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: AppColors.dark,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                text,
                style: const TextStyle(color: Colors.black54, height: 1.35),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return BasicPage(
      title: 'Detalle del producto',
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.blue, AppColors.purple],
              ),
              borderRadius: BorderRadius.circular(28),
            ),
            child: Column(
              children: [
                const Icon(
                  Icons.shopping_bag_rounded,
                  color: Colors.white,
                  size: 70,
                ),
                const SizedBox(height: 12),
                Text(
                  product.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  'S/ ${product.price}',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          heroCard(
            icon: Icons.category_rounded,
            title: 'Categoría',
            text: product.category,
          ),
          const SizedBox(height: 14),
          heroCard(
            icon: Icons.numbers_rounded,
            title: 'Stock disponible',
            text: '${product.stock} unidades',
          ),
          const SizedBox(height: 14),
          heroCard(
            icon: Icons.description_rounded,
            title: 'Descripción',
            text: product.description,
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: OutlinedButton.icon(
              icon: const Icon(Icons.list_alt_rounded),
              label: const Text('Volver a la lista'),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const ListViewPage()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
