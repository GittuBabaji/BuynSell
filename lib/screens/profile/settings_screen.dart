import 'package:flutter/material.dart';

/// Screen displaying application settings and account management options.
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Connect settings values to SettingsProvider / SharedPreferences
    const bool notificationsEnabled = true;
    const bool darkModeEnabled = false;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Preferences',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 8),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                SwitchListTile(
                  secondary: const Icon(Icons.notifications_outlined),
                  title: const Text('Push Notifications'),
                  subtitle: const Text('Get alerts for messages and deal updates'),
                  value: notificationsEnabled,
                  onChanged: (bool value) {
                    // TODO: Toggle notifications state
                  },
                ),
                const Divider(height: 1),
                SwitchListTile(
                  secondary: const Icon(Icons.dark_mode_outlined),
                  title: const Text('Dark Mode'),
                  subtitle: const Text('Enable dark theme interface'),
                  value: darkModeEnabled,
                  onChanged: (bool value) {
                    // TODO: Toggle theme mode
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.language),
                  title: const Text('App Language'),
                  subtitle: const Text('English'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // TODO: Change app language
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          const Text(
            'Account & Security',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 8),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.security),
                  title: const Text('Privacy & Security'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // TODO: Open privacy policy / security options
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.orange),
                  title: const Text(
                    'Logout',
                    style: TextStyle(color: Colors.orange, fontWeight: FontWeight.w600),
                  ),
                  onTap: () {
                    // TODO: Perform logout procedure
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.delete_forever, color: Colors.red),
                  title: const Text(
                    'Delete Account',
                    style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text('Permanently remove your profile and listings'),
                  onTap: () {
                    // TODO: Show confirm delete dialog
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          Center(
            child: Text(
              'BuyNSell IIT BHU v1.0.0',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
