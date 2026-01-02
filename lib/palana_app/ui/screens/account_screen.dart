import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  static const primaryColor = Color(0xFFE830AB);
  static const secondaryColor = Color(0xFF8022C3);
  static const lightBg = Color(0xFFF6D9F6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            /// HEADER
            const Text(
              'Account',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            const Text(
              'Manage your profile & settings',
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 24),

            /// 👤 PROFILE CARD
            _profileCard(),

            const SizedBox(height: 20),

            /// 📊 STATS (FIXED: no const error)
            Row(
              children: [
                Expanded(child: _statBox('24', 'Tracks')),
                const SizedBox(width: 12),
                Expanded(child: _statBox('47', 'Hours')),
                const SizedBox(width: 12),
                Expanded(child: _statBox('12', 'Streak')),
              ],
            ),

            const SizedBox(height: 32),

            /// ⚙️ SETTINGS
            _settingTile(
              icon: Icons.workspace_premium,
              title: 'Subscription',
              subtitle: 'Premium • Active',
            ),
            _settingTile(
              icon: Icons.credit_card,
              title: 'Manage Subscription',
              subtitle: 'Billing & plans',
            ),
            _settingTile(
              icon: Icons.receipt_long,
              title: 'Purchase History',
              subtitle: 'View past orders',
            ),
            _settingTile(
              icon: Icons.notifications_none,
              title: 'Notifications',
              subtitle: 'Alerts & reminders',
            ),
            _settingTile(
              icon: Icons.settings,
              title: 'App Settings',
              subtitle: 'Preferences',
            ),
            _settingTile(
              icon: Icons.lock_outline,
              title: 'Privacy',
              subtitle: 'Data & security',
            ),
            _settingTile(
              icon: Icons.help_outline,
              title: 'Help & Support',
              subtitle: 'Get assistance',
            ),

            const SizedBox(height: 24),

            /// 🚪 SIGN OUT
            GestureDetector(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/login',
                  (route) => false,
                );
              },
              child: const Center(
                child: Text(
                  'Sign Out',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  /// 👤 PROFILE CARD
  Widget _profileCard() {
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
            child: const Icon(
              Icons.person_outline,
              color: Colors.white,
              size: 28,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'John Doe',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                SizedBox(height: 4),
                Text(
                  'john.doe@email.com',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 6),
                Row(
                  children: [
                    Icon(Icons.emoji_events, size: 16, color: Colors.orange),
                    SizedBox(width: 4),
                    Text(
                      'Premium Member',
                      style: TextStyle(color: Colors.orange, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: lightBg,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'Edit',
              style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 📊 STAT BOX
  Widget _statBox(String value, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  /// ⚙️ SETTINGS TILE
  Widget _settingTile({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: lightBg,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: primaryColor),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                Text(subtitle, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
    );
  }
}
