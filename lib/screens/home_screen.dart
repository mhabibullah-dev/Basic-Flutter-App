import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import 'login_screen.dart';

/// Home Screen
///
/// Implements the Stitch "Simple Home Screen" design from the
/// "Architectural Anchor" project. Features:
///   - AppBar with app title and profile avatar
///   - Welcome greeting with project count
///   - "Recent Updates" section with 3 activity cards
///   - Bottom navigation bar: Home, Search, Activity, Profile
///   - Logout action that pops back to the Login Screen
class HomeScreen extends StatefulWidget {
  final String userEmail;

  const HomeScreen({super.key, required this.userEmail});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedNavIndex = 0;

  // Derive a display name from the email
  String get _displayName {
    final local = widget.userEmail.split('@').first;
    return local.isNotEmpty
        ? local[0].toUpperCase() + local.substring(1)
        : 'Alex';
  }

  // ── Recent Updates Data ───────────────────────────────────────────
  static const List<Map<String, dynamic>> _updates = [
    {
      'status': 'Blueprint Approved',
      'detail': 'Central Atrium Layout',
      'icon': Icons.check_circle_outline,
      'iconColor': Color(0xFF2E7D32),
      'badgeColor': Color(0xFFE8F5E9),
      'badgeText': 'Approved',
    },
    {
      'status': 'Revision Needed',
      'detail': 'Facade Material Specs',
      'icon': Icons.edit_note_outlined,
      'iconColor': Color(0xFF7B3200),
      'badgeColor': Color(0xFFFFEBE0),
      'badgeText': 'In Review',
    },
    {
      'status': 'Team Sync Complete',
      'detail': 'Q3 Milestone Alignment',
      'icon': Icons.group_outlined,
      'iconColor': AppTheme.primary,
      'badgeColor': AppTheme.secondaryContainer,
      'badgeText': 'Done',
    },
  ];

  // ── Bottom Nav Icons/Labels ───────────────────────────────────────
  static const List<BottomNavigationBarItem> _navItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      activeIcon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search_outlined),
      activeIcon: Icon(Icons.search),
      label: 'Search',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.analytics_outlined),
      activeIcon: Icon(Icons.analytics),
      label: 'Activity',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person_outline),
      activeIcon: Icon(Icons.person),
      label: 'Profile',
    ),
  ];

  void _onNavTap(int index) => setState(() => _selectedNavIndex = index);

  // ── Logout ────────────────────────────────────────────────────────
  void _onLogout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppTheme.surfaceContainerLow,
      appBar: _buildAppBar(theme),
      body: _buildBody(theme),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  // ── App Bar ───────────────────────────────────────────────────────
  PreferredSizeWidget _buildAppBar(ThemeData theme) {
    return AppBar(
      backgroundColor: AppTheme.surfaceContainerLowest,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Text(
        'Architectural Anchor',
        style: GoogleFonts.manrope(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: AppTheme.primary,
          letterSpacing: -0.3,
        ),
      ),
      actions: [
        // Notification icon
        IconButton(
          icon: const Icon(Icons.notifications_outlined),
          color: AppTheme.onSurfaceVariant,
          onPressed: () {},
          tooltip: 'Notifications',
        ),
        // Avatar / Logout
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: GestureDetector(
            onTap: () => _showLogoutDialog(),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: AppTheme.primaryContainer,
              child: Text(
                _displayName[0].toUpperCase(),
                style: GoogleFonts.manrope(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppTheme.surfaceContainerLowest,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(
          'Sign Out',
          style: GoogleFonts.manrope(
            fontWeight: FontWeight.w700,
            color: AppTheme.onSurface,
          ),
        ),
        content: Text(
          'Are you sure you want to sign out?',
          style: GoogleFonts.inter(
            color: AppTheme.onSurfaceVariant,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(ctx);
              _onLogout();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primary,
              foregroundColor: Colors.white,
              shape: const StadiumBorder(),
            ),
            child: const Text('Sign Out'),
          ),
        ],
      ),
    );
  }

  // ── Body ──────────────────────────────────────────────────────────
  Widget _buildBody(ThemeData theme) {
    // Show different content based on nav tab
    if (_selectedNavIndex != 0) {
      return _PlaceholderTab(
        icon: _navItems[_selectedNavIndex].icon as Icon,
        label: _navItems[_selectedNavIndex].label!,
      );
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Welcome block ────────────────────────────────────────
          _WelcomeCard(displayName: _displayName),

          // ── Stats Row ────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
            child: Row(
              children: const [
                Expanded(
                  child: _StatPillar(
                    value: '24',
                    label: 'Active\nProjects',
                    color: AppTheme.primary,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _StatPillar(
                    value: '8',
                    label: 'Pending\nReviews',
                    color: AppTheme.tertiary,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _StatPillar(
                    value: '3',
                    label: 'Team\nSyncs',
                    color: AppTheme.secondary,
                  ),
                ),
              ],
            ),
          ),

          // ── Recent Updates ───────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 28, 24, 8),
            child: Text(
              'Recent Updates',
              style: GoogleFonts.manrope(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppTheme.onSurface,
                letterSpacing: -0.3,
              ),
            ),
          ),

          ListView.separated(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _updates.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, i) => _UpdateCard(data: _updates[i]),
          ),
        ],
      ),
    );
  }

  // ── Bottom Nav ────────────────────────────────────────────────────
  Widget _buildBottomNav() {
    return Container(
      decoration: const BoxDecoration(
        color: AppTheme.surfaceContainerLowest,
        boxShadow: [AppTheme.ambientShadow],
      ),
      child: BottomNavigationBar(
        currentIndex: _selectedNavIndex,
        onTap: _onNavTap,
        items: _navItems,
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedLabelStyle: GoogleFonts.inter(
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: GoogleFonts.inter(
          fontSize: 11,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

// ── Welcome Card ───────────────────────────────────────────────────────────────
class _WelcomeCard extends StatelessWidget {
  final String displayName;

  const _WelcomeCard({required this.displayName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: AppTheme.primaryGradient,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [AppTheme.ambientShadow],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Good morning 👋',
            style: GoogleFonts.inter(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Welcome Home, $displayName',
            style: GoogleFonts.manrope(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              letterSpacing: -0.3,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Everything is on track. You have 24 active\nprojects requiring your attention today.',
            style: GoogleFonts.inter(
              fontSize: 13,
              color: Colors.white.withOpacity(0.85),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Stat Pillar ────────────────────────────────────────────────────────────────
class _StatPillar extends StatelessWidget {
  final String value;
  final String label;
  final Color color;

  const _StatPillar({
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      decoration: BoxDecoration(
        color: AppTheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x08004A8D),
            blurRadius: 20,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            value,
            style: GoogleFonts.manrope(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: color,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: AppTheme.onSurfaceVariant,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Update Card ────────────────────────────────────────────────────────────────
class _UpdateCard extends StatelessWidget {
  final Map<String, dynamic> data;

  const _UpdateCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x08004A8D),
            blurRadius: 20,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Icon
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: (data['badgeColor'] as Color).withOpacity(0.6),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              data['icon'] as IconData,
              color: data['iconColor'] as Color,
              size: 22,
            ),
          ),
          const SizedBox(width: 14),

          // Text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data['status'] as String,
                  style: GoogleFonts.manrope(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.onSurface,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  data['detail'] as String,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: AppTheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),

          // Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: data['badgeColor'] as Color,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              data['badgeText'] as String,
              style: GoogleFonts.inter(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: data['iconColor'] as Color,
              ),
            ),
          ),

          const SizedBox(width: 4),
          const Icon(
            Icons.chevron_right,
            size: 18,
            color: AppTheme.onSurfaceVariant,
          ),
        ],
      ),
    );
  }
}

// ── Placeholder Tab ────────────────────────────────────────────────────────────
class _PlaceholderTab extends StatelessWidget {
  final Icon icon;
  final String label;

  const _PlaceholderTab({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            (icon).icon,
            size: 56,
            color: AppTheme.outlineVariant,
          ),
          const SizedBox(height: 12),
          Text(
            '$label coming soon',
            style: GoogleFonts.inter(
              fontSize: 15,
              color: AppTheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
