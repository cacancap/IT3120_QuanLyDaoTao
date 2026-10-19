# MA TRẬN TRUY VẾT YÊU CẦU (TRACEABILITY MATRIX)

Tài liệu phục vụ **Phụ lục A của Báo cáo**, bảo đảm tính nhất quán xuyên suốt 4 cấp độ:
`Yêu cầu chức năng (FR) ↔ Ca sử dụng (UC) ↔ Quy tắc nghiệp vụ (BR) ↔ Lớp thực thể (Class) ↔ Bảng CSDL (Table)`

---

## 1. Ma trận Truy vết Phân hệ CUR (Danh mục & Hệ thống - Thành viên A)

| Mã FR | Tên Yêu cầu Chức năng | Ca sử dụng (UC) | Quy tắc BR | Lớp Thực thể (Class) | Bảng CSDL (PostgreSQL) | Thành viên |
|---|---|---|:---:|---|---|:---:|
| `FR-CUR-01` | Quản lý danh mục Khoa, Ngành và Khung CTĐT | `UC-CUR-01` | — | `Faculty`, `Major`, `Program`, `Course` | `faculties`, `majors`, `programs`, `courses`, `program_courses` | Thành viên A |
| `FR-CUR-02` | Thiết lập điều kiện tiên quyết & Chặn vòng lặp đồ thị DAG | `UC-CUR-01` | — | `Course`, `Prerequisite` | `courses`, `prerequisites` | Thành viên A |
| `FR-CUR-03` | Tra cứu Khung CTĐT & Cây tiên quyết môn học | `UC-CUR-02` | — | `Program`, `Course`, `Prerequisite` | `programs`, `courses`, `prerequisites` | Thành viên A |
| `FR-CUR-04` | Quản lý Danh mục Học phần & Đề cương môn học | `UC-CUR-03` | `BR-06` | `Course` | `courses` | Thành viên A |
| `FR-CUR-05` | Quản lý Hồ sơ Sinh viên & Lớp Hành chính | `UC-CUR-04` | — | `Student`, `AdminClass`, `User` | `students`, `admin_classes`, `users` | Thành viên A |
| `FR-CUR-06` | Quản lý Tài khoản, Vai trò & Phân quyền RBAC | `UC-CUR-05` | — | `User`, `Role`, `Notification` | `users`, `roles`, `user_roles`, `notifications` | Thành viên A |

---

## 2. Ma trận Truy vết Các Phân hệ Còn lại (SCH, REG, GRD)

| Mã FR | Tên Yêu cầu Chức năng | Ca sử dụng (UC) | Quy tắc BR | Lớp Thực thể (Class) | Bảng CSDL (PostgreSQL) | Thành viên |
|---|---|---|:---:|---|---|:---:|
| `FR-SCH-01` | Khởi tạo Lớp học phần theo Học kỳ | `UC-SCH-01` | `BR-04` | `Semester`, `ClassSection` | `semesters`, `class_sections` | Thành viên B |
| `FR-SCH-02` | Xếp Phòng học & Kíp học (Chống trùng lịch) | `UC-SCH-01` | `BR-03` | `Room`, `ScheduleSlot` | `rooms`, `schedule_slots` | Thành viên B |
| `FR-SCH-03` | Phân công Giảng viên phụ trách lớp | `UC-SCH-02` | `BR-10` | `Instructor`, `InstructorAssignment` | `instructors`, `instructor_assignments` | Thành viên B |
| `FR-REG-01` | Đăng ký lớp học phần trong đợt mở | `UC-REG-01` | `BR-01..05`| `Registration`, `ClassSection`, `RegistrationPeriod` | `registrations`, `class_sections`, `registration_periods` | Thành viên C |
| `FR-REG-02` | Tự động tính toán và cập nhật công nợ học phí | `UC-REG-01` | `BR-06` | `Invoice`, `TuitionRate`, `Payment`, `Waiver` | `invoices`, `tuition_rates`, `payments`, `waivers` | Thành viên C |
| `FR-REG-03` | Rút hoặc hủy học phần đã đăng ký | `UC-REG-02` | `BR-05`, `BR-06`| `Registration`, `ClassSection`, `Invoice` | `registrations`, `class_sections`, `invoices` | Thành viên C |
| `FR-GRD-01` | Phân quyền và Nhập điểm thành phần lớp HP | `UC-GRD-01` | `BR-07`, `BR-10`| `Grade`, `GradeComponent` | `grades`, `grade_components` | Thành viên D |
| `FR-GRD-02` | Khóa điểm, Tính GPA/CPA & Xét cảnh báo học vụ | `UC-GRD-01` | `BR-08`, `BR-09`| `AcademicRecord`, `AcademicWarning` | `academic_records`, `academic_warnings` | Thành viên D |
| `FR-GRD-03` | Tiếp nhận và Xử lý đơn phúc khảo điểm | `UC-GRD-03` | — | `GradeAppeal`, `Grade` | `grade_appeals`, `grades` | Thành viên D |
