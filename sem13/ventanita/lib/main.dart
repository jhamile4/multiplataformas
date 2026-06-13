import 'package:flutter/cupertino.dart';

void main() {
  runApp(const VentanitaApp());
}

class VentanitaApp extends StatelessWidget {
  const VentanitaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Ventanita Cupertino App',
      theme: CupertinoThemeData(
        brightness: Brightness.light,
        primaryColor: CupertinoColors.systemIndigo,
        primaryContrastingColor: CupertinoColors.white,
        barBackgroundColor: CupertinoColors.systemBackground,
        scaffoldBackgroundColor: CupertinoColors.systemGroupedBackground,
      ),
      home: LoginPage(),
    );
  }
}

class AppColors {
  static const primary = CupertinoColors.systemIndigo;
  static const secondary = Color(0xFFFF5E7E); // soft coral pink
  static const gradientStart = Color(0xFF5856D6);
  static const gradientEnd = Color(0xFF007AFF);
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

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.gradientStart, AppColors.gradientEnd],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color: CupertinoColors.white.withValues(alpha: 0.95),
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: [
                    BoxShadow(
                      color: CupertinoColors.black.withValues(alpha: 0.18),
                      blurRadius: 30,
                      offset: const Offset(0, 16),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        CupertinoIcons.lock_shield_fill,
                        size: 56,
                        color: CupertinoColors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Bienvenido',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: CupertinoColors.black,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Inicia sesión para continuar',
                      style: TextStyle(
                        color: CupertinoColors.secondaryLabel,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 28),
                    CupertinoTextField(
                      controller: emailController,
                      placeholder: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      prefix: const Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Icon(
                          CupertinoIcons.mail_solid,
                          color: CupertinoColors.secondaryLabel,
                          size: 20,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                      decoration: BoxDecoration(
                        color: CupertinoColors.extraLightBackgroundGray,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: CupertinoColors.lightBackgroundGray),
                      ),
                    ),
                    const SizedBox(height: 16),
                    CupertinoTextField(
                      controller: passwordController,
                      placeholder: 'Password',
                      obscureText: true,
                      prefix: const Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Icon(
                          CupertinoIcons.lock_fill,
                          color: CupertinoColors.secondaryLabel,
                          size: 20,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                      decoration: BoxDecoration(
                        color: CupertinoColors.extraLightBackgroundGray,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: CupertinoColors.lightBackgroundGray),
                      ),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: CupertinoButton(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(14),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            CupertinoPageRoute(builder: (_) => const MenuPage()),
                          );
                        },
                        child: const Text(
                          'LOGIN',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  void goTo(BuildContext context, Widget page) {
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (_) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    final options = [
      MenuOption('Home', CupertinoIcons.home, const HomePage()),
      MenuOption('Profile', CupertinoIcons.person, const ProfilePage()),
      MenuOption('Settings', CupertinoIcons.settings, const SettingsPage()),
      MenuOption('ListView', CupertinoIcons.list_bullet, const ListViewPage()),
      MenuOption('Registrar producto', CupertinoIcons.plus_square, const ProductPage()),
    ];

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Menú principal'),
        backgroundColor: CupertinoColors.systemBackground,
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.gradientStart, AppColors.gradientEnd],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.2),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hola, estudiante',
                      style: TextStyle(
                        color: CupertinoColors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.5,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Selecciona una opción para navegar',
                      style: TextStyle(
                        color: CupertinoColors.systemGrey6,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: CupertinoScrollbar(
                  child: SingleChildScrollView(
                    child: CupertinoListSection.insetGrouped(
                      margin: EdgeInsets.zero,
                      backgroundColor: CupertinoColors.transparent,
                      children: options.map((item) {
                        return CupertinoListTile(
                          leading: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: AppColors.primary.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(item.icon, color: AppColors.primary, size: 22),
                          ),
                          title: Text(
                            item.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          trailing: const CupertinoListTileChevron(),
                          onTap: () => goTo(context, item.page),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: CupertinoButton(
                  color: CupertinoColors.destructiveRed.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(14),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      CupertinoPageRoute(builder: (_) => const LoginPage()),
                    );
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(CupertinoIcons.square_arrow_right, color: CupertinoColors.destructiveRed, size: 20),
                      SizedBox(width: 8),
                      Text(
                        'Cerrar sesión',
                        style: TextStyle(
                          color: CupertinoColors.destructiveRed,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
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
    return CupertinoBasicPage(
      title: 'Home',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          heroCard(
            icon: CupertinoIcons.device_phone_portrait,
            title: 'Curso de móviles',
            text: 'Aplicación creada con Flutter usando Cupertino widgets, navegación nativa e iOS widgets.',
          ),
          const SizedBox(height: 18),
          heroCard(
            icon: CupertinoIcons.star_fill,
            title: 'Diseño moderno iOS',
            text: 'Estilo minimalista, transparencias, bordes redondeados y una experiencia fluida.',
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
    return CupertinoBasicPage(
      title: 'Profile',
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(26),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.secondary, AppColors.primary],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.2),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  width: 108,
                  height: 108,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://i.pravatar.cc/300?img=12',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Ana Martínez',
                  style: TextStyle(
                    color: CupertinoColors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.5,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Estudiante de plataformas móviles',
                  style: TextStyle(
                    color: CupertinoColors.systemGrey6,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          heroCard(
            icon: CupertinoIcons.book,
            title: 'Descripción',
            text: 'Me gusta crear aplicaciones móviles modernas, funcionales y con una experiencia visual de alta calidad.',
          ),
          const SizedBox(height: 14),
          heroCard(
            icon: CupertinoIcons.square_stack_3d_up,
            title: 'Habilidades',
            text: 'Flutter, Dart, diseño de interfaces iOS/macOS, navegación y gestión de estados.',
          ),
        ],
      ),
    );
  }
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notifications = true;
  bool _modernMode = true;

  @override
  Widget build(BuildContext context) {
    return CupertinoBasicPage(
      title: 'Settings',
      child: CupertinoListSection.insetGrouped(
        margin: EdgeInsets.zero,
        backgroundColor: CupertinoColors.transparent,
        children: [
          CupertinoListTile(
            leading: const Icon(CupertinoIcons.bell_fill, color: CupertinoColors.systemOrange),
            title: const Text('Notificaciones'),
            subtitle: const Text('Activar alertas de la aplicación'),
            trailing: CupertinoSwitch(
              value: _notifications,
              onChanged: (val) {
                setState(() {
                  _notifications = val;
                });
              },
            ),
          ),
          CupertinoListTile(
            leading: const Icon(CupertinoIcons.color_filter_fill, color: CupertinoColors.systemTeal),
            title: const Text('Modo moderno'),
            subtitle: const Text('Mantener diseño colorido'),
            trailing: CupertinoSwitch(
              value: _modernMode,
              onChanged: (val) {
                setState(() {
                  _modernMode = val;
                });
              },
            ),
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
    return CupertinoBasicPage(
      title: 'Lista de productos',
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: CupertinoButton.filled(
              borderRadius: BorderRadius.circular(14),
              onPressed: () async {
                await Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (_) => const ProductPage()),
                );
                setState(() {});
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(CupertinoIcons.plus, size: 20),
                  SizedBox(width: 8),
                  Text('Registrar nuevo producto'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 18),
          ProductStore.products.isEmpty
              ? heroCard(
                  icon: CupertinoIcons.archivebox_fill,
                  title: 'Sin productos',
                  text: 'Registra tu primer producto para verlo en esta lista.',
                )
              : CupertinoListSection.insetGrouped(
                  margin: EdgeInsets.zero,
                  backgroundColor: CupertinoColors.transparent,
                  children: List.generate(ProductStore.products.length, (index) {
                    final product = ProductStore.products[index];
                    return CupertinoListTile(
                      leading: Container(
                        width: 32,
                        height: 32,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.15),
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      title: Text(
                        product.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('S/ ${product.price} • ${product.category}'),
                      trailing: const CupertinoListTileChevron(),
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (_) => ProductDetailPage(product: product),
                          ),
                        ).then((_) {
                          setState(() {});
                        });
                      },
                    );
                  }),
                ),
        ],
      ),
    );
  }
}

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final categoryController = TextEditingController();
  final stockController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    categoryController.dispose();
    stockController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void _showErrorDialog(String message) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('Completar datos'),
          content: Text(message),
          actions: [
            CupertinoDialogAction(
              child: const Text('OK'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoBasicPage(
      title: 'Registro de productos',
      child: Column(
        children: [
          CupertinoFormSection.insetGrouped(
            margin: EdgeInsets.zero,
            header: const Text(
              'DATOS DEL PRODUCTO',
              style: TextStyle(
                fontSize: 12,
                color: CupertinoColors.secondaryLabel,
              ),
            ),
            children: [
              CupertinoFormRow(
                prefix: const Row(
                  children: [
                    Icon(CupertinoIcons.square_grid_2x2, color: CupertinoColors.inactiveGray, size: 20),
                    SizedBox(width: 8),
                    Text('Nombre', style: TextStyle(fontWeight: FontWeight.w500)),
                  ],
                ),
                child: CupertinoTextField(
                  controller: nameController,
                  placeholder: 'Nombre del producto',
                  decoration: null,
                  textAlign: TextAlign.end,
                ),
              ),
              CupertinoFormRow(
                prefix: const Row(
                  children: [
                    Icon(CupertinoIcons.money_dollar, color: CupertinoColors.inactiveGray, size: 20),
                    SizedBox(width: 8),
                    Text('Precio', style: TextStyle(fontWeight: FontWeight.w500)),
                  ],
                ),
                child: CupertinoTextField(
                  controller: priceController,
                  placeholder: 'S/ 0.00',
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  decoration: null,
                  textAlign: TextAlign.end,
                ),
              ),
              CupertinoFormRow(
                prefix: const Row(
                  children: [
                    Icon(CupertinoIcons.tag, color: CupertinoColors.inactiveGray, size: 20),
                    SizedBox(width: 8),
                    Text('Categoría', style: TextStyle(fontWeight: FontWeight.w500)),
                  ],
                ),
                child: CupertinoTextField(
                  controller: categoryController,
                  placeholder: 'Ej: Tecnología',
                  decoration: null,
                  textAlign: TextAlign.end,
                ),
              ),
              CupertinoFormRow(
                prefix: const Row(
                  children: [
                    Icon(CupertinoIcons.number, color: CupertinoColors.inactiveGray, size: 20),
                    SizedBox(width: 8),
                    Text('Stock', style: TextStyle(fontWeight: FontWeight.w500)),
                  ],
                ),
                child: CupertinoTextField(
                  controller: stockController,
                  placeholder: 'Ej: 10',
                  keyboardType: TextInputType.number,
                  decoration: null,
                  textAlign: TextAlign.end,
                ),
              ),
              CupertinoFormRow(
                prefix: const Row(
                  children: [
                    Icon(CupertinoIcons.doc_text, color: CupertinoColors.inactiveGray, size: 20),
                    SizedBox(width: 8),
                    Text('Descripción', style: TextStyle(fontWeight: FontWeight.w500)),
                  ],
                ),
                child: CupertinoTextField(
                  controller: descriptionController,
                  placeholder: 'Detalles del producto...',
                  maxLines: 3,
                  decoration: null,
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: CupertinoButton.filled(
              borderRadius: BorderRadius.circular(14),
              onPressed: () {
                if (nameController.text.isEmpty ||
                    priceController.text.isEmpty ||
                    categoryController.text.isEmpty ||
                    stockController.text.isEmpty ||
                    descriptionController.text.isEmpty) {
                  _showErrorDialog('Completa todos los campos');
                  return;
                }

                final product = Product(
                  name: nameController.text,
                  price: priceController.text,
                  category: categoryController.text,
                  stock: stockController.text,
                  description: descriptionController.text,
                );

                ProductStore.products.add(product);

                Navigator.pushReplacement(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => ProductDetailPage(product: product),
                  ),
                );
              },
              child: const Text(
                'GUARDAR PRODUCTO',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CupertinoBasicPage extends StatelessWidget {
  final String title;
  final Widget child;

  const CupertinoBasicPage({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(title),
        backgroundColor: CupertinoColors.systemBackground.withValues(alpha: 0.8),
      ),
      child: SafeArea(
        child: CupertinoScrollbar(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: child,
          ),
        ),
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
    padding: const EdgeInsets.all(18),
    decoration: BoxDecoration(
      color: CupertinoColors.white,
      borderRadius: BorderRadius.circular(18),
      border: Border.all(
        color: CupertinoColors.separator.withValues(alpha: 0.1),
        width: 1,
      ),
      boxShadow: [
        BoxShadow(
          color: CupertinoColors.black.withValues(alpha: 0.03),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: AppColors.primary, size: 24),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.label,
                  letterSpacing: -0.4,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                text,
                style: const TextStyle(
                  color: CupertinoColors.secondaryLabel,
                  fontSize: 14,
                  height: 1.35,
                ),
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
    return CupertinoBasicPage(
      title: 'Detalle del producto',
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.gradientEnd, AppColors.gradientStart],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: AppColors.gradientStart.withValues(alpha: 0.2),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              children: [
                const Icon(
                  CupertinoIcons.shopping_cart,
                  color: CupertinoColors.white,
                  size: 64,
                ),
                const SizedBox(height: 14),
                Text(
                  product.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: CupertinoColors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'S/ ${product.price}',
                  style: const TextStyle(
                    color: CupertinoColors.systemGrey6,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          heroCard(
            icon: CupertinoIcons.tag,
            title: 'Categoría',
            text: product.category,
          ),
          const SizedBox(height: 14),
          heroCard(
            icon: CupertinoIcons.number,
            title: 'Stock disponible',
            text: '${product.stock} unidades',
          ),
          const SizedBox(height: 14),
          heroCard(
            icon: CupertinoIcons.doc_text,
            title: 'Descripción',
            text: product.description,
          ),
          const SizedBox(height: 28),
          SizedBox(
            width: double.infinity,
            child: CupertinoButton(
              color: CupertinoColors.systemGrey5,
              borderRadius: BorderRadius.circular(14),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  CupertinoPageRoute(builder: (_) => const ListViewPage()),
                );
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(CupertinoIcons.list_bullet, color: CupertinoColors.label, size: 20),
                  SizedBox(width: 8),
                  Text(
                    'Volver a la lista',
                    style: TextStyle(
                      color: CupertinoColors.label,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
