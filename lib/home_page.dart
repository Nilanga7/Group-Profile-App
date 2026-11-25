import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth_service.dart';
import 'favourites_controller.dart';
import 'member.dart';
import 'member_registry.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> _logout(BuildContext context) async {
    context.read<FavouritesController>().clear();
    await AuthService().signOut();
  }

  @override
  Widget build(BuildContext context) {
    final user = AuthService().currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Our Team'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Log out',
            onPressed: () => _logout(context),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
            child: Text(
              'Signed in as ${user?.email ?? 'unknown'}  ·  '
              '$filledSlotCount of ${memberSlots.length} members added',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 6,
                crossAxisSpacing: 6,
                childAspectRatio: 0.8,
              ),
              itemCount: memberSlots.length,
              itemBuilder: (context, index) {
                final entry = memberSlots[index];
                if (entry == null) {
                  return _EmptySlotTile(slotNumber: index + 1);
                }
                return _MemberTile(entry: entry);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _MemberTile extends StatelessWidget {
  const _MemberTile({required this.entry});

  final MemberEntry entry;

  @override
  Widget build(BuildContext context) {
    final member = entry.member;
    final isFavourite =
        context.watch<FavouritesController>().isFavourite(member.id);

    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => entry.screen),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              Expanded(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      CircleAvatar(
                        radius: 100,
                        backgroundColor: entry.accent,
                        child: CircleAvatar(
                          radius: 93,
                          backgroundImage: AssetImage(member.photo),
                        ),
                      ),
                      if (isFavourite)
                        const Positioned(
                          right: -2,
                          bottom: -2,
                          child: CircleAvatar(
                            radius: 9,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.favorite,
                              size: 12,
                              color: Colors.redAccent,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 3),
              Text(
                member.fullName,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  height: 5,
                  fontWeight: FontWeight.bold,
                  color: entry.accent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmptySlotTile extends StatelessWidget {
  const _EmptySlotTile({required this.slotNumber});

  final int slotNumber;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      color: colors.surfaceContainerHighest,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: colors.outlineVariant, width: 1.2),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Member $slotNumber has not added a bio yet.'),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              Expanded(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: CircleAvatar(
                    radius: 100,
                    backgroundColor: colors.surface,
                    child: Icon(
                      Icons.person_add_alt_1,
                      size: 93,
                      color: colors.outline,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 3),
              Text(
                'Member $slotNumber',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 18, color: colors.outline),
              ),
            ],
          ),
        ),
      ),
    );
  }
}