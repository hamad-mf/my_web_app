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
        primaryColor: Colors.blueAccent,
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 16),
          headlineSmall: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const HomePage(),
      routes: {
        '/about': (context) => const AboutPage(),
        '/projects': (context) => const ProjectsPage(),
        '/skills': (context) => const SkillsPage(),
        '/contact': (context) => const ContactPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hamad M F'),
        actions: [
          NavBarButton(title: 'Home', onPressed: () {}),
          NavBarButton(
            title: 'About',
            onPressed: () => Navigator.pushNamed(context, '/about'),
          ),
          NavBarButton(
            title: 'Skills',
            onPressed: () => Navigator.pushNamed(context, '/skills'),
          ),
          NavBarButton(
            title: 'Projects',
            onPressed: () => Navigator.pushNamed(context, '/projects'),
          ),
          NavBarButton(
            title: 'Contact',
            onPressed: () => Navigator.pushNamed(context, '/contact'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("👋 Hello, I'm",
                              style: TextStyle(fontSize: 20)),
                          const SizedBox(height: 8),
                          const Text("Hamad M F",
                              style: TextStyle(
                                  fontSize: 48, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          const Text("Flutter Developer",
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.w500)),
                          const SizedBox(height: 24),
                          const Text(
                              "I build beautiful, fast, and functional mobile and web applications using Flutter.",
                              style: TextStyle(fontSize: 18)),
                          const SizedBox(height: 32),
                          ElevatedButton(
                            child: Text('View My Projects',
                                style: TextStyle(fontSize: 16)),
                            onPressed: () =>
                                Navigator.pushNamed(context, '/projects'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    if (MediaQuery.of(context).size.width > 800)
                      Container(
                        width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Icon(Icons.person,
                              size: 120, color: Colors.blueAccent),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 80),
                const Center(
                  child: Text(
                    "Featured Skills",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 24),
                GridView.count(
                  crossAxisCount:
                      MediaQuery.of(context).size.width > 800 ? 3 : 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: const [
                    SkillCard(
                      icon: Icons.mobile_friendly,
                      title: "Flutter Development",
                      description: "Building cross-platform applications",
                    ),
                    SkillCard(
                      icon: Icons.storage,
                      title: "Firebase",
                      description: "Authentication and database integration",
                    ),
                    SkillCard(
                      icon: Icons.api,
                      title: "REST API",
                      description: "Working with RESTful APIs",
                    ),
                  ],
                ),
                const SizedBox(height: 80),
                const Center(
                  child: Text(
                    "Featured Projects",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 24),
                GridView.count(
                  crossAxisCount:
                      MediaQuery.of(context).size.width > 800 ? 2 : 1,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                  childAspectRatio: 1.5,
                  children: const [
                    ProjectCard(
                      title: "Medicart",
                      description: "A modern e-commerce application",
                      technologies: ["Flutter", "Firebase", "Provider"],
                    ),
                    ProjectCard(
                      title: "Real Chat",
                      description: "A productivity app for managing tasks",
                      technologies: ["Flutter", "SQLite", "Bloc"],
                    ),
                  ],
                ),
                const SizedBox(height: 80),
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "Let's work together!",
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "I'm currently available for freelance work and new opportunities.",
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, '/contact'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text('Contact Me',
                            style: TextStyle(fontSize: 16)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 60),
                const Footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Navigation Button Widget
class NavBarButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const NavBarButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16),
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
    );
  }
}

// Skill Card Widget
class SkillCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const SkillCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: Colors.blueAccent),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey.shade700),
            ),
          ],
        ),
      ),
    );
  }
}

// Project Card Widget
class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final List<String> technologies;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.technologies,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            const SizedBox(height: 12),
            Text(
              description,
              style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: technologies
                  .map((tech) => Chip(
                        label: Text(tech),
                        backgroundColor: Colors.blueAccent.withOpacity(0.1),
                        padding: const EdgeInsets.all(4),
                        labelStyle: const TextStyle(color: Colors.blueAccent),
                      ))
                  .toList(),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.visibility),
                label: const Text('View Project'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Footer Widget
class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("© 2025 Hamad M F",
                style: TextStyle(color: Colors.grey)),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.email),
                  onPressed: () {},
                  color: Colors.grey,
                ),
                IconButton(
                  icon: const Icon(Icons.code),
                  onPressed: () {},
                  color: Colors.grey,
                ),
                IconButton(
                  icon: const Icon(Icons.person),
                  onPressed: () {},
                  color: Colors.grey,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

// About Page
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Me'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          NavBarButton(
            title: 'Home',
            onPressed: () => Navigator.pushReplacementNamed(context, '/'),
          ),
          NavBarButton(
            title: 'About',
            onPressed: () {},
          ),
          NavBarButton(
            title: 'Skills',
            onPressed: () => Navigator.pushReplacementNamed(context, '/skills'),
          ),
          NavBarButton(
            title: 'Projects',
            onPressed: () =>
                Navigator.pushReplacementNamed(context, '/projects'),
          ),
          NavBarButton(
            title: 'Contact',
            onPressed: () =>
                Navigator.pushReplacementNamed(context, '/contact'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "About Me",
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 32),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (MediaQuery.of(context).size.width > 800)
                      Container(
                        width: 300,
                        height: 300,
                        margin: const EdgeInsets.only(right: 32),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Center(
                          child: Icon(Icons.person,
                              size: 120, color: Colors.blueAccent),
                        ),
                      ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Hi, I'm Hamad M F, a Flutter Developer",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            "I'm a passionate Flutter developer with experience building beautiful applications.",
                            style: TextStyle(fontSize: 16, height: 1.6),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            "With expertise in Flutter, Dart, Firebase and more.",
                            style: TextStyle(fontSize: 16, height: 1.6),
                          ),
                          const SizedBox(height: 24),
                          Container(
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Education & Experience",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 16),
                                _buildExperienceItem(
                                  "Senior Flutter Developer",
                                  "Tech Solutions Inc.",
                                  "2023 - Present",
                                ),
                                const SizedBox(height: 12),
                                _buildExperienceItem(
                                  "Flutter Developer",
                                  "Mobile Apps Co.",
                                  "2020 - 2023",
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 48),
                const Text(
                  "Why I Love Flutter",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                GridView.count(
                  crossAxisCount:
                      MediaQuery.of(context).size.width > 800 ? 3 : 1,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.5,
                  children: const [
                    _ReasonCard(
                      icon: Icons.speed,
                      title: "Fast Development",
                      description: "Hot reload feature allows quick iterations",
                    ),
                    _ReasonCard(
                      icon: Icons.devices,
                      title: "Cross-Platform",
                      description: "One codebase for multiple platforms",
                    ),
                    _ReasonCard(
                      icon: Icons.brush,
                      title: "Beautiful UI",
                      description:
                          "Customizable widgets for stunning interfaces",
                    ),
                  ],
                ),
                const SizedBox(height: 60),
                const Footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildExperienceItem(String title, String company, String period) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.circle, size: 12, color: Colors.blueAccent),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(company, style: const TextStyle(fontSize: 14)),
              Text(
                period,
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                    fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ReasonCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _ReasonCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 36, color: Colors.blueAccent),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey.shade700),
            ),
          ],
        ),
      ),
    );
  }
}

// Skills Page
class SkillsPage extends StatelessWidget {
  const SkillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Skills'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          NavBarButton(
            title: 'Home',
            onPressed: () => Navigator.pushReplacementNamed(context, '/'),
          ),
          NavBarButton(
            title: 'About',
            onPressed: () => Navigator.pushReplacementNamed(context, '/about'),
          ),
          NavBarButton(
            title: 'Skills',
            onPressed: () {},
          ),
          NavBarButton(
            title: 'Projects',
            onPressed: () =>
                Navigator.pushReplacementNamed(context, '/projects'),
          ),
          NavBarButton(
            title: 'Contact',
            onPressed: () =>
                Navigator.pushReplacementNamed(context, '/contact'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "My Skills",
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Here are the technologies and tools I work with:",
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 48),
                const Text(
                  "Technical Skills",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 32),
                GridView.count(
                  crossAxisCount:
                      MediaQuery.of(context).size.width > 800 ? 3 : 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.2,
                  children: const [
                    SkillCard(
                      icon: Icons.flutter_dash,
                      title: "Flutter",
                      description: "Expert level with 4+ years experience",
                    ),
                    SkillCard(
                      icon: Icons.code,
                      title: "Dart",
                      description: "Advanced knowledge of Dart",
                    ),
                    SkillCard(
                      icon: Icons.storage,
                      title: "Firebase",
                      description: "Authentication, Firestore, Functions",
                    ),
                  ],
                ),
                const SizedBox(height: 48),
                const Text(
                  "Tools & Platforms",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    _buildToolChip("Git"),
                    _buildToolChip("GitHub"),
                    _buildToolChip("Android Studio"),
                    _buildToolChip("VS Code"),
                  ],
                ),
                const SizedBox(height: 48),
                _buildSkillBar("Flutter", 0.95),
                const SizedBox(height: 16),
                _buildSkillBar("Dart", 0.92),
                const SizedBox(height: 16),
                _buildSkillBar("Firebase", 0.85),
                const SizedBox(height: 48),
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "Looking for Flutter development help?",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "I'm available for freelance projects and collaborations.",
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, '/contact'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 16),
                        ),
                        child: const Text('Contact Me'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 60),
                const Footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildToolChip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.blueAccent.withOpacity(0.1),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      labelStyle: const TextStyle(color: Colors.blueAccent),
    );
  }

  Widget _buildSkillBar(String skill, double proficiency) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              skill,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              "${(proficiency * 100).toInt()}%",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Stack(
          children: [
            Container(
              height: 10,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            FractionallySizedBox(
              widthFactor: proficiency,
              child: Container(
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// Projects Page
class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Projects'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          NavBarButton(
            title: 'Home',
            onPressed: () => Navigator.pushReplacementNamed(context, '/'),
          ),
          NavBarButton(
            title: 'About',
            onPressed: () => Navigator.pushReplacementNamed(context, '/about'),
          ),
          NavBarButton(
            title: 'Skills',
            onPressed: () => Navigator.pushReplacementNamed(context, '/skills'),
          ),
          NavBarButton(
            title: 'Projects',
            onPressed: () {},
          ),
          NavBarButton(
            title: 'Contact',
            onPressed: () =>
                Navigator.pushReplacementNamed(context, '/contact'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "My Projects",
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Here are some of the projects I've worked on:",
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 48),
                const Text(
                  "Featured Projects",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),
                MediaQuery.of(context).size.width > 800
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: DetailedProjectCard(
                              title: "E-Commerce App",
                              description:
                                  "A full-featured shopping app with payment integration",
                              technologies: [
                                "Flutter",
                                "Firebase",
                                "Provider",
                                "Stripe"
                              ],
                              features: [
                                "User authentication",
                                "Product browsing",
                                "Shopping cart",
                                "Secure payments"
                              ],
                              imagePlaceholder: Icons.shopping_bag,
                            ),
                          ),
                          const SizedBox(width: 24),
                          Expanded(
                            child: DetailedProjectCard(
                              title: "Task Manager",
                              description:
                                  "A productivity app for managing daily tasks",
                              technologies: ["Flutter", "SQLite", "Bloc"],
                              features: [
                                "Task organization",
                                "Due dates and reminders",
                                "Progress tracking",
                                "Theme support"
                              ],
                              imagePlaceholder: Icons.task_alt,
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          DetailedProjectCard(
                            title: "E-Commerce App",
                            description:
                                "A full-featured shopping app with payment integration",
                            technologies: [
                              "Flutter",
                              "Firebase",
                              "Provider",
                              "Stripe"
                            ],
                            features: [
                              "User authentication",
                              "Product browsing",
                              "Shopping cart",
                              "Secure payments"
                            ],
                            imagePlaceholder: Icons.shopping_bag,
                          ),
                          const SizedBox(height: 24),
                          DetailedProjectCard(
                            title: "Task Manager",
                            description:
                                "A productivity app for managing daily tasks",
                            technologies: ["Flutter", "SQLite", "Bloc"],
                            features: [
                              "Task organization",
                              "Due dates and reminders",
                              "Progress tracking",
                              "Theme support"
                            ],
                            imagePlaceholder: Icons.task_alt,
                          ),
                        ],
                      ),
                const SizedBox(height: 48),
                const Text(
                  "Client Projects",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildClientProject(
                      "Health & Fitness App",
                      "FitLife Inc.",
                      "Developed a comprehensive fitness application",
                      "2024",
                    ),
                    const SizedBox(height: 16),
                    _buildClientProject(
                      "Restaurant Ordering System",
                      "Foodie Chain",
                      "Built a multi-restaurant food ordering system",
                      "2023",
                    ),
                  ],
                ),
                const SizedBox(height: 48),
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "Interested in working together?",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "I'm currently taking on new projects.",
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, '/contact'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text('Contact Me',
                            style: TextStyle(fontSize: 16)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 60),
                const Footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildClientProject(
      String title, String client, String description, String year) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.blueAccent.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Icon(Icons.work, color: Colors.blueAccent, size: 30),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        client,
                        style: TextStyle(
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 4,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        year,
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(description, style: const TextStyle(fontSize: 14)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailedProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final List<String> technologies;
  final List<String> features;
  final IconData imagePlaceholder;

  const DetailedProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.technologies,
    required this.features,
    required this.imagePlaceholder,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Icon(imagePlaceholder,
                        size: 40, color: Colors.blueAccent),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        description,
                        style: TextStyle(
                            fontSize: 14, color: Colors.grey.shade700),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Key Features:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: features
                  .map((feature) => Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.check_circle,
                                color: Colors.green, size: 16),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(feature,
                                  style: const TextStyle(fontSize: 14)),
                            ),
                          ],
                        ),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 16),
            const Text(
              "Technologies:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: technologies
                  .map((tech) => Chip(
                        label: Text(tech),
                        backgroundColor: Colors.blueAccent.withOpacity(0.1),
                        padding: const EdgeInsets.all(4),
                        labelStyle: const TextStyle(color: Colors.blueAccent),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.visibility),
                label: const Text('View Details'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Contact Page
class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Me'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          NavBarButton(
            title: 'Home',
            onPressed: () => Navigator.pushReplacementNamed(context, '/'),
          ),
          NavBarButton(
            title: 'About',
            onPressed: () => Navigator.pushReplacementNamed(context, '/about'),
          ),
          NavBarButton(
            title: 'Skills',
            onPressed: () => Navigator.pushReplacementNamed(context, '/skills'),
          ),
          NavBarButton(
            title: 'Projects',
            onPressed: () =>
                Navigator.pushReplacementNamed(context, '/projects'),
          ),
          NavBarButton(
            title: 'Contact',
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Contact Me",
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Have a project in mind or want to discuss an opportunity?",
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 48),
                MediaQuery.of(context).size.width > 800
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 3,
                            child: _buildContactForm(),
                          ),
                          const SizedBox(width: 48),
                          Expanded(
                            flex: 2,
                            child: _buildContactInfo(),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          _buildContactForm(),
                          const SizedBox(height: 48),
                          _buildContactInfo(),
                        ],
                      ),
                const SizedBox(height: 60),
                const Footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContactForm() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Send me a message",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Name",
                hintText: "Enter your name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                prefixIcon: const Icon(Icons.person_outline),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Email",
                hintText: "Enter your email address",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                prefixIcon: const Icon(Icons.email_outlined),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Subject",
                hintText: "Enter the subject",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                prefixIcon: const Icon(Icons.subject),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Message",
                hintText: "Enter your message here",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                alignLabelWithHint: true,
              ),
              maxLines: 5,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Send Message',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Contact Information",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 24),
        _buildContactItem(
          Icons.email,
          "Email",
          "hamad@example.com",
        ),
        const SizedBox(height: 16),
        _buildContactItem(
          Icons.phone,
          "Phone",
          "+1 234 567 8900",
        ),
        const SizedBox(height: 16),
        _buildContactItem(
          Icons.location_on,
          "Location",
          "New York, USA",
        ),
        const SizedBox(height: 32),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.blueAccent.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Social Media",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildSocialButton(Icons.code, "GitHub"),
                  _buildSocialButton(Icons.person_outline, "LinkedIn"),
                  _buildSocialButton(Icons.create, "Medium"),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        const Text(
          "Working Hours",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        const Text(
          "Monday - Friday: 9:00 AM - 6:00 PM",
          style: TextStyle(fontSize: 14),
        ),
        const SizedBox(height: 4),
        Text(
          "Weekend: Available for urgent inquiries",
          style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
        ),
      ],
    );
  }

  Widget _buildContactItem(IconData icon, String title, String content) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.blueAccent.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: Colors.blueAccent),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              content,
              style: TextStyle(color: Colors.grey.shade700),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialButton(IconData icon, String platform) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(icon, size: 24),
          style: IconButton.styleFrom(
            backgroundColor: Colors.white,
            padding: const EdgeInsets.all(12),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          platform,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
