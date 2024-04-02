import 'package:pocketbase/pocketbase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

@Riverpod(keepAlive: true)
PocketBase pocketBase(PocketBaseRef ref) => PocketBase('https://personal-pocketbase.5rj6sc.easypanel.host');
