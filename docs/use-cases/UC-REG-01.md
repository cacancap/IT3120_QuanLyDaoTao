# ĐẶC TẢ CA SỬ DỤNG: UC-REG-01
## Đăng ký Học phần trong Đợt đăng ký (Module REG)

| Hạng mục | Nội dung chi tiết |
|---|---|
| **Mã Use Case** | `UC-REG-01` |
| **Tên Use Case** | Đăng ký học phần trong đợt đăng ký |
| **Tác nhân chính** | Sinh viên |
| **Mô tả tóm tắt** | Sinh viên chọn và đăng ký vào các lớp học phần đang mở trong học kỳ. Hệ thống kiểm tra toàn bộ quy tắc nghiệp vụ (BR-01 đến BR-05) và tự động tính toán lại công nợ học phí tạm tính (BR-06). |
| **Sự kiện kích hoạt** | Sinh viên truy cập cổng Đăng ký học phần và gửi yêu cầu đăng ký mã Lớp học phần. |
| **Tiền điều kiện** | - Sinh viên đã đăng nhập hợp lệ.<br>- Đợt đăng ký (`RegistrationPeriod`) của học kỳ hiện tại đang ở trạng thái `OPEN` (**BR-05**). |
| **Hậu điều kiện** | - Bản ghi `Registration` mới được tạo với trạng thái `REGISTERED`.<br>- Sĩ số hiện tại của `ClassSection` tăng thêm 1.<br>- Hóa đơn học phí (`Invoice`) của sinh viên trong kỳ được cập nhật theo số tín chỉ mới. |

---

### 1. Luồng sự kiện chính (Main Success Scenario)
1. Sinh viên mở giao diện Đăng ký học phần của học kỳ hiện tại (`RegistrationPage`).
2. Hệ thống kiểm tra đợt đăng ký đang mở (**BR-05**), gọi `SCH.getOpenSections(semesterId)` để hiển thị danh sách lớp đang mở và danh sách các lớp sinh viên đã đăng ký trong kỳ.
3. Sinh viên nhập hoặc chọn một mã Lớp học phần (`sectionId`) và nhấn "Đăng ký".
4. Hệ thống gọi `CUR.getCourseInfo(courseCode)` để lấy số tín chỉ và danh sách học phần tiên quyết.
5. Hệ thống gọi `GRD.hasPassed(studentId, prereqCode)` để kiểm tra sinh viên đã đạt toàn bộ học phần tiên quyết (**BR-01**).
6. Hệ thống gọi `GRD.getWarningLevel(studentId, semesterId)` để lấy mức cảnh báo học vụ và kiểm tra tổng số tín chỉ sau khi cộng thêm lớp mới không vượt quá trần `MAX` tín chỉ cho phép (**BR-02**).
7. Hệ thống đối chiếu `ScheduleSlot` của lớp học phần mới với danh sách các lớp sinh viên đã đăng ký trong kỳ để xác nhận không bị trùng lịch học (**BR-03**).
8. Hệ thống kiểm tra sĩ số hiện tại của lớp học phần chưa vượt quá sĩ số tối đa (`currentEnrollment < maxCapacity`) (**BR-04**).
9. Hệ thống tạo bản ghi `Registration` (trạng thái `REGISTERED`), tăng sĩ số lớp học phần lên 1, đồng thời tính toán lại học phí theo công thức **BR-06** và cập nhật vào bảng `Invoice`.
10. Hệ thống trả về thông báo đăng ký thành công và làm mới bảng thời khóa biểu cá nhân của sinh viên.

---

### 2. Luồng ngoại lệ (Exception Flows)
- **2a. Ngoài khung thời gian đợt đăng ký (Vi phạm BR-05):** Hệ thống khóa nút đăng ký và thông báo *"Hiện không trong thời gian đăng ký học phần"*.
- **5a. Chưa đạt học phần tiên quyết (Vi phạm BR-01):** Từ chối đăng ký, báo lỗi *"Sinh viên chưa hoàn thành học phần tiên quyết: [Mã HP]"*.
- **6a. Vượt quá số tín chỉ tối đa theo mức cảnh báo học vụ (Vi phạm BR-02):** Từ chối đăng ký, báo lỗi *"Vượt quá giới hạn tín chỉ cho phép ([MAX] TC đối với mức cảnh báo hiện tại)"*.
- **7a. Trùng lịch học với lớp đã đăng ký (Vi phạm BR-03):** Từ chối đăng ký, báo lỗi *"Trùng thời khóa biểu với lớp học phần [Mã lớp] tại [Thứ - Tiết]"*.
- **8a. Lớp học phần đã đầy sĩ số (Vi phạm BR-04):** Từ chối đăng ký, báo lỗi *"Lớp học phần [Mã lớp] đã đủ sĩ số tối đa"*.

---

### 3. Biểu đồ liên quan (Artifacts)
- **Activity Diagram:** `diagrams/03-reg/UC-REG-01-activity.puml`
- **BCE Class Diagram:** `diagrams/03-reg/UC-REG-01-bce.puml`
- **Sequence Diagram:** `diagrams/03-reg/UC-REG-01-sequence.puml`
- **State Diagrams:** `diagrams/03-reg/state-registration.puml`, `diagrams/03-reg/state-invoice.puml`

