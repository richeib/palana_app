import 'package:flutter/material.dart';

class NowPlayingScreen extends StatelessWidget {
  const NowPlayingScreen({super.key});

  static const primaryColor = Color(0xFFE830AB);
  static const secondaryColor = Color(0xFF8022C3);
  static const lightWave = Color(0xFFEFF9FB);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            /// TOP BAR
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _iconButton(
                    icon: Icons.arrow_back_ios_new,
                    onTap: () => Navigator.pop(context),
                  ),
                  const Text(
                    'Now Playing',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ),
                  _iconButton(icon: Icons.timer_outlined, onTap: () {}),
                ],
              ),
            ),

            const SizedBox(height: 30),

            /// 🎧 ARTWORK
            Container(
              height: 260,
              width: 260,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [primaryColor.withOpacity(0.15), Colors.white],
                ),
              ),
              child: Center(
                child: Container(
                  height: 110,
                  width: 110,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [primaryColor, secondaryColor],
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 32),

            /// 🎵 TITLE
            const Text(
              'Alpha Meditation Wave',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            const Text(
              'Deep Focus Collection',
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 28),

            /// ⏳ PROGRESS BAR
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 4,
                      thumbShape: const RoundSliderThumbShape(
                        enabledThumbRadius: 6,
                      ),
                      overlayShape: const RoundSliderOverlayShape(
                        overlayRadius: 12,
                      ),
                      activeTrackColor: primaryColor,
                      inactiveTrackColor: Colors.grey.shade300,
                      thumbColor: primaryColor,
                    ),
                    child: Slider(value: 0.0, onChanged: (value) {}),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('00:00', style: TextStyle(color: Colors.grey)),
                        Text('25:00', style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),

            /// ▶ CONTROLS AREA
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 24),
              decoration: const BoxDecoration(
                color: lightWave,
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _controlButton(Icons.skip_previous),
                  const SizedBox(width: 24),
                  _playButton(),
                  const SizedBox(width: 24),
                  _controlButton(Icons.skip_next),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 🔘 TOP ICON BUTTON
  Widget _iconButton({required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Icon(icon, size: 20),
      ),
    );
  }

  /// ⏮ ⏭ BUTTON
  Widget _controlButton(IconData icon) {
    return Container(
      height: 54,
      width: 54,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Icon(icon),
    );
  }

  /// ▶ PLAY BUTTON
  Widget _playButton() {
    return Container(
      height: 68,
      width: 68,
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [primaryColor, secondaryColor]),
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(0.4),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: const Icon(Icons.play_arrow, color: Colors.white, size: 32),
    );
  }
}
