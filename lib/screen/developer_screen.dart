import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DeveloperScreen extends StatefulWidget {
  const DeveloperScreen({super.key});

  @override
  State<DeveloperScreen> createState() => _DeveloperScreenState();
}

class _DeveloperScreenState extends State<DeveloperScreen> {
  bool _isDarkMode = false;
  final String _profileImage = 'assets/images/profile.jpg';
  final String _linkedInUrl = 'https://linkedin.com/in/sohrab09';
  final String _facebookUrl = 'https://facebook.com/sohrab09';
  final String _email = 'mailto:sohrab.cse9@gmail.com';

  void _toggleDarkMode() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  Future<void> _launchURL(String url) async {
    try {
      final Uri uri = Uri.parse(url);
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        _showSnackBar('Could not launch $url');
      }
    } catch (e) {
      _showSnackBar('Error: ${e.toString()}');
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = _isDarkMode ? Colors.tealAccent : Colors.blue;
    final Color backgroundColor =
        _isDarkMode ? const Color(0xFF121212) : Colors.grey[50]!;
    final Color cardColor =
        _isDarkMode ? const Color(0xFF1E1E1E) : Colors.white;
    final Color textColor = _isDarkMode ? Colors.white : Colors.black87;
    final Color secondaryTextColor =
        _isDarkMode ? Colors.white70 : Colors.black54;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Developer Profile',
          style: TextStyle(fontWeight: FontWeight.bold, color: textColor),
        ),
        centerTitle: true,
        backgroundColor: backgroundColor,
        actions: [
          IconButton(
            icon: Icon(
              _isDarkMode ? Icons.light_mode : Icons.dark_mode,
              color: _isDarkMode ? Colors.tealAccent : Colors.blue,
            ),
            onPressed: _toggleDarkMode,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Image with Glow Effect
              Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: primaryColor.withOpacity(0.3),
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: 75,
                      backgroundColor: primaryColor.withOpacity(0.1),
                      child: CircleAvatar(
                        radius: 70,
                        backgroundImage: AssetImage(_profileImage),
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: primaryColor.withOpacity(0.5),
                          width: 2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Name and Title with Animation
              Column(
                children: [
                  Text(
                    'Sohrab H. Nahid',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Full Stack Developer',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: secondaryTextColor,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Bio Card with Neumorphic Effect
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color:
                          _isDarkMode
                              ? Colors.black.withOpacity(0.4)
                              : Colors.grey.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                    _isDarkMode
                        ? BoxShadow(
                          color: Colors.white.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, -4),
                        )
                        : BoxShadow(
                          color: Colors.white.withOpacity(0.8),
                          blurRadius: 10,
                          offset: const Offset(0, -4),
                        ),
                  ],
                ),
                child: Text(
                  'Passionate developer with expertise in Flutter, React, and backend technologies. '
                  'Specializing in building performant cross-platform applications with beautiful UIs '
                  'and robust architecture.',
                  style: TextStyle(fontSize: 16, color: textColor, height: 1.6),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 32),

              // Skills Section
              _buildSectionTitle('Technical Skills', textColor, primaryColor),

              const SizedBox(height: 16),

              Wrap(
                spacing: 8,
                runSpacing: 8,
                alignment: WrapAlignment.center,
                children: [
                  _buildSkillChip('Flutter', primaryColor, textColor),
                  _buildSkillChip('Dart', primaryColor, textColor),
                  _buildSkillChip('Firebase', primaryColor, textColor),
                  _buildSkillChip('UI/UX', primaryColor, textColor),
                  _buildSkillChip('Provider', primaryColor, textColor),
                  _buildSkillChip('RESTful APIs', primaryColor, textColor),
                  _buildSkillChip('Git', primaryColor, textColor),
                  _buildSkillChip('CI/CD', primaryColor, textColor),
                  _buildSkillChip('React', primaryColor, textColor),
                  _buildSkillChip('React Native', primaryColor, textColor),
                  _buildSkillChip('Next Js', primaryColor, textColor),
                  _buildSkillChip('Node Js', primaryColor, textColor),
                  _buildSkillChip('Golang', primaryColor, textColor),
                  _buildSkillChip('JavaScript', primaryColor, textColor),
                ],
              ),

              const SizedBox(height: 16),

              // Contact Section
              _buildSectionTitle('Get In Touch', textColor, primaryColor),

              const SizedBox(height: 20),

              // Social Links with better error handling
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSocialButton(
                    icon: Icons.email,
                    color: Colors.redAccent,
                    onPressed: () => _launchURL(_email),
                    tooltip: 'Email',
                  ),
                  const SizedBox(width: 20),
                  _buildSocialButton(
                    icon: Icons.link,
                    color: Colors.blue,
                    onPressed: () => _launchURL(_linkedInUrl),
                    tooltip: 'LinkedIn',
                  ),
                  const SizedBox(width: 20),
                  _buildSocialButton(
                    icon: Icons.facebook,
                    color: Colors.blue[800]!,
                    onPressed: () => _launchURL(_facebookUrl),
                    tooltip: 'Facebook',
                  ),
                ],
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, Color textColor, Color accentColor) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: textColor,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 80,
          height: 4,
          decoration: BoxDecoration(
            color: accentColor,
            borderRadius: BorderRadius.circular(4),
            gradient: LinearGradient(
              colors: [accentColor, accentColor.withOpacity(0.5)],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
    required String tooltip,
  }) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(50),
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _isDarkMode ? Colors.grey[800] : Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Center(child: Icon(icon, color: color, size: 28)),
        ),
      ),
    );
  }
}

Widget _buildSkillChip(String text, Color bgColor, Color textColor) {
  return Chip(
    label: Text(
      text,
      style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
    ),
    backgroundColor: bgColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  );
}
