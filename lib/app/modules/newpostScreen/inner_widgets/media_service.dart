import 'package:photo_manager/photo_manager.dart';

class MediaServices {
  Future loadAlbums(RequestType requestType) async {
    var permission = await PhotoManager.requestPermissionExtend();
    List<AssetPathEntity> albumList = [];

    if (permission.isAuth == true) {
      albumList = await PhotoManager.getAssetPathList(
        type: requestType,
      );
    } else {
      PhotoManager.openSetting();
    }
    return albumList;
  }

  static const int pageSize = 100;

  Future<List<AssetEntity>> loadAssets(AssetPathEntity selectedAlbum) async {
    List<AssetEntity> assetList = [];
    int page = 0;
    List<AssetEntity> pageAssets;

    do {
      pageAssets = await selectedAlbum.getAssetListPaged(
        page: page,
        size: pageSize,
      );
      assetList.addAll(pageAssets);
      page++;
    } while (pageAssets.isNotEmpty);

    return assetList;
  }
}
