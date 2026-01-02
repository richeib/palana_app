import 'package:flutter/material.dart';
import 'now_playing_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const primaryColor = Color(0xFFE830AB);
  static const secondaryColor = Color(0xFF8022C3);
  static const lightPink = Color(0xFFF6D9F6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 👋 GREETING
              const Text('Good morning,', style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 4),
              const Text(
                'Ready to sync your mind?',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 24),

              /// ▶ CONTINUE LISTENING CARD (CLICKABLE)
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const NowPlayingScreen()),
                  );
                },
                child: _continueListeningCard(),
              ),

              const SizedBox(height: 32),

              /// 🌊 WAVE CATEGORIES HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Wave Categories',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              /// 🌊 WAVE CATEGORIES GRID
              _waveRow(
                context: context,
                left: _waveCard(
                  context: context,
                  icon: Icons.favorite_border,
                  title: 'Stress Relief',
                  subtitle: 'Calm your nervous system',
                  bg: const Color(0xFFFFEEF3),
                  iconColor: Colors.pink,
                ),
                right: _waveCard(
                  context: context,
                  icon: Icons.center_focus_strong,
                  title: 'Deep Focus',
                  subtitle: 'Enhance concentration',
                  bg: const Color(0xFFF1F7FF),
                  iconColor: Colors.blue,
                ),
              ),

              const SizedBox(height: 16),

              _waveRow(
                context: context,
                left: _waveCard(
                  context: context,
                  icon: Icons.nightlight_round,
                  title: 'Deep Sleep',
                  subtitle: 'Rest and recovery',
                  bg: const Color(0xFFF2F3FF),
                  iconColor: Colors.indigo,
                ),
                right: _waveCard(
                  context: context,
                  icon: Icons.psychology_outlined,
                  title: 'Memory Boost',
                  subtitle: 'Cognitive enhancement',
                  bg: const Color(0xFFF1FFF8),
                  iconColor: Colors.green,
                ),
              ),

              const SizedBox(height: 16),

              _waveRow(
                context: context,
                left: _waveCard(
                  context: context,
                  icon: Icons.flash_on_outlined,
                  title: 'Energy Wave',
                  subtitle: 'Mental vitality',
                  bg: const Color(0xFFFFF7E6),
                  iconColor: Colors.orange,
                ),
                right: _waveCard(
                  context: context,
                  icon: Icons.auto_awesome,
                  title: 'Creativity',
                  subtitle: 'Unlock imagination',
                  bg: const Color(0xFFF6F1FF),
                  iconColor: Colors.deepPurple,
                ),
              ),

              const SizedBox(height: 32),

              /// 💡 DAILY TIP
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: lightPink,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.tips_and_updates_outlined, color: primaryColor),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Daily Tip\nFor best results, use headphones and find a quiet space. '
                        'Consistent daily sessions of 15–30 minutes create lasting neural pathways.',
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  /// ▶ CONTINUE LISTENING CARD
  Widget _continueListeningCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [primaryColor, secondaryColor],
              ),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Icon(Icons.play_arrow, color: Colors.white, size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Continue listening',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Deep Focus Alpha Waves',
                  style: TextStyle(fontWeight: FontWeight.w600),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Text('12:45 remaining', style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 42,
                width: 42,
                child: CircularProgressIndicator(
                  value: 0.6,
                  strokeWidth: 4,
                  color: primaryColor,
                  backgroundColor: Colors.grey.shade200,
                ),
              ),
              const Text(
                '60%',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// 🌊 ROW
  Widget _waveRow({
    required BuildContext context,
    required Widget left,
    required Widget right,
  }) {
    return Row(
      children: [
        Expanded(child: left),
        const SizedBox(width: 16),
        Expanded(child: right),
      ],
    );
  }

  /// 🌊 WAVE CARD (CLICKABLE)
  Widget _waveCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    required Color bg,
    required Color iconColor,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const NowPlayingScreen()),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(22),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, color: iconColor),
            ),
            const SizedBox(height: 20),
            Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 6),
            Text(
              subtitle,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
