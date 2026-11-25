import 'package:material_ui/material_ui.dart';
import 'package:myportofolio_mobile/screens/experience_form.dart';
import 'package:myportofolio_mobile/screens/menu.dart';
import 'package:myportofolio_mobile/screens/project_form.dart';
import 'package:myportofolio_mobile/screens/project_list_screen.dart';
import 'package:myportofolio_mobile/services/auth_state.dart';
import 'package:myportofolio_mobile/widgets/auth_guard.dart';
import 'package:provider/provider.dart';

class ItemCard extends StatelessWidget {
  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final bool isLightCard = item.color == colorScheme.tertiary;
    final Color foregroundColor = isLightCard ? colorScheme.primary : Colors.white;

    return Material(
      color: item.color,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () async {
          final messenger = ScaffoldMessenger.of(context);
          final navigator = Navigator.of(context);

          if (item.name == "Lihat Proyek") {
            navigator.push(
              MaterialPageRoute(
                builder: (context) => const ProjectListScreen(),
              ),
            );
          } else if (item.name == "Tambah Proyek") {
            final ok = await ensureLoggedIn(context);
            if (!ok) return;
            navigator.push(
              MaterialPageRoute(
                builder: (context) => const ProjectFormPage(),
              ),
            );
          } else if (item.name == "Tambah Experience") {
            navigator.push(
              MaterialPageRoute(
                builder: (context) => const ExperienceFormPage(),
              ),
            );
          } else if (item.name == "Logout") {
            await context.read<AuthState>().logout();
            messenger
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  backgroundColor: colorScheme.primary,
                  content: Text(
                    "Berhasil logout!",
                    style: TextStyle(color: colorScheme.surface),
                  ),
                ),
              );
          } else {
            messenger
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  backgroundColor: colorScheme.primary,
                  content: Text(
                    "Kamu telah menekan tombol ${item.name}!",
                    style: TextStyle(color: colorScheme.surface),
                  ),
                ),
              );
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: foregroundColor,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: foregroundColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}