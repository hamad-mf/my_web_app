import 'package:flutter/material.dart';

void main() {
  runApp(const MyPortfolioApp());
}

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Portfolio',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 16),
          headlineSmall: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
      ),
      home: const PortfolioPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("👋 Hello, I'm", style: TextStyle(fontSize: 20)),
                const Text("Your Name",
                    style:
                        TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
                const Text("Flutter Developer",
                    style: TextStyle(fontSize: 24, color: Colors.tealAccent)),
                const SizedBox(height: 32),
                const Text("About Me",
                    style:
                        TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                const Text(
                    "I’m a passionate Flutter developer with experience building beautiful, fast, and functional mobile and web applications."),
                const SizedBox(height: 32),
                const Text("Skills",
                    style:
                        TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: const [
                    Chip(label: Text("Flutter")),
                    Chip(label: Text("Dart")),
                    Chip(label: Text("Firebase")),
                    Chip(label: Text("REST API")),
                    Chip(label: Text("Git")),
                    Chip(label: Text("UI/UX")),
                  ],
                ),
                const SizedBox(height: 32),
                const Text("Projects",
                    style:
                        TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                GridView.count(
                  crossAxisCount:
                      MediaQuery.of(context).size.width > 600 ? 2 : 1,
                  shrinkWrap: true,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  physics: const NeverScrollableScrollPhysics(),
                  children: List.generate(2, (index) {
                    return Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Project Title",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                            SizedBox(height: 8),
                            Text(
                                "A short description of the project goes here."),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 32),
                const Text("Contact",
                    style:
                        TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                const Text("📧 your.email@example.com"),
                const Text("🔗 github.com/yourusername"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
