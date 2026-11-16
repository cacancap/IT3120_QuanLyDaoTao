# HUST 2007–2008 — Hồ sơ đề xuất và khám phá vấn đề

[Nguồn E01–E05, phạm vi và tiêu chí kiểm chứng](OOAD_BaoCaoVanDe.md)

## Phần I — System Request

### 1. Project Title

Hỗ trợ đăng ký bổ sung học phần trong đợt điều chỉnh tại HUST. Đây là hồ sơ đề xuất học thuật cho ca K52 giai đoạn 2007–2008.

### 2. Project Sponsor / Requestor

Đầu mối đề xuất xem xét là Phòng Đào tạo Đại học, căn cứ vai trò lập kế hoạch theo E01. Người bảo trợ cụ thể và quyền phê duyệt cần xác nhận.

### 3. Business Need / Problem Statement

[Assumption] Khi lớp hết chỗ sau lúc đã ghép lịch, sinh viên K52 có thể phải chọn lại và cán bộ có thể phải rà lại yêu cầu. Công sức xử lý thêm và tác động lên thời điểm chốt danh sách **chưa đo được**. [Business Problem năm thành phần](OOAD_BaoCaoVanDe.md#6-business-problem)

### 4. Project Vision / Goals

Sinh viên đủ điều kiện hoàn thành UN-03 trong thời hạn điều chỉnh khi còn lớp phù hợp và hiểu kết quả khi chưa được xác nhận. Trong MVP, mục tiêu đề xuất cho kịch bản có lớp thay thế là ít nhất 18/20 người hoàn thành UN-03, trung bình dưới 15 phút cho lượt hoàn thành. Đặt mục tiêu vận hành sau khi có số đo hiện trạng.

### 5. Business Benefits

[Assumption] Sinh viên có thể giảm thời gian ghép lại lịch, cán bộ có thể giảm số lượt rà soát và Phòng Đào tạo có thể giảm thời gian chốt danh sách. Mức tiết kiệm thời gian và giá trị kinh tế **chưa đo được**.

### 6. High-level Requirements

- Cho phép đối chiếu lớp bổ sung với lịch hiện có và điều kiện áp dụng.
- Phân biệt lớp đang chọn, lớp đã xác nhận và yêu cầu chưa được chấp nhận. Khi có phương án hợp lệ, hỗ trợ kiểm tra lớp thay thế.
- Khi xác nhận, bảo đảm lớp còn chỗ và lịch hợp lệ. Kết quả cần rõ ràng, nhất quán và có thông tin đủ để đối chiếu khi phát sinh sai lệch.

### 7. Constraints / Assumptions

Chỉ xét sinh viên K52 đủ điều kiện đăng ký bổ sung trong đợt điều chỉnh giai đoạn 2007–2008. Tiên quyết, giới hạn tín chỉ và nghĩa vụ học phí là điều kiện đầu vào. [Assumption] Có thể thu thập đủ lịch, dữ liệu sức chứa và mốc xử lý để tái dựng ca thực tế. Ngân sách và thời hạn triển khai chưa xác lập.

### 8. Feasibility Assessment

| Chiều | Điều kiện đánh giá |
| --- | --- |
| Kỹ thuật | Xác minh nguồn lịch, sĩ số theo thời điểm và cách ghi nhận kết quả. |
| Kinh tế | Đo số lượt và phút xử lý lại trước khi ước tính lợi ích hoặc chi phí. |
| Vận hành | Làm rõ đầu mối duyệt, xác nhận và đối chiếu theo hồ sơ cùng đợt. |
| Tiến độ | Chốt mốc đánh giá nguyên mẫu sau khi có bộ tình huống. Chỉ lập lịch thí điểm khi có dữ liệu và đầu mối phụ trách. |

### 9. Expected Deliverables

Báo cáo vấn đề và bảng nguồn, hai Canvas tám ô, đặc tả nguyên mẫu, kế hoạch thử nghiệm, System Request và Problem Discovery Report.

### 10. Risks & Mitigation Strategies

Hồ sơ lịch sử có thể thiếu, gây nhầm giữa sức chứa và thông tin đến muộn. Dùng mã không xác định và ghi giới hạn từng nguồn. Kết quả mô phỏng có thể khác vận hành thực tế. Báo cáo riêng số đo mô phỏng và dữ liệu thực tế.

### 11. Approval & Sign-off

Trạng thái **bản đề xuất học thuật**. Người phê duyệt, chữ ký và ngày phê duyệt chưa có.

## Phần II — Problem Discovery Report

### 1. Executive Summary

UN-03 kết hợp ghép lịch không trùng và nhận xác nhận vào lớp còn chỗ. [Evidence] Quy chế xác lập quyền đăng ký bổ sung có điều kiện. [Assumption] Phát hiện hết chỗ sau khi ghép lịch có thể làm phát sinh chọn lại và tăng công rà soát. Mức tác động **chưa đo được**.

### 2. Problem Statement

[Assumption] Sinh viên K52 đủ điều kiện có thể phải ghép lại lịch khi lớp chọn ban đầu hết chỗ. Nếu phương án thay thế xung đột hoặc thời gian đổi lớp đã thu hẹp, sinh viên có thể khó nhận xác nhận trước hạn. [Phát biểu và Canvas](OOAD_BaoCaoVanDe.md#3-user-problem-statement)

### 3. Background & Context

[Evidence] HUST triển khai tín chỉ từ năm 2007 cho K52 theo E03. Theo Điều 12 bản quy chế bổ sung tháng 7/2008, trong ba học kỳ đầu trường đăng ký đồng loạt ở đợt chính và sinh viên đủ điều kiện có thể đăng ký bổ sung ở đợt điều chỉnh. Phạm vi nghiên cứu kết thúc khi sinh viên biết kết quả hoặc lý do yêu cầu chưa được chấp nhận.

### 4. Research Methodology & Inputs

Đối chiếu quy chế E01–E02 với tổng kết E03. Dùng E04–E05 để xây dựng câu hỏi về tình huống hết chỗ. Tìm hồ sơ cùng đợt để xác định học kỳ, kênh tiếp nhận, lịch, sĩ số, các lần xử lý và mốc chốt. Hỏi cựu sinh viên khi nào biết kết quả và lúc đó còn lựa chọn nào. Hỏi cán bộ ai nhận yêu cầu sửa và bằng chứng nào xác lập thời điểm chốt. Nếu có đầu mối liên quan, xác minh cách kiểm tra nghĩa vụ học phí và thời điểm giảng viên nhận danh sách. Ghi độ chắc chắn và tư liệu đi kèm từng lời kể. [Quy tắc phân loại và số đo](OOAD_BaoCaoVanDe.md#kiểm-chứng-theo-từng-đợt)

### 5. Key Insights & User Friction Points

- [Evidence] Sĩ số và điều kiện học phần giới hạn các lựa chọn. Theo quy chế, Phiếu học tập thông báo kết quả. [Nguồn E01–E02](OOAD_BaoCaoVanDe.md#1-phạm-vi-và-nguồn)
- [Assumption] Biết hết chỗ muộn và không có lớp phù hợp là hai tình huống có thể dẫn đến kết quả giống nhau. Thu thập mốc thời gian và lớp thay thế để phân biệt.
- [Assumption] Chọn lại có thể làm tăng lượt rà soát và kéo dài thời gian chốt. Chỉ xác nhận tác động theo hồ sơ vận hành và phạm vi đo được.

#### Câu hỏi phản biện theo slide 54

1. **Nhu cầu nào quan trọng nhất?** UN-03 là nhu cầu ưu tiên nhóm đã chọn vì gồm cả điều kiện lịch và xác nhận chỗ.
2. **Đã có bằng chứng về nguyên nhân chưa?** E01–E02 xác nhận ràng buộc và cơ chế đăng ký. Chuỗi nguyên nhân cụ thể tại K52 vẫn là [Assumption].
3. **Vấn đề có thể xảy ra khi đã có công cụ đăng ký không?** Có thể nếu mọi lớp phù hợp đã đầy. Hướng dẫn HUST kỳ 2026.1 cho thấy ngay trong đăng ký trực tuyến có quy trình đổi lớp khi trạng thái báo hết chỗ. [Thông báo HUST kỳ 2026.1](https://ctt.hust.edu.vn/DisplayWeb/DisplayKehoach?kehoach=29240)
4. **Có cách xử lý ở cấp quy trình không?** Có thể rà soát lịch công bố tình trạng lớp hoặc cơ chế mở thêm lớp theo nhu cầu, tùy nguyên nhân đã xác minh. [Kế hoạch kỳ hè HUST năm 2026](https://ctt.hust.edu.vn/DisplayWeb/DisplayKehoach?kehoach=29239)
