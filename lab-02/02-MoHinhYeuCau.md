# Lab 02 — Thực hành 2: Mô hình hóa yêu cầu

Bước 1 kế thừa nhu cầu **UN-03**, bốn điểm nghẽn `PP-01`–`PP-04` và quy trình đề xuất `TO-01`–`TO-06`. Các bước vận hành và điểm nghẽn lịch sử chưa xác minh vẫn mang nhãn `[Assumption]`. Hướng dẫn HUST năm 2026 là căn cứ cho quy trình đề xuất. [Báo cáo Lab 01](../lab-01/OOAD_BaoCaoVanDe.md) · [Mô hình nghiệp vụ](01-MoHinhNghiepVu.md) · [Hướng dẫn Thực hành 2](../docs/Lab02_OOAD.md#nhiệm-vụ-thực-hành-2-requirement-modeling)

## 1. Phạm vi và ranh giới hệ thống

**Ranh giới hệ thống** xác định phần việc hệ thống hỗ trợ và phần việc do người dùng hoặc quy trình khác đảm nhiệm. Ca nghiên cứu tập trung vào sinh viên chính quy K52 có quyền tham gia đợt điều chỉnh tại HUST giai đoạn 2007–2008. Luồng bắt đầu khi sinh viên tra cứu lớp để ghép vào lịch hiện có và kết thúc khi họ biết lớp đã được xác nhận hoặc dừng khi chưa bổ sung được lớp, kể cả khi dừng trước lúc gửi vì chưa tìm được lớp để chọn.

| Trong phạm vi | Trách nhiệm và bước tương ứng |
| --- | --- |
| Tra cứu lớp mở và lịch học | Hệ thống cung cấp danh sách lớp và lịch. Sinh viên tra cứu để tìm mã lớp phù hợp (`TO-01`). |
| Chọn lớp và kiểm tra lựa chọn | Sinh viên chọn mã lớp. Hệ thống đối chiếu với lịch hiện có và kiểm tra các điều kiện áp dụng cho lựa chọn, chẳng hạn điều kiện tiên quyết hoặc giới hạn tín chỉ (`TO-02`). Nếu phát hiện trùng lịch hoặc chưa đủ điều kiện, hệ thống chỉ thông báo lý do (`TO-06`). |
| Gửi đăng ký | Sinh viên rà soát và gửi đăng ký bổ sung (`TO-03`). |
| Xem kết quả từng lớp | Hệ thống hiển thị kết quả khi sinh viên tra cứu (`TO-04`). Kết quả **Thành công** cho biết lớp đã được xác nhận (`TO-05`). Khi thấy **Hết chỗ**, sinh viên tự quay về `TO-01` nếu đợt còn mở và muốn điều chỉnh. |

**Ngoài phạm vi** gồm đăng ký đợt chính, mở thêm lớp hoặc tăng sức chứa, xử lý công nợ, quản lý quy chế học vụ và gợi ý lớp thay thế.

**Đầu vào và trách nhiệm.** Ca nghiên cứu giả định quyền tham gia đợt điều chỉnh của sinh viên đã được xác lập, bao gồm tình trạng nghĩa vụ học phí theo quy định áp dụng. Ở `TO-02`, hệ thống dùng lịch hiện có, danh sách lớp mở và các quy tắc đã thiết lập để kiểm tra lựa chọn cụ thể. Ví dụ, sinh viên có quyền tham gia đợt vẫn có thể thiếu điều kiện tiên quyết của học phần vừa chọn. Sinh viên K52 trực tiếp tương tác với hệ thống. Phòng Đào tạo là bên liên quan để kiểm chứng tác động vận hành. Danh sách tác nhân ở bước sau chỉ đưa cán bộ vào khi xác định được tương tác cụ thể trong phạm vi trên.

## 2. Danh mục yêu cầu nghiệp vụ

**Business Requirement (BR)** mô tả kết quả nghiệp vụ cần đạt. Ví dụ, giảm tỷ lệ yêu cầu phải sửa do trùng lịch là kết quả của **BR1**. Cảnh báo trùng lịch là hành vi hệ thống hỗ trợ kết quả đó, được đặc tả ở bước yêu cầu chức năng.

| Mã | Kết quả nghiệp vụ mong muốn | Căn cứ từ Thực hành 1 | Chỉ số kiểm chứng đề xuất |
| --- | --- | --- | --- |
| BR1 | Giảm tỷ lệ yêu cầu bổ sung đã gửi phải sửa hoặc gửi lại do trùng lịch. | `PP-01` → `TO-01`, `TO-02`, `TO-06` | Số yêu cầu đã gửi phải sửa hoặc gửi lại do trùng lịch chia cho tổng số yêu cầu bổ sung đã gửi trong đợt. Ghi riêng số lần phát hiện trùng lịch ở bước chọn lớp để đánh giá cảnh báo trước khi gửi. |
| BR2 | Tăng khả năng sinh viên biết kết quả từng lớp để chủ động điều chỉnh trước khi đợt đóng. | `PP-02`, `PP-03` → `TO-03`, `TO-04`, `TO-05` và vòng về `TO-01` | Số lượt đăng ký lớp mà sinh viên xác định đúng trạng thái trước hạn chia cho tổng số lượt đăng ký lớp được theo dõi. Yêu cầu gồm ba lớp đóng góp ba lượt. Với lớp hết chỗ, đo thêm thời gian từ lúc gửi đến lúc sinh viên biết kết quả. |
| BR3 | `[Assumption]` Giảm số lượt cán bộ phải rà soát lại vì lựa chọn trùng lịch hoặc chưa đủ điều kiện. | `PP-04` → `TO-02`, `TO-06` | Xác minh cán bộ có thực hiện lượt rà soát lại vì hai nguyên nhân trên hay không. Nếu có, ghi số lượt và số phút xử lý phát sinh. |
| BR4 | Tăng tỷ lệ sinh viên hoàn tất đăng ký bổ sung trước hạn với lịch không trùng và lớp còn chỗ được xác nhận, khi có phương án phù hợp. | `UN-03`, `PP-01`–`PP-03` → `TO-01`–`TO-05` | Số sinh viên đạt cả hai điều kiện trước hạn chia cho số sinh viên được theo dõi có nhu cầu bổ sung và có phương án phù hợp trong thời gian được đăng ký. Chỉ đưa vào mẫu số khi có căn cứ rằng phương án đúng học phần, đủ điều kiện, không trùng lịch và còn chỗ. Ghi riêng các ca không có phương án và các ca chưa xác định được. |

Với `PP-03`, kết quả **Hết chỗ** cho sinh viên biết tình trạng của lớp đã chọn để tự quyết định tra cứu tiếp hay dừng. Việc tăng sức chứa thuộc quy trình mở lớp. Các số đo hiện trạng **chưa đo được**. Đặt mục tiêu định lượng sau khi có dữ liệu.

### Đối chiếu tình huống trước khi đặc tả yêu cầu chức năng

| Tình huống | Kết quả đối chiếu với mô hình nghiệp vụ |
| --- | --- |
| Chưa tìm được lớp để chọn | Sinh viên dừng ở `TO-01` trước khi gửi yêu cầu. |
| Trùng lịch hoặc thiếu điều kiện trước khi gửi | Sinh viên đã có quyền tham gia đợt. `TO-02` phát hiện lựa chọn trùng lịch hoặc chưa đủ điều kiện cho học phần cụ thể. `TO-06` thông báo lý do. Sinh viên tự quyết định có quay lại tra cứu qua `TO-01` trong thời gian còn mở hay không. |
| Hết chỗ sau khi gửi | `TO-04` hiển thị **Hết chỗ**. Sinh viên có thể tự tra cứu lại nếu đợt còn mở. Nếu chưa tìm được lớp phù hợp, sinh viên vẫn chưa bổ sung được lớp. |
| Đăng ký thành công | `TO-05` cho sinh viên biết lớp đã được xác nhận. Khi đo **BR4**, chỉ tính hoàn thành **UN-03** nếu trước hạn sinh viên có lịch không trùng và lớp còn chỗ đã được xác nhận. |
