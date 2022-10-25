part of 'download_bloc.dart';

abstract class DownloadEvent extends Equatable {
  const DownloadEvent();
}

class DownloadAssets extends DownloadEvent {
  final String imageUrl;
  final String userUrl;

  const DownloadAssets(this.imageUrl, this.userUrl);

  @override
  List<Object?> get props => [imageUrl, userUrl];

}

class ResetDownload extends DownloadEvent {
  @override
  List<Object?> get props => [];
}
