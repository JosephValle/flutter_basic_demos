part of 'download_bloc.dart';

abstract class DownloadEvent extends Equatable {
  const DownloadEvent();
}

class DownloadImage extends DownloadEvent {
  final String imageUrl;
  final String userUrl;

  const DownloadImage(this.imageUrl, this.userUrl);

  @override
  List<Object?> get props => [imageUrl, userUrl];

}

class ResetDownload extends DownloadEvent {
  @override
  List<Object?> get props => [];
}
