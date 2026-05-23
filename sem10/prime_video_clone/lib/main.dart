import 'package:flutter/material.dart';

void main() {
  runApp(const PrimeVideoApp());
}

class PrimeVideoApp extends StatelessWidget {
  const PrimeVideoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prime Video',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF05070B),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00A8E1),
          brightness: Brightness.dark,
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontWeight: FontWeight.w800),
          titleMedium: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      home: const PrimeHomePage(),
    );
  }
}

class PrimeTitle {
  final String title;
  final String subtitle;
  final String poster;
  final String backdrop;
  final String tag;
  final double progress;

  const PrimeTitle({
    required this.title,
    required this.subtitle,
    required this.poster,
    required this.backdrop,
    required this.tag,
    this.progress = 0,
  });
}

const heroTitle = PrimeTitle(
  title: 'Fallout',
  subtitle: 'Nueva temporada disponible ahora',
  poster: 'https://picsum.photos/seed/fallout-poster/500/750',
  backdrop: 'https://picsum.photos/seed/fallout-wide/1280/720',
  tag: 'prime',
);

const featuredTitles = [
  PrimeTitle(
    title: 'The Boys',
    subtitle: 'Serie original',
    poster: 'https://picsum.photos/seed/the-boys-poster/500/750',
    backdrop: 'https://picsum.photos/seed/the-boys-wide/780/440',
    tag: 'prime',
  ),
  PrimeTitle(
    title: 'Reacher',
    subtitle: 'Accion y suspenso',
    poster: 'https://picsum.photos/seed/reacher-poster/500/750',
    backdrop: 'https://picsum.photos/seed/reacher-wide/780/440',
    tag: 'prime',
  ),
  PrimeTitle(
    title: 'The Lord of the Rings',
    subtitle: 'Los Anillos de Poder',
    poster: 'https://picsum.photos/seed/rings-poster/500/750',
    backdrop: 'https://picsum.photos/seed/rings-wide/780/440',
    tag: 'prime',
  ),
  PrimeTitle(
    title: 'Citadel',
    subtitle: 'Espias y secretos',
    poster: 'https://picsum.photos/seed/citadel-poster/500/750',
    backdrop: 'https://picsum.photos/seed/citadel-wide/780/440',
    tag: 'prime',
  ),
  PrimeTitle(
    title: 'Jack Ryan',
    subtitle: 'Operacion global',
    poster: 'https://picsum.photos/seed/jack-ryan-poster/500/750',
    backdrop: 'https://picsum.photos/seed/jack-ryan-wide/780/440',
    tag: 'prime',
  ),
];

const continueWatching = [
  PrimeTitle(
    title: 'Invincible',
    subtitle: 'T2 E5',
    poster: 'https://picsum.photos/seed/invincible-poster/500/750',
    backdrop: 'https://picsum.photos/seed/invincible-wide/780/440',
    tag: 'prime',
    progress: 0.63,
  ),
  PrimeTitle(
    title: 'Mr. & Mrs. Smith',
    subtitle: 'T1 E2',
    poster: 'https://picsum.photos/seed/smith-poster/500/750',
    backdrop: 'https://picsum.photos/seed/smith-wide/780/440',
    tag: 'prime',
    progress: 0.28,
  ),
  PrimeTitle(
    title: 'Upload',
    subtitle: 'T3 E1',
    poster: 'https://picsum.photos/seed/upload-poster/500/750',
    backdrop: 'https://picsum.photos/seed/upload-wide/780/440',
    tag: 'prime',
    progress: 0.44,
  ),
];

const movies = [
  PrimeTitle(
    title: 'Road House',
    subtitle: 'Pelicula',
    poster: 'https://picsum.photos/seed/road-house-poster/500/750',
    backdrop: 'https://picsum.photos/seed/road-house-wide/780/440',
    tag: 'prime',
  ),
  PrimeTitle(
    title: 'Air',
    subtitle: 'Drama deportivo',
    poster: 'https://picsum.photos/seed/air-poster/500/750',
    backdrop: 'https://picsum.photos/seed/air-wide/780/440',
    tag: 'prime',
  ),
  PrimeTitle(
    title: 'The Tomorrow War',
    subtitle: 'Ciencia ficcion',
    poster: 'https://picsum.photos/seed/tomorrow-war-poster/500/750',
    backdrop: 'https://picsum.photos/seed/tomorrow-war-wide/780/440',
    tag: 'prime',
  ),
  PrimeTitle(
    title: 'Without Remorse',
    subtitle: 'Accion',
    poster: 'https://picsum.photos/seed/remorse-poster/500/750',
    backdrop: 'https://picsum.photos/seed/remorse-wide/780/440',
    tag: 'prime',
  ),
  PrimeTitle(
    title: 'The Idea of You',
    subtitle: 'Romance',
    poster: 'https://picsum.photos/seed/idea-you-poster/500/750',
    backdrop: 'https://picsum.photos/seed/idea-you-wide/780/440',
    tag: 'prime',
  ),
];

const liveTiles = [
  PrimeTitle(
    title: 'Canal Prime',
    subtitle: 'En vivo',
    poster: 'https://picsum.photos/seed/live-channel-poster/500/750',
    backdrop: 'https://picsum.photos/seed/live-channel-wide/780/440',
    tag: 'LIVE',
  ),
  PrimeTitle(
    title: 'Deportes',
    subtitle: 'Resumen destacado',
    poster: 'https://picsum.photos/seed/sports-poster/500/750',
    backdrop: 'https://picsum.photos/seed/sports-wide/780/440',
    tag: 'LIVE',
  ),
  PrimeTitle(
    title: 'Estrenos',
    subtitle: 'Trailer',
    poster: 'https://picsum.photos/seed/trailer-poster/500/750',
    backdrop: 'https://picsum.photos/seed/trailer-wide/780/440',
    tag: 'VIDEO',
  ),
];

class PrimeHomePage extends StatefulWidget {
  const PrimeHomePage({super.key});

  @override
  State<PrimeHomePage> createState() => _PrimeHomePageState();
}

class _PrimeHomePageState extends State<PrimeHomePage> {
  int selectedNavigation = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedNavigation,
        height: 70,
        backgroundColor: const Color(0xFF0A0E14),
        indicatorColor: const Color(0xFF1A98FF).withValues(alpha: 0.18),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        onDestinationSelected: (index) {
          setState(() => selectedNavigation = index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Inicio',
          ),
          NavigationDestination(
            icon: Icon(Icons.storefront_outlined),
            selectedIcon: Icon(Icons.storefront),
            label: 'Tienda',
          ),
          NavigationDestination(icon: Icon(Icons.search), label: 'Buscar'),
          NavigationDestination(
            icon: Icon(Icons.download_outlined),
            selectedIcon: Icon(Icons.download),
            label: 'Descargas',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Mi espacio',
          ),
        ],
      ),
      body: const SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: PrimeHeader()),
            SliverToBoxAdapter(child: CategoryTabs()),
            SliverToBoxAdapter(child: FeaturedHero()),
            SliverToBoxAdapter(
              child: LandscapeSection(
                title: 'Continuar viendo',
                titles: continueWatching,
                showProgress: true,
              ),
            ),
            SliverToBoxAdapter(
              child: PosterSection(
                title: 'Incluido con Prime',
                titles: featuredTitles,
              ),
            ),
            SliverToBoxAdapter(child: TopTenSection()),
            SliverToBoxAdapter(child: VideoSection()),
            SliverToBoxAdapter(
              child: PosterSection(
                title: 'Peliculas que podrian gustarte',
                titles: movies,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 28)),
          ],
        ),
      ),
    );
  }
}

class PrimeHeader extends StatelessWidget {
  const PrimeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      child: Row(
        children: [
          const Text(
            'prime video',
            style: TextStyle(
              color: Color(0xFF5BC7F7),
              fontSize: 25,
              fontWeight: FontWeight.w900,
              letterSpacing: 0,
            ),
          ),
          const Spacer(),
          HeaderIcon(icon: Icons.cast, tooltip: 'Transmitir'),
          const SizedBox(width: 6),
          HeaderIcon(icon: Icons.notifications_none, tooltip: 'Notificaciones'),
          const SizedBox(width: 6),
          Container(
            width: 34,
            height: 34,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Color(0xFF2A8CFF), Color(0xFF7B61FF)],
              ),
            ),
            child: const Center(
              child: Text('A', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderIcon extends StatelessWidget {
  final IconData icon;
  final String tooltip;

  const HeaderIcon({super.key, required this.icon, required this.tooltip});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: tooltip,
      style: IconButton.styleFrom(
        backgroundColor: Colors.white.withValues(alpha: 0.06),
      ),
      onPressed: () {},
      icon: Icon(icon),
    );
  }
}

class CategoryTabs extends StatelessWidget {
  const CategoryTabs({super.key});

  @override
  Widget build(BuildContext context) {
    final tabs = ['Todos', 'Peliculas', 'Series', 'Deportes', 'TV en vivo'];

    return SizedBox(
      height: 46,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final selected = index == 0;
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 18),
            decoration: BoxDecoration(
              color: selected ? Colors.white : const Color(0xFF17202C),
              borderRadius: BorderRadius.circular(22),
            ),
            child: Text(
              tabs[index],
              style: TextStyle(
                color: selected ? Colors.black : const Color(0xFFD6E0EA),
                fontWeight: FontWeight.w800,
              ),
            ),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemCount: tabs.length,
      ),
    );
  }
}

class FeaturedHero extends StatelessWidget {
  const FeaturedHero({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 430,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
      child: Stack(
        fit: StackFit.expand,
        children: [
          StreamingArtwork(title: heroTitle.title, landscape: true),
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Color(0xCC05070B),
                  Color(0xFF05070B),
                ],
              ),
            ),
          ),
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xDD05070B), Colors.transparent],
              ),
            ),
          ),
          Positioned(
            left: 18,
            right: 18,
            bottom: 18,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PrimeBadge(text: 'prime'),
                const SizedBox(height: 12),
                const Text(
                  'Fallout',
                  style: TextStyle(
                    fontSize: 44,
                    fontWeight: FontWeight.w900,
                    height: 1,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Incluido con Prime  |  4K UHD  |  16+',
                  style: TextStyle(
                    color: Color(0xFFC7D1DC),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Una serie de accion, misterio y supervivencia en un mundo despues del desastre.',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Color(0xFFE8EEF5), fontSize: 15),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: FilledButton.icon(
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        onPressed: () {},
                        icon: const Icon(Icons.play_arrow_rounded, size: 28),
                        label: const Text(
                          'Reproducir',
                          style: TextStyle(fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    SquareAction(icon: Icons.add, tooltip: 'Mi lista'),
                    const SizedBox(width: 10),
                    SquareAction(icon: Icons.info_outline, tooltip: 'Detalles'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SquareAction extends StatelessWidget {
  final IconData icon;
  final String tooltip;

  const SquareAction({super.key, required this.icon, required this.tooltip});

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      tooltip: tooltip,
      style: IconButton.styleFrom(
        backgroundColor: Colors.white.withValues(alpha: 0.16),
        fixedSize: const Size(50, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: () {},
      icon: Icon(icon),
    );
  }
}

class PosterSection extends StatelessWidget {
  final String title;
  final List<PrimeTitle> titles;

  const PosterSection({super.key, required this.title, required this.titles});

  @override
  Widget build(BuildContext context) {
    return SectionShell(
      title: title,
      child: SizedBox(
        height: 245,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => PosterCard(title: titles[index]),
          separatorBuilder: (_, __) => const SizedBox(width: 12),
          itemCount: titles.length,
        ),
      ),
    );
  }
}

class LandscapeSection extends StatelessWidget {
  final String title;
  final List<PrimeTitle> titles;
  final bool showProgress;

  const LandscapeSection({
    super.key,
    required this.title,
    required this.titles,
    this.showProgress = false,
  });

  @override
  Widget build(BuildContext context) {
    return SectionShell(
      title: title,
      child: SizedBox(
        height: 154,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) =>
              LandscapeCard(title: titles[index], showProgress: showProgress),
          separatorBuilder: (_, __) => const SizedBox(width: 12),
          itemCount: titles.length,
        ),
      ),
    );
  }
}

class SectionShell extends StatelessWidget {
  final String title;
  final Widget child;

  const SectionShell({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                const Icon(Icons.chevron_right, color: Color(0xFF9AA7B5)),
              ],
            ),
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}

class PosterCard extends StatelessWidget {
  final PrimeTitle title;

  const PosterCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 134,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  StreamingArtwork(title: title.title),
                  Positioned(
                    left: 7,
                    top: 7,
                    child: PrimeBadge(text: title.tag),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.w800),
          ),
          Text(
            title.subtitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Color(0xFF94A3B3), fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class LandscapeCard extends StatelessWidget {
  final PrimeTitle title;
  final bool showProgress;

  const LandscapeCard({
    super.key,
    required this.title,
    this.showProgress = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 242,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          fit: StackFit.expand,
          children: [
            StreamingArtwork(title: title.title, landscape: true),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Color(0xDD000000)],
                ),
              ),
            ),
            Positioned(left: 10, top: 10, child: PrimeBadge(text: title.tag)),
            const Center(
              child: CircleAvatar(
                radius: 23,
                backgroundColor: Color(0xCC000000),
                child: Icon(Icons.play_arrow_rounded, size: 34),
              ),
            ),
            Positioned(
              left: 10,
              right: 10,
              bottom: showProgress ? 18 : 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    title.subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xFFD6E0EA),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            if (showProgress)
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: LinearProgressIndicator(
                  minHeight: 5,
                  value: title.progress,
                  backgroundColor: Colors.white24,
                  color: const Color(0xFF00A8E1),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class TopTenSection extends StatelessWidget {
  const TopTenSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionShell(
      title: 'Top 10 en Peru',
      child: SizedBox(
        height: 210,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final title = featuredTitles[index % featuredTitles.length];
            return SizedBox(
              width: 175,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(
                        fontSize: 104,
                        height: 0.9,
                        fontWeight: FontWeight.w900,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 3
                          ..color = const Color(0xFF9AA7B5),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: SizedBox(
                      width: 122,
                      child: PosterCard(title: title),
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (_, __) => const SizedBox(width: 12),
          itemCount: 5,
        ),
      ),
    );
  }
}

class VideoSection extends StatelessWidget {
  const VideoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LandscapeSection(
      title: 'Videos, trailers y canales en vivo',
      titles: liveTiles,
    );
  }
}

class PrimeBadge extends StatelessWidget {
  final String text;

  const PrimeBadge({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final isLive = text == 'LIVE';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isLive ? const Color(0xFFD71920) : const Color(0xFF00A8E1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w900,
          fontSize: 11,
        ),
      ),
    );
  }
}

class StreamingArtwork extends StatelessWidget {
  final String title;
  final bool landscape;

  const StreamingArtwork({
    super.key,
    required this.title,
    this.landscape = false,
  });

  @override
  Widget build(BuildContext context) {
    final palette = _paletteFor(title);

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: palette,
        ),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            right: landscape ? 18 : -18,
            top: landscape ? 20 : 42,
            child: Icon(
              Icons.movie_creation_outlined,
              size: landscape ? 110 : 92,
              color: Colors.white.withValues(alpha: 0.18),
            ),
          ),
          Positioned(
            left: landscape ? 18 : 12,
            right: landscape ? 80 : 12,
            bottom: landscape ? 20 : 18,
            child: Text(
              title.toUpperCase(),
              maxLines: landscape ? 2 : 4,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
                fontSize: landscape ? 28 : 20,
                height: 0.95,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Positioned(
            left: landscape ? 18 : 12,
            top: landscape ? 18 : 38,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.38),
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text(
                'HD',
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.w900),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Color> _paletteFor(String value) {
    final palettes = [
      [
        const Color(0xFF0B1320),
        const Color(0xFF005F73),
        const Color(0xFF00A8E1),
      ],
      [
        const Color(0xFF111827),
        const Color(0xFF7F1D1D),
        const Color(0xFFDC2626),
      ],
      [
        const Color(0xFF0F172A),
        const Color(0xFF4338CA),
        const Color(0xFF22D3EE),
      ],
      [
        const Color(0xFF18181B),
        const Color(0xFF365314),
        const Color(0xFF84CC16),
      ],
      [
        const Color(0xFF1E1B4B),
        const Color(0xFF6D28D9),
        const Color(0xFFF472B6),
      ],
      [
        const Color(0xFF171717),
        const Color(0xFF92400E),
        const Color(0xFFF59E0B),
      ],
    ];
    return palettes[value.length % palettes.length];
  }
}
