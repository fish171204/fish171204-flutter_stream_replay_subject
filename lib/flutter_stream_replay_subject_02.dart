import 'package:rxdart/rxdart.dart';

void main(List<String> args) async {
  demoReplaySubject();
}

void demoReplaySubject() {
  var subject = ReplaySubject<int>();

  // listener lan 1
  subject.listen((value) {
    print(value);
  });

  subject.add(0);
  subject.add(1);
  subject.add(2);

  // listener lan 2
  subject.listen((value) {
    print("SECOND >>>> $value");
  });

  subject.add(3);
  subject.add(4);
  subject.add(5);
  subject.add(6);

  // Các sự kiện vẫn tiếp tục chạy trong event loop, dẫn đến thứ tự output khác biệt
}

// ReplaySubject là một loại StreamController đặc biệt trong RxDart có khả năng lưu lại toàn bộ giá trị đã phát trước đó.
// PublishSubject Khi có một subscriber mới, nó sẽ nhận được tất cả các giá trị mà Subject đã phát trước đó (khác với PublishSubject).
// Khi thêm giá trị mới, tất cả subscribers sẽ nhận được nó ngay lập tức.

// 🚀 Khi nào cần lưu lại toàn bộ dữ liệu đã phát và gửi nó cho subscriber mới.
// Lịch sử chat: Khi mở ứng dụng chat, bạn muốn tải lại toàn bộ tin nhắn trước đó.
// Log sự kiện: Ghi lại toàn bộ sự kiện trong hệ thống để truy xuất sau.
// Tình trạng kết nối nhiều người dùng: Khi user mới vào nhóm, họ cần thấy danh sách người đã tham gia trước đó.
