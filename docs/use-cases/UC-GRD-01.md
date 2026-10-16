# ĐẶC TẢ CA SỬ DỤNG: UC-GRD-01
## Nhập Điểm, Tính GPA/CPA và Xét Cảnh báo Học vụ (Module GRD)

| Hạng mục | Nội dung chi tiết |
|---|---|
| **Mã Use Case** | `UC-GRD-01` |
| **Tên Use Case** | Nhập điểm, tính kết quả học tập, cập nhật GPA/CPA và xét cảnh báo học vụ |
| **Tác nhân chính** | Giảng viên (nhập và công bố điểm), Cán bộ Phòng Đào tạo (khóa điểm và chạy xét học vụ) |
| **Mô tả tóm tắt** | Giảng viên nhập điểm thành phần cho sinh viên trong lớp học phần mình phụ trách. Hệ thống tự động tính điểm tổng kết, quy đổi thang điểm 4, cập nhật GPA/CPA và đánh giá mức cảnh báo học vụ. |
| **Sự kiện kích hoạt** | Giảng viên chọn chức năng "Nhập điểm lớp học phần" sau khi kết thúc kỳ thi. |
| **Tiền điều kiện** | - Giảng viên đã đăng nhập.<br>- Lớp học phần đang ở trạng thái `IN_PROGRESS` hoặc `COMPLETED`. |
| **Hậu điều kiện** | - Điểm (`Grade`) chuyển trạng thái từ `DRAFT` → `PUBLISHED` → `LOCKED`.<br>- Bảng kết quả tích lũy (`AcademicRecord`) và Cảnh báo học vụ (`AcademicWarning`) được cập nhật. |

---

### 1. Luồng sự kiện chính (Main Success Scenario)
1. Giảng viên chọn một Lớp học phần (`sectionId`) để nhập điểm.
2. Hệ thống gọi `SCH.getSectionInstructor(sectionId)` để xác nhận giảng viên hiện tại đúng là người phụ trách lớp (**BR-10**).
3. Hệ thống gọi `REG.getRegisteredStudents(sectionId)` để lấy danh sách sinh viên hợp lệ của lớp và hiển thị bảng nhập điểm kèm cấu trúc trọng số (`GradeComponent`).
4. Giảng viên nhập điểm quá trình và điểm thi cuối kỳ cho từng sinh viên (hoặc tải lên từ file mẫu), hệ thống lưu tạm ở trạng thái `DRAFT`.
5. Giảng viên nhấn "Công bố điểm".
6. Hệ thống kiểm tra miền giá trị điểm hợp lệ ($0.0 \le \text{Điểm} \le 10.0$), tự động tính điểm tổng kết học phần theo trọng số (**BR-07**), quy đổi sang điểm chữ và thang điểm 4.0, chuyển trạng thái `Grade` sang `PUBLISHED` và gửi thông báo cho sinh viên.
7. Sau thời hạn công bố, Cán bộ Phòng Đào tạo xác nhận "Khóa bảng điểm & Xét học vụ kỳ".
8. Hệ thống chuyển trạng thái `Grade` sang `LOCKED`, tính toán lại GPA học kỳ và CPA tích lũy (lấy điểm cao nhất nếu học lại) cho từng sinh viên (**BR-08**), lưu vào `AcademicRecord`.
9. Hệ thống đối chiếu GPA/CPA và số tín chỉ nợ với ngưỡng quy chế (**BR-09**) để cập nhật mức cảnh báo (0, 1, 2, 3) vào bảng `AcademicWarning`.

---

### 2. Luồng ngoại lệ (Exception Flows)
- **2a. Giảng viên không phải người được phân công dạy lớp này (Vi phạm BR-10):** Hệ thống chặn truy cập và thông báo *"Bạn không có quyền nhập điểm cho lớp học phần này"*.
- **6a. Điểm nhập vào ngoài khoảng $[0, 10]$ hoặc để trống ô bắt buộc:** Hệ thống báo đỏ tại dòng sinh viên bị lỗi và yêu cầu Giảng viên nhập lại trước khi công bố.

---

### 3. Biểu đồ liên quan (Artifacts)
- **Activity Diagram:** `diagrams/04-grd/UC-GRD-01-activity.puml`
- **BCE Class Diagram:** `diagrams/04-grd/UC-GRD-01-bce.puml`
- **Sequence Diagram:** `diagrams/04-grd/UC-GRD-01-sequence.puml`
- **State Diagram:** `diagrams/04-grd/state-grade.puml`

