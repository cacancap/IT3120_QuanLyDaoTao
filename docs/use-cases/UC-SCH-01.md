# ĐẶC TẢ CA SỬ DỤNG: UC-SCH-01
## Mở Lớp Học phần và Xếp Thời khóa biểu (Module SCH)

| Hạng mục | Nội dung chi tiết |
|---|---|
| **Mã Use Case** | `UC-SCH-01` |
| **Tên Use Case** | Mở lớp học phần và Xếp thời khóa biểu |
| **Tác nhân chính** | Cán bộ Phòng Đào tạo |
| **Mô tả tóm tắt** | Mở các lớp học phần cho một học kỳ mới, gán phòng học, kíp học và phân công giảng viên giảng dạy mà không gây xung đột lịch. |
| **Sự kiện kích hoạt** | Cán bộ Đào tạo chọn chức năng "Tổ chức Lớp học phần & Xếp TKB" trước khi bắt đầu học kỳ mới. |
| **Tiền điều kiện** | - Học kỳ (`Semester`) đã được khởi tạo.<br>- Danh mục Học phần (`Course`), Phòng học (`Room`) và Giảng viên (`Instructor`) đã sẵn sàng. |
| **Hậu điều kiện** | - Bản ghi `ClassSection`, `ScheduleSlot`, `InstructorAssignment` được tạo mới ở trạng thái `OPEN_FOR_REG`. |

---

### 1. Luồng sự kiện chính (Main Success Scenario)
1. Cán bộ Đào tạo chọn Học kỳ tác nghiệp và chọn Học phần (`Course`) cần mở lớp.
2. Cán bộ Đào tạo nhập thông tin Lớp học phần: Số lượng lớp cần mở, sĩ số tối đa (`maxCapacity`), loại hình lớp (Lý thuyết/Bài tập/Thực hành).
3. Đối với từng lớp học phần, Cán bộ Đào tạo chọn Kíp học (`ScheduleSlot`: Thứ, Tiết bắt đầu, Tiết kết thúc, Tuần học), Phòng học (`Room`) và Giảng viên phụ trách (`Instructor`).
4. Cán bộ Đào tạo nhấn "Xác nhận Mở lớp & Xếp lịch".
5. Hệ thống kiểm tra sức chứa của Phòng học so với sĩ số tối đa của lớp (`Room.capacity >= ClassSection.maxCapacity`).
6. Hệ thống kiểm tra xung đột thời gian (`(StartA < EndB) AND (EndA > StartB)`) của Phòng học được chọn với các lớp học phần khác trong cùng học kỳ.
7. Hệ thống kiểm tra xung đột thời gian giảng dạy của Giảng viên được phân công với các lớp khác mà giảng viên đó đã nhận trong cùng học kỳ.
8. Khi tất cả kiểm tra đều hợp lệ, hệ thống lưu thông tin vào `ClassSection`, `ScheduleSlot`, `InstructorAssignment` và cập nhật trạng thái lớp thành `OPEN_FOR_REG`.
9. Hệ thống hiển thị thông báo tạo lớp học phần thành công.

---

### 2. Luồng ngoại lệ (Exception Flows)
- **5a. Sức chứa phòng học nhỏ hơn sĩ số tối đa của lớp:** Hệ thống cảnh báo và yêu cầu chọn phòng lớn hơn hoặc giảm sĩ số tối đa.
- **6a. Trùng lịch Phòng học:** Hệ thống báo lỗi *"Phòng [Mã phòng] đã được xếp cho lớp [Mã lớp] vào khung giờ này"* và từ chối lưu.
- **7a. Trùng lịch Giảng viên:** Hệ thống báo lỗi *"Giảng viên [Tên GV] bị trùng lịch dạy với lớp [Mã lớp]"* và yêu cầu đổi giảng viên hoặc đổi kíp học.

---

### 3. Biểu đồ liên quan (Artifacts)
- **Activity Diagram:** `diagrams/02-sch/UC-SCH-01-activity.puml`
- **BCE Class Diagram:** `diagrams/02-sch/UC-SCH-01-bce.puml`
- **Sequence Diagram:** `diagrams/02-sch/UC-SCH-01-sequence.puml`

