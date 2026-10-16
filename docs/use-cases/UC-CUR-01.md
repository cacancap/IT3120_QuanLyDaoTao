# ĐẶC TẢ CA SỬ DỤNG: UC-CUR-01
## Xây dựng và Cập nhật Khung Chương trình Đào tạo (Module CUR)

| Hạng mục | Nội dung chi tiết |
|---|---|
| **Mã Use Case** | `UC-CUR-01` |
| **Tên Use Case** | Xây dựng và cập nhật khung Chương trình Đào tạo (CTĐT) |
| **Tác nhân chính** | Cán bộ Phòng Đào tạo |
| **Tác nhân phụ** | Cán bộ Khoa/Viện (Đề xuất) |
| **Mô tả tóm tắt** | Cho phép Cán bộ Đào tạo thêm/sửa học phần vào khung CTĐT của một ngành và thiết lập điều kiện học phần tiên quyết, đồng thời kiểm tra ngăn chặn vòng lặp tiên quyết. |
| **Sự kiện kích hoạt** | Cán bộ Đào tạo chọn chức năng "Quản lý Khung CTĐT" trên hệ thống. |
| **Tiền điều kiện** | - Người dùng đã đăng nhập với vai trò Cán bộ Phòng Đào tạo.<br>- Danh mục Ngành (`Major`), Khóa đào tạo và danh mục Học phần (`Course`) cơ bản đã tồn tại trong hệ thống. |
| **Hậu điều kiện** | - Khung CTĐT (`Program`) và các ràng buộc tiên quyết (`Prerequisite`) được lưu trữ hợp lệ vào CSDL.<br>- Không tồn tại chu trình (vòng lặp) trong đồ thị điều kiện tiên quyết. |

---

### 1. Luồng sự kiện chính (Main Success Scenario)
1. Cán bộ Đào tạo truy cập màn hình Quản lý Chương trình Đào tạo và chọn một Khung CTĐT cần cấu hình.
2. Hệ thống truy xuất và hiển thị thông tin chi tiết của CTĐT cùng danh sách các học phần hiện có (chia theo kỳ học gợi ý và khối kiến thức).
3. Cán bộ Đào tạo chọn thêm học phần mới vào CTĐT và thiết lập danh sách các mã học phần tiên quyết (`Prerequisite`) cho học phần đó.
4. Cán bộ Đào tạo nhấn nút "Lưu cấu hình".
5. Hệ thống kiểm tra tính hợp lệ của dữ liệu đầu vào (số tín chỉ, học kỳ dự kiến).
6. Hệ thống chạy thuật toán kiểm tra chu trình trên đồ thị có hướng (DAG Cycle Detection / DFS) đối với cấu trúc môn học tiên quyết.
7. Hệ thống xác nhận không có vòng lặp tiên quyết và lưu thông tin cấu hình vào bảng `Program` và `Prerequisite`.
8. Hệ thống thông báo cập nhật Khung CTĐT thành công.

---

### 2. Luồng sự kiện thay thế & Ngoại lệ (Exception Flows)
- **6a. Phát hiện vòng lặp tiên quyết (Ví dụ: HP A tiên quyết HP B, HP B tiên quyết HP C, nhưng HP C lại được gán là tiên quyết của HP A):**
  - 6a.1. Hệ thống dừng quá trình lưu, đánh dấu đường dẫn gây ra chu trình lặp.
  - 6a.2. Hệ thống hiển thị thông báo lỗi chi tiết: *"Vi phạm cấu trúc tiên quyết: Phát hiện vòng lặp phụ thuộc giữa các học phần [Danh sách mã HP]"* và yêu cầu chỉnh sửa lại.

---

### 3. Biểu đồ liên quan (Artifacts)
- **Activity Diagram:** `diagrams/01-cur/UC-CUR-01-activity.puml`
- **BCE Class Diagram:** `diagrams/01-cur/UC-CUR-01-bce.puml`
- **Sequence Diagram:** `diagrams/01-cur/UC-CUR-01-sequence.puml`

