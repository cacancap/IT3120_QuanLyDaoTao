# DANH MỤC 10 QUY TẮC NGHIỆP VỤ CỐT LÕI (BUSINESS RULES - BR)

Tài liệu này định nghĩa chính xác và chi tiết 10 quy tắc nghiệp vụ cốt lõi xuyên suốt 4 module của hệ thống Quản lý Đào tạo Đại học theo tín chỉ.

| Mã BR | Tên quy tắc | Mô tả chi tiết logic kiểm tra | Module áp dụng |
|---|---|---|---|
| **BR-01** | **Tiên quyết bắt buộc** | Sinh viên chỉ được đăng ký học phần $X$ nếu tất cả học phần tiên quyết của $X$ đều có trạng thái "Đã đạt" (`hasPassed = true`). | REG, CUR, GRD |
| **BR-02** | **Giới hạn tín chỉ đăng ký** | Tổng số tín chỉ đăng ký trong học kỳ phải thuộc đoạn $[MIN, MAX]$. Trần $MAX$ bị giới hạn nghiêm ngặt theo mức Cảnh báo học vụ của kỳ trước:<br>• **Mức 0 (Bình thường):** Tối đa 24 TC<br>• **Mức 1:** Tối đa 18 TC<br>• **Mức 2:** Tối đa 14 TC<br>• **Mức 3:** Tối đa 8 TC (hoặc thuộc diện buộc thôi học) | REG, GRD |
| **BR-03** | **Chống trùng kíp học** | Sinh viên không được đăng ký 2 `ClassSection` có `ScheduleSlot` giao nhau về thời gian (cùng Thứ và giao khoảng Tiết học) trong cùng một học kỳ: `(StartA < EndB) AND (EndA > StartB)`. | REG, SCH |
| **BR-04** | **Giới hạn sĩ số lớp** | Chỉ cho phép đăng ký khi số lượng sinh viên hiện tại của lớp nhỏ hơn sĩ số tối đa quy định: `currentEnrollment < maxCapacity`. | REG, SCH |
| **BR-05** | **Khung thời hạn đăng ký** | Thao tác Thêm mới hoặc Rút học phần chỉ hợp lệ khi đợt đăng ký đang ở trạng thái `OPEN` (`RegistrationPeriod.status == OPEN`) và thời gian thực hiện nằm trong khoảng `startTime..endTime`. | REG |
| **BR-06** | **Công thức tính học phí** | Học phí của mỗi học phần đăng ký = $\text{Course.credits} \times \text{TuitionRate.amountPerCredit} \times \text{Course.tuitionFactor}$. Tổng học phí học kỳ = Tổng học phí các học phần trừ đi Miễn giảm (nếu có). | REG, CUR |
| **BR-07** | **Điểm tổng kết học phần** | Điểm số tổng kết học phần (thang 10) = $\sum_{i=1}^n (\text{Trọng số}_i \times \text{Điểm thành phần}_i)$, làm tròn đến 1 chữ số thập phân và quy đổi sang điểm chữ (A+, A, B+, B, C+, C, D+, D, F) cùng thang điểm 4.0. | GRD |
| **BR-08** | **Tính GPA và CPA** | • **GPA (Grade Point Average):** Điểm trung bình học kỳ, tính theo trung bình cộng có trọng số tín chỉ trên thang điểm 4.0.<br>• **CPA (Cumulative Point Average):** Điểm trung bình tích lũy toàn khóa. Trường hợp học lại hoặc cải thiện, hệ thống tự động lấy điểm cao nhất trong các lần học để tính CPA. | GRD |
| **BR-09** | **Xét cảnh báo học vụ** | Cuối mỗi học kỳ sau khi khóa điểm, dựa vào ngưỡng CPA và tổng số tín chỉ nợ đọng tích lũy, hệ thống tự động đánh giá và gắn mức cảnh báo học vụ (Mức 0, Mức 1, Mức 2, Mức 3) vào hồ sơ sinh viên. | GRD |
| **BR-10** | **Phân quyền nhập điểm** | Chỉ giảng viên được gán phụ trách chính thức trong `InstructorAssignment` của `ClassSection` đó mới có quyền truy cập, chỉnh sửa và công bố bảng điểm của lớp. | GRD, SCH |