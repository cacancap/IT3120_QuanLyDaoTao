# Lab 02 — Thực hành 2: Mô hình hóa yêu cầu

Bước 1 kế thừa nhu cầu **UN-03**, bốn điểm nghẽn `PP-01`–`PP-04` và quy trình đề xuất `TO-01`–`TO-06`. Các bước vận hành và điểm nghẽn lịch sử chưa xác minh vẫn mang nhãn `[Assumption]`. Hướng dẫn HUST năm 2026 là căn cứ cho quy trình đề xuất. [Báo cáo Lab 01](../lab-01/OOAD_BaoCaoVanDe.md) · [Mô hình nghiệp vụ](01-MoHinhNghiepVu.md) · [Hướng dẫn Thực hành 2](../docs/Lab02_OOAD.md#nhiệm-vụ-thực-hành-2-requirement-modeling)

## 1. Phạm vi và ranh giới hệ thống

**Ranh giới hệ thống** xác định phần việc hệ thống hỗ trợ và phần việc do người dùng hoặc quy trình khác đảm nhiệm. Ca nghiên cứu tập trung vào sinh viên chính quy K52 đủ điều kiện đăng ký bổ sung trong đợt điều chỉnh tại HUST giai đoạn 2007–2008. Luồng bắt đầu khi sinh viên tra cứu lớp để ghép vào lịch hiện có và kết thúc khi họ biết lớp đã được xác nhận hoặc biết lý do chưa bổ sung được lớp.

| Trong phạm vi | Trách nhiệm và bước tương ứng |
| --- | --- |
| Tra cứu lớp mở và lịch học | Hệ thống cung cấp danh sách lớp và lịch. Sinh viên tra cứu để tìm mã lớp phù hợp (`TO-01`). |
| Chọn lớp và kiểm tra lựa chọn | Sinh viên chọn mã lớp. Hệ thống kiểm tra lựa chọn và chỉ thông báo lý do khi trùng lịch hoặc thiếu điều kiện (`TO-02`, `TO-06`). |
| Gửi đăng ký | Sinh viên rà soát và gửi đăng ký bổ sung (`TO-03`). |
| Xem kết quả từng lớp | Hệ thống hiển thị kết quả khi sinh viên tra cứu (`TO-04`). Kết quả **Thành công** cho biết lớp đã được xác nhận (`TO-05`). Khi thấy **Hết chỗ**, sinh viên tự quay về `TO-01` nếu đợt còn mở và muốn điều chỉnh. |

**Ngoài phạm vi** gồm đăng ký đợt chính, mở thêm lớp hoặc tăng sức chứa, xử lý công nợ, quản lý quy chế học vụ và gợi ý lớp thay thế.

**Đầu vào và trách nhiệm.** Hệ thống sử dụng lịch hiện có, danh sách lớp mở và các điều kiện đăng ký đã được thiết lập. Điều kiện tiên quyết, giới hạn tín chỉ và nghĩa vụ học phí được xem là điều kiện đầu vào. Sinh viên K52 trực tiếp tương tác với hệ thống. Phòng Đào tạo là bên liên quan để kiểm chứng tác động vận hành. Danh sách tác nhân ở bước sau chỉ đưa cán bộ vào khi xác định được tương tác cụ thể trong phạm vi trên.

## 2. Danh mục yêu cầu nghiệp vụ

**Business Requirement (BR)** mô tả kết quả nghiệp vụ cần đạt. Ví dụ, giảm số yêu cầu phải sửa do trùng lịch là kết quả của **BR1**. Cảnh báo trùng lịch là hành vi hệ thống hỗ trợ kết quả đó, được đặc tả ở bước yêu cầu chức năng.

| Mã | Kết quả nghiệp vụ mong muốn | Căn cứ từ Thực hành 1 | Chỉ số kiểm chứng đề xuất |
| --- | --- | --- | --- |
| BR1 | Giảm số yêu cầu bổ sung phải sửa hoặc gửi lại do trùng lịch. | `PP-01` → `TO-01`, `TO-02`, `TO-06` | Số yêu cầu đã gửi phải sửa hoặc gửi lại do trùng lịch chia cho tổng số yêu cầu bổ sung đã gửi trong đợt. |
| BR2 | Tăng khả năng sinh viên biết kết quả từng lớp để chủ động điều chỉnh trước khi đợt đóng. | `PP-02`, `PP-03` → `TO-03`, `TO-04`, `TO-05` và vòng về `TO-01` | Tỷ lệ yêu cầu mà sinh viên xác định đúng kết quả trước hạn, tính trên các yêu cầu được theo dõi. Với yêu cầu có nhiều lớp, đối chiếu kết quả từng lớp. |
| BR3 | Giảm số lượt cán bộ phải rà soát lại vì lựa chọn trùng lịch hoặc chưa đủ điều kiện. | `PP-04` → `TO-02`, `TO-06` | Số lượt rà soát lại và số phút xử lý phát sinh vì hai nguyên nhân trên. Tác động giảm công rà soát là `[Assumption]` cần kiểm chứng. |

Với `PP-03`, kết quả **Hết chỗ** cho sinh viên biết tình trạng của lớp đã chọn để tự quyết định tra cứu tiếp hay dừng. Việc tăng sức chứa thuộc quy trình mở lớp. Hiện trạng của cả ba chỉ số **chưa đo được**. Đặt mục tiêu định lượng sau khi có dữ liệu.

### Đối chiếu tình huống trước khi đặc tả yêu cầu chức năng

| Tình huống | Kết quả đối chiếu với mô hình nghiệp vụ |
| --- | --- |
| Trùng lịch hoặc thiếu điều kiện trước khi gửi | `TO-06` thông báo lý do. Sinh viên tự quyết định có quay lại tra cứu qua `TO-01` trong thời gian còn mở hay không. |
| Hết chỗ sau khi gửi | `TO-04` hiển thị **Hết chỗ**. Sinh viên có thể tự tra cứu lại nếu đợt còn mở. Nếu chưa tìm được lớp phù hợp, sinh viên vẫn chưa bổ sung được lớp. |
| Đăng ký thành công | `TO-05` cho sinh viên biết lớp đã được xác nhận. Chỉ tính hoàn thành **UN-03** khi lịch không trùng và lớp còn chỗ đã được xác nhận. |
