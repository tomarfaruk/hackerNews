import 'package:get/get.dart';
import 'package:hacker_new/model/story_model.dart';
import 'package:hacker_new/service/api_service.dart';

class TopNewsController extends GetxController {
  ApiService _apiService = ApiService();

  String storyIdUrl =
      "https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty";

  var _loading = false.obs;
  bool get loading => _loading.value;
  set loaging(bool b) => _loading.value = b;

  List<StoryModel> get articles => storys.value;

  List<int> storyIds = List<int>();
  final storys = <StoryModel>[].obs;

  Future fetchStoryIds() async {
    storyIds = (await _apiService.get(url: storyIdUrl)).cast<int>();
    print(storyIds);
  }

  Future<StoryModel> getSingleStory(int id) async {
    try {
      String storyUrl = "https://hn.algolia.com/api/v1/items/$id";

      final response = await _apiService.get(url: storyUrl);
      StoryModel _story = StoryModel.fromJson(response);
      print(_story?.author);
      return _story;
    } catch (e) {
      print(e.toString());
    }
  }

  Future getAllStory() async {
    final futureArticals = storyIds.take(30).map((id) => getSingleStory(id));

    final articals = Future.wait(futureArticals);

    final getarticles = (await articals).where((e) => e != null).toList();
    storys.value = getarticles;

    print("end: ${articals}");
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    try {
      await fetchStoryIds();
      // await getSingleStory(24942812);
      await getAllStory();
    } catch (e) {
      print(e.toString());
    }
    _loading.value = true;
  }
}
