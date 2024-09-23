import 'package:mangayomi/modules/more/settings/browse/providers/browse_state_provider.dart';
import 'package:mangayomi/services/fetch_sources_list.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'fetch_anime_sources.g.dart';

@riverpod
Future fetchAnimeSourcesList(FetchAnimeSourcesListRef ref,
    {int? id, required bool reFresh}) async {
  if (ref.watch(checkForExtensionsUpdateStateProvider) || reFresh) {
    await fetchSourcesList(
        defaultSourcesIndexUrl:
            "https://kodjodevf.github.io/mangayomi-extensions/anime_index.json",
        refresh: reFresh,
        id: id,
        ref: ref,
        isManga: false);
  }
}
