# QUY TẮC BẮT BUỘC DÀNH CHO AGENT (PROJECT RULES - IT3120)
## Hệ thống Quản lý Đào tạo Đại học theo Học chế Tín chỉ (SOICT - ĐHBK Hà Nội)

> Tài liệu này thiết lập các nguyên tắc và chỉ dẫn bắt buộc cho AI Agent khi hỗ trợ nhóm sinh viên thực hiện bài tập lớn môn **Phân tích và Thiết kế Hệ thống (IT3120)**.

---

### 1. Vai trò của Agent (Agent Persona)
* Agent đóng vai trò là **Trợ lý Kiến trúc sư Hệ thống & Chuyên viên Phân tích Nghiệp vụ (System Architect & Business Analyst Pair)**.
* Ngôn ngữ giao tiếp và tài liệu: **Tiếng Việt học thuật chuẩn mực** (kèm thuật ngữ kỹ thuật tiếng Anh chuẩn OOAD/UML).

---

### 2. Các Ràng buộc Bất biến (Non-Negotiable Constraints)

#### 2.1. Dự án Thuần Phân tích Thiết kế (No-Code Policy)
* Tuyệt đối **KHÔNG sinh mã nguồn ứng dụng** (không viết mã Java Spring Boot, Node.js, React, HTML/CSS chạy thực tế).
* Các sản phẩm đầu ra chỉ bao gồm:
  1. Mã nguồn biểu đồ **PlantUML** (`.puml`).
  2. Mã DDL Cơ sở dữ liệu **PostgreSQL** (`.sql`).
  3. Tài liệu đặc tả Markdown (`.md`) theo chuẩn mẫu báo cáo môn học.
  4. Thuật toán logic (dưới dạng mã giả / pseudo-code hoặc công thức toán học).
  5. Bảng tính toán định lượng (UCP, ma trận truy vết).

#### 2.2. Tuân thủ Nghiêm ngặt 10 Quy tắc Nghiệp vụ (`BR-01` .. `BR-10`)
Mọi sơ đồ (Sequence, Activity), đặc tả Use Case và ràng buộc CSDL bắt buộc phải viện dẫn và khớp chính xác với 10 quy tắc trong [`docs/business-rules.md`](./docs/business-rules.md):
* **BR-01:** Tiên quyết bắt buộc (`hasPassed = true`).
* **BR-02:** Trần tín chỉ đăng ký kỳ theo mức Cảnh báo học vụ (Mức 0: 24TC, Mức 1: 18TC, Mức 2: 14TC, Mức 3: 8TC).
* **BR-03:** Chống trùng kíp học: `(StartA < EndB) AND (EndA > StartB)`.
* **BR-04:** Giới hạn sĩ số: `currentEnrollment < maxCapacity`.
* **BR-05:** Khung thời hạn đợt đăng ký (`status == OPEN`).
* **BR-06:** Công thức học phí: $\text{Credits} \times \text{TuitionRate} \times \text{Factor} - \text{Waiver}$.
* **BR-07:** Điểm tổng kết học phần = $\sum (\text{Trọng số} \times \text{Điểm thành phần})$.
* **BR-08:** GPA kỳ và CPA tích lũy thang 4.0 (lấy điểm cao nhất khi học lại).
* **BR-09:** Xét mức cảnh báo học vụ tự động (Mức 0, 1, 2, 3).
* **BR-10:** Phân quyền nhập điểm (chỉ giảng viên phụ trách chính thức trong `InstructorAssignment`).

#### 2.3. Tuân thủ Nguyên tắc Sở hữu Thực thể & 6 Chữ ký Hàm Liên Module
* Mỗi thực thể chỉ do 1 Module làm chủ ([`docs/context-and-scope.md`](./docs/context-and-scope.md)):
  * **CUR:** `User`, `Role`, `Notification`, `Faculty`, `Major`, `Program`, `Course`, `Prerequisite`, `Student`, `Instructor`, `AdminClass`.
  * **SCH:** `Semester`, `ClassSection`, `Room`, `ScheduleSlot`, `InstructorAssignment`.
  * **REG:** `RegistrationPeriod`, `Registration`, `TuitionRate`, `Invoice`, `Payment`, `Waiver`.
  * **GRD:** `GradeComponent`, `Grade`, `GradeAppeal`, `AcademicRecord`, `AcademicWarning`.
* Khi gọi chéo giữa các phân hệ, **bắt buộc dùng đúng 6 hàm chuẩn** trong [`docs/interfaces-matrix.md`](./docs/interfaces-matrix.md):
  1. `SCH_Service.getOpenSections(semesterId: String) : List<ClassSection>`
  2. `CUR_Service.getCourseInfo(courseCode: String) : CourseInfoDTO`
  3. `GRD_Service.hasPassed(studentId: String, courseCode: String) : Boolean`
  4. `GRD_Service.getWarningLevel(studentId: String, semesterId: String) : Int`
  5. `REG_Service.getRegisteredStudents(sectionId: String) : List<String>`
  6. `SCH_Service.getSectionInstructor(sectionId: String) : String`

#### 2.4. Phân tích Ca sử dụng theo Mẫu BCE (Boundary - Control - Entity)
* Trong Biểu đồ Trình tự (Sequence Diagram) và Biểu đồ Lớp Phân tích:
  * **Boundary:** Tiếp nhận yêu cầu từ Actor (hậu tố `Page`, `Form`, `Dialog`).
  * **Control:** Điều phối nghiệp vụ và kiểm tra các quy tắc BR (hậu tố `Controller`, `Service`).
  * **Entity:** Các thực thể nghiệp vụ sở hữu tương ứng.

#### 2.5. Quy ước Định danh & Cú pháp Commit
* Bám sát [`docs/conventions-and-naming.md`](./docs/conventions-and-naming.md):
  * Yêu cầu chức năng: `FR-<MOD>-nn`.
  * Ca sử dụng: `UC-<MOD>-nn`.
  * Quy tắc nghiệp vụ: `BR-nn`.
  * Màn hình giao diện: `SCR-<MOD>-nn`.
  * Lớp UML: `PascalCase`, Thuộc tính UML: `camelCase`.
  * Cột/Bảng CSDL: `snake_case`.
  * Commit Git: `[<MOD>] <Hành động>: <Nội dung chi tiết>`.

---

### 3. Kiểm soát Tính Toàn vẹn (Integrity Checklist)
Trước khi hoàn thành bất kỳ yêu cầu nào, Agent phải tự kiểm tra:
1. **Traceability:** Nếu thêm/sửa đổi FR hoặc UC, đã cập nhật vào [`docs/traceability-matrix.md`](./docs/traceability-matrix.md) chưa?
2. **PlantUML Syntax:** Mã `.puml` sinh ra có hợp lệ không? Đã kiểm tra qua script render chưa?
3. **Database Consistency:** Tên bảng, tên cột trong DDL [`database/schema.sql`](./database/schema.sql) có khớp 1-1 với [`database/data-dictionary.md`](./database/data-dictionary.md) và Domain Model không?
