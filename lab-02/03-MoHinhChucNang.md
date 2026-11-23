# Lab 02 — Thực hành 3: Mô hình hóa chức năng

Phần này kế thừa phạm vi đăng ký bổ sung của sinh viên K52 và mục tiêu **UN-03**. Chức năng hệ thống (System Function) là một phần việc hệ thống thực hiện. Ví dụ, **Gửi đăng ký bổ sung** là mục tiêu tương tác của sinh viên trong `UC02`, còn **Kiểm tra trùng lịch** là một chức năng hệ thống thực hiện để hỗ trợ mục tiêu đó. [Hồ sơ yêu cầu Thực hành 2](02-MoHinhYeuCau.md) · [Đầu ra bắt buộc của Thực hành 3](../docs/Lab02_OOAD.md#nhiệm-vụ-thực-hành-3-functional-modeling)

## 1. Cây phân rã chức năng

Cây cho thấy các chức năng được nhóm theo mục đích. Có bốn nhóm và **13 chức năng cấp lá** có mã từ `F01` đến `F13`. Trình tự thực hiện và các nhánh xem ở mô tả Use Case và bảng đối chiếu cuối tài liệu.

```text
Hệ thống đăng ký bổ sung học phần
├── Tra cứu lớp
│   ├── F01 Liệt kê lớp mở
│   └── F02 Hiển thị lịch theo mã lớp
├── Chọn lớp và kiểm tra
│   ├── F03 Tiếp nhận mã lớp được chọn
│   ├── F04 Kiểm tra trùng lịch
│   ├── F05 Kiểm tra điều kiện tiên quyết
│   ├── F06 Kiểm tra giới hạn tín chỉ
│   └── F07 Thông báo lý do lựa chọn chưa hợp lệ
├── Gửi và xác nhận đăng ký
│   ├── F08 Hiển thị phương án để sinh viên rà soát
│   ├── F09 Tiếp nhận đăng ký hợp lệ khi đợt còn mở
│   ├── F10 Kiểm tra chỗ tại thời điểm xác nhận
│   └── F11 Ghi nhận kết quả theo từng lớp
└── Tra cứu kết quả
    ├── F12 Truy xuất và hiển thị kết quả theo mã lớp
    └── F13 Gợi ý lớp thay thế
```

## 2. Danh mục chức năng

**FR** là yêu cầu chức năng, nêu hệ thống phải làm gì. **NFR** là yêu cầu phi chức năng, nêu chất lượng cần đạt khi thực hiện. Một chức năng có thể hỗ trợ nhiều yêu cầu. Chẳng hạn, `F12` vừa cung cấp kết quả theo lớp, vừa giúp sinh viên đọc đúng kết quả của từng lớp.

| Mã | Tên chức năng | Mục đích | Hành vi chính | Yêu cầu liên quan | Use Case |
| --- | --- | --- | --- | --- | --- |
| F01 | Liệt kê lớp mở | Giúp sinh viên tìm lớp để cân nhắc. | Cung cấp danh sách lớp mở trong đợt điều chỉnh theo mã lớp. | FR01 | UC01 |
| F02 | Hiển thị lịch theo mã lớp | Cung cấp dữ kiện để sinh viên đối chiếu lịch. | Hiển thị lịch học tương ứng với mã lớp được tra cứu. | FR01 | UC01 |
| F03 | Tiếp nhận mã lớp được chọn | Xác định phương án cần kiểm tra. | Nhận các mã lớp sinh viên chọn để chuyển sang kiểm tra lịch và điều kiện. | FR02 | UC02 |
| F04 | Kiểm tra trùng lịch | Phát hiện xung đột thời gian. | Đối chiếu lựa chọn với lịch hiện có và các lớp khác trong cùng lựa chọn. Dùng khi chọn lớp và khi cần kiểm tra lại để xác nhận. | FR02, FR05 | UC02 |
| F05 | Kiểm tra điều kiện tiên quyết | Xác định sinh viên có đáp ứng điều kiện của học phần được chọn. | Đối chiếu dữ liệu học tập với quy tắc tiên quyết đã thiết lập khi chọn lớp và khi cần kiểm tra lại để xác nhận. | FR02, FR05 | UC02 |
| F06 | Kiểm tra giới hạn tín chỉ | Xác định phương án có nằm trong giới hạn áp dụng. | Đối chiếu tổng tín chỉ của phương án với giới hạn áp dụng cho sinh viên khi chọn lớp và khi cần kiểm tra lại để xác nhận. | FR02, FR05 | UC02 |
| F07 | Thông báo lý do lựa chọn chưa hợp lệ | Giúp sinh viên hiểu vì sao lựa chọn chưa thể gửi. | Theo `TO-06`, chỉ thông báo lý do trùng lịch hoặc thiếu điều kiện trước khi gửi. Sinh viên tự quay lại tra cứu nếu đợt còn mở và muốn điều chỉnh. | FR03 | UC02 |
| F08 | Hiển thị phương án để sinh viên rà soát | Giúp sinh viên kiểm tra các mã lớp trước khi gửi. | Hiển thị danh sách lớp trong phương án được chọn để sinh viên rà soát. | FR04 | UC02 |
| F09 | Tiếp nhận đăng ký hợp lệ khi đợt còn mở | Ghi nhận việc gửi phương án hợp lệ. | Tiếp nhận khi phương án hợp lệ và đợt còn mở. Phương án còn lỗi hoặc gửi sau khi đợt đóng không tạo yêu cầu mới. Thông tin đã gửi được thể hiện riêng với kết quả xác nhận. | FR04, NFR01 | UC02 |
| F10 | Kiểm tra chỗ tại thời điểm xác nhận | Xác định lớp còn khả năng tiếp nhận sinh viên. | Kiểm tra chỗ của từng lớp tại thời điểm xác nhận và cung cấp kết quả kiểm tra cho `F11`. | FR05 | UC02 |
| F11 | Ghi nhận kết quả theo từng lớp | Tạo căn cứ để sinh viên biết lớp nào đã được xác nhận. | Gắn kết quả với từng mã lớp. Chỉ ghi **Thành công** khi lớp đáp ứng điều kiện, lịch không trùng và còn chỗ tại thời điểm xác nhận. Ghi **Hết chỗ** nếu lớp bị từ chối vì đã đầy. | FR05, NFR02 | UC02 xử lý xác nhận. UC03 dùng kết quả làm nguồn tra cứu. |
| F12 | Truy xuất và hiển thị kết quả theo mã lớp | Giúp sinh viên biết trạng thái của từng lớp. | Hiển thị đúng mã lớp và kết quả đã ghi ở `F11`. Nếu yêu cầu đã gửi nhưng lớp chưa có kết quả, thể hiện lớp chưa được xác nhận. | FR06, NFR01, NFR02 | UC03 |
| F13 | Gợi ý lớp thay thế | Giúp sinh viên tìm phương án sau kết quả Hết chỗ. | Khi đợt còn mở và sinh viên muốn điều chỉnh, lọc lớp khác cùng học phần theo chỗ hiện tại, lịch và điều kiện đăng ký của phương án thay thế. Hiển thị mã lớp và lịch, hoặc thông báo chưa có lớp phù hợp. | FR07 | UC03 |

## 3. Ánh xạ yêu cầu và ma trận truy vết

### 3.1. Ánh xạ yêu cầu hệ thống → chức năng

| Yêu cầu | Chức năng hỗ trợ | Cách đáp ứng |
| --- | --- | --- |
| FR01 | F01, F02 | Cung cấp lớp mở và lịch học theo mã. |
| FR02 | F03, F04, F05, F06 | Tiếp nhận lựa chọn và kiểm tra lịch, tiên quyết, giới hạn tín chỉ. |
| FR03 | F07 | Thông báo lý do lựa chọn chưa hợp lệ trước khi gửi. |
| FR04 | F08, F09 | Cho rà soát và tiếp nhận phương án hợp lệ trong thời gian đợt mở. |
| FR05 | F04, F05, F06, F10, F11 | Kiểm tra điều kiện, lịch và chỗ khi xác nhận, rồi ghi kết quả từng lớp. |
| FR06 | F12 | Truy xuất và hiển thị đúng kết quả từng lớp để sinh viên tra cứu. |
| FR07 | F13 | Tìm và hiển thị lớp thay thế phù hợp tại thời điểm tra cứu. |
| NFR01 | F09, F12 | Phân biệt mốc đã gửi với kết quả xác nhận từng lớp. |
| NFR02 | F11, F12 | Đối chiếu kết quả hiển thị với kết quả đã ghi theo cùng mã lớp và yêu cầu. |

### 3.2. Ma trận tổng hợp BR → yêu cầu hệ thống → Use Case → chức năng

**BR (Business Requirement)** là kết quả nghiệp vụ cần đạt. Ma trận giữ các liên kết BR, FR/NFR và Use Case của Thực hành 2, rồi chỉ ra chức năng nào hỗ trợ từng Use Case. Một yêu cầu có thể dùng các chức năng khác nhau tùy vai trò của Use Case. Ví dụ, `UC03` đọc kết quả từ `F11` thông qua `F12`. [Ma trận nguồn của Thực hành 2](02-MoHinhYeuCau.md#5-ma-trận-truy-vết)

| BR | Yêu cầu hệ thống | Use Case | Chức năng tương ứng |
| --- | --- | --- | --- |
| BR1 | FR01 | UC01 | FR01 → F01, F02 |
| BR1 | FR02, FR03, FR04 | UC02 | FR02 → F03, F04, F05, F06. FR03 → F07. FR04 → F08, F09. |
| BR2 | FR05, FR06, NFR01, NFR02 | UC03 | FR05 → F11 (nguồn kết quả). FR06 → F12. NFR01 → F12. NFR02 → F11, F12. |
| BR2 | NFR01, NFR02 | UC02 | NFR01 → F09 (ghi nhận đã gửi). NFR02 → F11 (ghi kết quả theo mã lớp). |
| BR3 | FR02, FR03 | UC02 | FR02 → F03, F04, F05, F06. FR03 → F07. Tác động giảm lượt cán bộ rà soát lại là `[Assumption]`. |
| BR4 | FR01 | UC01 | FR01 → F01, F02 |
| BR4 | FR02, FR03, FR04, FR05 | UC02 | FR02 → F03, F04, F05, F06. FR03 → F07. FR04 → F08, F09. FR05 → F04, F05, F06, F10, F11. |
| BR4 | FR05, FR06, NFR02 | UC03 | FR05 → F11 (nguồn kết quả). FR06 → F12. NFR02 → F11, F12. |
| BR2, BR4 | FR07 | UC03 | FR07 → F13. Khi sinh viên chọn lớp, UC02 tiếp tục kiểm tra và tiếp nhận theo FR02–FR05. |

## 4. Điểm cần xác minh

| Câu hỏi cần làm rõ | Chức năng hoặc yêu cầu bị ảnh hưởng | Bên cần xác minh | Trạng thái |
| --- | --- | --- | --- |
| Dùng dữ liệu học tập và phiên bản quy tắc nào để xác định sinh viên đã đạt điều kiện tiên quyết của học phần được chọn? | F05, FR02, FR05 | Phòng Đào tạo, phối hợp đơn vị phụ trách học phần | Chưa xác minh. |
| Tín chỉ nào được tính vào tổng và giới hạn nào áp dụng trong đợt đối với từng sinh viên? | F06, FR02, FR05 | Phòng Đào tạo | Chưa xác minh. |
| Kết quả của từng lớp được xác nhận khi nào sau khi gửi và khi nào sinh viên có thể tra cứu? | F09–F12, FR04–FR06 | Phòng Đào tạo và đầu mối vận hành hệ thống đăng ký | Chưa xác minh thời điểm xử lý nội bộ. |
| Nếu lịch hoặc điều kiện học phần thay đổi sau khi gửi nhưng trước khi xác nhận, hệ thống ghi và hiển thị kết quả nào? | F04–F06, F11, F12, FR05, FR06 | Phòng Đào tạo và đầu mối vận hành hệ thống đăng ký | Chưa xác minh cách biểu diễn kết quả. FR05 vẫn yêu cầu đủ điều kiện để xác nhận **Thành công**. |
| Cán bộ có thực sự rà soát lại do trùng lịch hoặc thiếu điều kiện không? Có hồ sơ nào cho biết số lượt và số phút phát sinh? | F04–F07, BR3 | Phòng Đào tạo | `[Assumption]` về tác động giảm công rà soát. Mức giảm **chưa đo được**. |

Chuyển các câu hỏi còn mở sang Lab 03 cùng mã chức năng liên quan để nhóm nhận biết dữ liệu, khái niệm miền và luồng cần làm rõ.

## Đối chiếu trước khi bàn giao

Các ca sau dùng để rà độ bao phủ của **bản đặc tả**. Kết quả thử nghiệm với người dùng hoặc hệ thống cần được ghi khi có dữ liệu.

| Tình huống | Chức năng đối chiếu | Kết quả mong đợi |
| --- | --- | --- |
| Chưa tìm được lớp để chọn | F01, F02 | Sinh viên có thể dừng sau khi tra cứu. Chưa có yêu cầu được gửi. |
| Trùng lịch khi chọn lớp | F04, F07, F09 | Thông báo đúng lý do trùng lịch. Phương án còn lỗi chưa được tiếp nhận. |
| Thiếu tiên quyết hoặc vượt giới hạn tín chỉ | F05, F06, F07, F09 | Rà từng nguyên nhân riêng. Thông báo đúng điều kiện vi phạm. Phương án còn lỗi chưa được tiếp nhận. |
| Đợt đóng trước lúc gửi | F08, F09 | Phương án đã rà soát nhưng thao tác gửi không tạo yêu cầu mới. |
| Đã gửi và chưa có kết quả | F09, F12 | Sinh viên thấy yêu cầu đã gửi và lớp chưa được xác nhận. |
| Cùng một yêu cầu có một lớp hợp lệ còn chỗ và một lớp hợp lệ đã hết chỗ tại thời điểm xác nhận | F04–F06, F10–F12 | Hai mã lớp lần lượt hiển thị **Thành công** và **Hết chỗ**. Chỉ lớp hết chỗ dẫn đến nhánh gợi ý nếu đợt còn mở và sinh viên muốn điều chỉnh. |
| Có lớp thay thế | F13, F03–F06, F09–F11 | Với A hết chỗ, chỉ gợi ý B cùng học phần, còn chỗ, đủ điều kiện và vừa lịch. Loại lớp khác học phần, đầy, trùng lịch hoặc vi phạm điều kiện. Nếu B đầy sau khi được gợi ý, lần xác nhận mới trả Hết chỗ. |
| Không có lớp thay thế | F13 | Thông báo chưa tìm được lớp phù hợp tại thời điểm tra cứu. Không tạo yêu cầu mới. |
| Đợt đã đóng hoặc sinh viên đang chờ kết quả | F12, F13 | Sinh viên xem trạng thái hiện có. Nhánh gợi ý chưa được kích hoạt. |
| Đo hoàn thành UN-03 | F04, F10–F12 | Chỉ tính đạt theo BR4 khi trước hạn sinh viên có lịch không trùng và được xác nhận vào lớp còn chỗ. Với yêu cầu nhiều lớp, đối chiếu kết quả theo mã lớp. |
| Kiểm tra khả năng sử dụng và tính nhất quán | F09, F11, F12 | Với NFR01, yêu cầu sinh viên giải thích trạng thái của từng lớp và phân biệt đã gửi với đã xác nhận. Với NFR02, đối chiếu từng mã lớp và kết quả hiển thị với kết quả đã ghi. |

Trước khi bàn giao, đối chiếu mã trên cây với danh mục, kiểm tra từng FR/NFR có chức năng hỗ trợ và kiểm tra ma trận bao phủ cả `BR1`–`BR4` lẫn `UC01`–`UC03`. [Quy trình TO-BE](01-MoHinhNghiepVu.md) · [Checklist cuối Lab 02](../docs/Lab02_OOAD.md#danh-mục-hồ-sơ-deliverables-bài-thực-hành-2)
