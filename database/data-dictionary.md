# TỪ ĐIỂN DỮ LIỆU CƠ SỞ DỮ LIỆU (DATA DICTIONARY)
## Hệ thống Quản lý Đào tạo Đại học (PostgreSQL)

Tài liệu phục vụ **Chương 4 (Mục 4.2.2: Đặc tả chi tiết các bảng dữ liệu)**, do **Thành viên D** chủ trì biên soạn và chuẩn hóa.

---

## 1. Phân hệ CUR (Danh mục & Hệ thống)

### 1.1. Bảng `users` (Tài khoản người dùng)
| Tên cột | Kiểu dữ liệu | Khóa | Ràng buộc | Ý nghĩa / Mô tả |
|---|---|:---:|---|---|
| `id` | `VARCHAR(64)` | PK | NOT NULL | Mã định danh người dùng (UUID hoặc chuỗi định danh) |
| `email` | `VARCHAR(255)` | | UNIQUE, NOT NULL | Địa chỉ email đăng nhập vào hệ thống |
| `password_hash` | `VARCHAR(255)` | | NOT NULL | Chuỗi băm mật khẩu bảo mật (bcrypt/argon2) |
| `full_name` | `VARCHAR(255)` | | NOT NULL | Họ và tên đầy đủ |
| `phone_number` | `VARCHAR(20)` | | NULL | Số điện thoại liên lạc |
| `status` | `VARCHAR(50)` | | DEFAULT 'ACTIVE' | Trạng thái tài khoản: ACTIVE, INACTIVE, SUSPENDED |
| `created_at` | `TIMESTAMPTZ` | | DEFAULT NOW() | Thời điểm tạo tài khoản |
| `updated_at` | `TIMESTAMPTZ` | | DEFAULT NOW() | Thời điểm cập nhật thông tin gần nhất |

### 1.2. Bảng `courses` (Danh mục Học phần)
| Tên cột | Kiểu dữ liệu | Khóa | Ràng buộc | Ý nghĩa / Mô tả |
|---|---|:---:|---|---|
| `id` | `VARCHAR(64)` | PK | NOT NULL | Khóa chính học phần |
| `course_code` | `VARCHAR(50)` | | UNIQUE, NOT NULL | Mã học phần chuẩn (VD: IT3120, MI1111) |
| `name` | `VARCHAR(255)` | | NOT NULL | Tên môn học / học phần |
| `credits` | `INT` | | CHECK (credits > 0) | Số tín chỉ của học phần |
| `tuition_factor` | `NUMERIC(3, 2)` | | DEFAULT 1.00 | Hệ số học phí của học phần (BR-06) |
| `description` | `TEXT` | | NULL | Đề cương tóm tắt môn học |

### 1.3. Bảng `prerequisites` (Học phần Tiên quyết)
| Tên cột | Kiểu dữ liệu | Khóa | Ràng buộc | Ý nghĩa / Mô tả |
|---|---|:---:|---|---|
| `id` | `VARCHAR(64)` | PK | NOT NULL | Khóa chính điều kiện tiên quyết |
| `course_id` | `VARCHAR(64)` | FK | REFERENCES courses(id) | Mã học phần đích |
| `prerequisite_course_id` | `VARCHAR(64)` | FK | REFERENCES courses(id) | Mã học phần điều kiện phải học trước (BR-01) |
| `type` | `VARCHAR(50)` | | DEFAULT 'PREREQUISITE' | Loại điều kiện: PREREQUISITE (Tiên quyết), CO_REQUISITE (Song hành) |

---

## 2. Phân hệ SCH (Tổ chức Giảng dạy)

### 2.1. Bảng `class_sections` (Lớp Học phần)
| Tên cột | Kiểu dữ liệu | Khóa | Ràng buộc | Ý nghĩa / Mô tả |
|---|---|:---:|---|---|
| `id` | `VARCHAR(64)` | PK | NOT NULL | Khóa chính lớp học phần |
| `semester_id` | `VARCHAR(64)` | FK | REFERENCES semesters(id) | Học kỳ mở lớp |
| `course_id` | `VARCHAR(64)` | FK | REFERENCES courses(id) | Học phần tương ứng |
| `section_code` | `VARCHAR(50)` | | NOT NULL | Mã lớp học phần (VD: 145620) |
| `max_capacity` | `INT` | | CHECK (> 0) | Sĩ số tối đa quy định của lớp (BR-04) |
| `current_enrollment`| `INT` | | DEFAULT 0, <= max_capacity | Sĩ số đã đăng ký thành công hiện tại |
| `status` | `section_status_enum` | | DEFAULT 'DRAFT' | DRAFT, OPEN_FOR_REG, CLOSED_FOR_REG, IN_PROGRESS, COMPLETED, CANCELLED |

### 2.2. Bảng `schedule_slots` (Kíp học / Thời khóa biểu)
| Tên cột | Kiểu dữ liệu | Khóa | Ràng buộc | Ý nghĩa / Mô tả |
|---|---|:---:|---|---|
| `id` | `VARCHAR(64)` | PK | NOT NULL | Khóa chính kíp học |
| `section_id` | `VARCHAR(64)` | FK | REFERENCES class_sections(id) | Lớp học phần được xếp lịch |
| `room_id` | `VARCHAR(64)` | FK | REFERENCES rooms(id) | Phòng học chỉ định |
| `day_of_week` | `INT` | | CHECK (2..8) | Thứ trong tuần (2: Thứ 2 ... 8: Chủ nhật) |
| `start_period` | `INT` | | CHECK (1..12) | Tiết bắt đầu |
| `end_period` | `INT` | | CHECK (1..12), >= start | Tiết kết thúc (chống trùng lịch BR-03) |
| `weeks` | `VARCHAR(100)` | | NOT NULL | Tuần học (VD: 1-8, 10-16) |

---

## 3. Phân hệ REG (Đăng ký Học phần & Học phí)

### 3.1. Bảng `registrations` (Bản ghi Đăng ký)
| Tên cột | Kiểu dữ liệu | Khóa | Ràng buộc | Ý nghĩa / Mô tả |
|---|---|:---:|---|---|
| `id` | `VARCHAR(64)` | PK | NOT NULL | Khóa chính đăng ký |
| `student_id` | `VARCHAR(64)` | FK | REFERENCES students(id) | Sinh viên thực hiện đăng ký |
| `section_id` | `VARCHAR(64)` | FK | REFERENCES class_sections(id) | Lớp học phần được đăng ký |
| `registered_at` | `TIMESTAMPTZ` | | DEFAULT NOW() | Thời điểm gửi yêu cầu đăng ký hợp lệ |
| `status` | `registration_status_enum`| | DEFAULT 'REGISTERED'| REGISTERED, WITHDRAWN, CANCELLED |

### 3.2. Bảng `invoices` (Hóa đơn học phí học kỳ)
| Tên cột | Kiểu dữ liệu | Khóa | Ràng buộc | Ý nghĩa / Mô tả |
|---|---|:---:|---|---|
| `id` | `VARCHAR(64)` | PK | NOT NULL | Khóa chính hóa đơn |
| `student_id` | `VARCHAR(64)` | FK | REFERENCES students(id) | Sinh viên nợ học phí |
| `semester_id` | `VARCHAR(64)` | FK | REFERENCES semesters(id) | Học kỳ tính học phí |
| `total_amount` | `NUMERIC(12, 2)`| | >= 0 | Tổng số tiền học phí phải nộp (BR-06) |
| `paid_amount` | `NUMERIC(12, 2)`| | >= 0, DEFAULT 0 | Số tiền đã thanh toán qua cổng trực tuyến |
| `due_date` | `DATE` | | NOT NULL | Hạn chót nộp học phí |
| `status` | `invoice_status_enum` | | DEFAULT 'UNPAID' | UNPAID, PARTIALLY_PAID, PAID, OVERDUE |

---

## 4. Phân hệ GRD (Kết quả Học tập)

### 4.1. Bảng `grades` (Bảng điểm Học phần)
| Tên cột | Kiểu dữ liệu | Khóa | Ràng buộc | Ý nghĩa / Mô tả |
|---|---|:---:|---|---|
| `id` | `VARCHAR(64)` | PK | NOT NULL | Khóa chính điểm học phần |
| `registration_id` | `VARCHAR(64)` | FK | UNIQUE, REFERENCES registrations | Gắn chặt với bản ghi đăng ký của SV |
| `process_score` | `NUMERIC(3, 1)` | | CHECK (0.0..10.0) | Điểm quá trình |
| `final_score` | `NUMERIC(3, 1)` | | CHECK (0.0..10.0) | Điểm thi kết thúc học phần |
| `total_score_10` | `NUMERIC(3, 1)` | | CHECK (0.0..10.0) | Điểm tổng kết hệ 10 theo trọng số (BR-07) |
| `letter_grade` | `VARCHAR(5)` | | A+, A, B+, B, C+, C, D+, D, F | Điểm chữ quy đổi |
| `score_4` | `NUMERIC(3, 2)` | | CHECK (0.0..4.0) | Điểm thang 4 quy đổi |
| `status` | `grade_status_enum` | | DEFAULT 'DRAFT' | DRAFT -> PUBLISHED -> LOCKED |

### 4.2. Bảng `academic_records` (Điểm tích lũy & GPA/CPA)
| Tên cột | Kiểu dữ liệu | Khóa | Ràng buộc | Ý nghĩa / Mô tả |
|---|---|:---:|---|---|
| `id` | `VARCHAR(64)` | PK | NOT NULL | Khóa chính bảng kết quả học kỳ |
| `student_id` | `VARCHAR(64)` | FK | REFERENCES students(id) | Sinh viên |
| `semester_id` | `VARCHAR(64)` | FK | REFERENCES semesters(id) | Học kỳ đánh giá |
| `gpa` | `NUMERIC(3, 2)` | | CHECK (0.0..4.0) | Điểm trung bình học kỳ thang 4 (BR-08) |
| `cpa` | `NUMERIC(3, 2)` | | CHECK (0.0..4.0) | Điểm trung bình tích lũy toàn khóa (BR-08) |
| `accumulated_credits`| `INT` | | >= 0 | Số tín chỉ đã tích lũy thành công |
| `debt_credits` | `INT` | | >= 0, DEFAULT 0 | Số tín chỉ còn nợ (điểm F) |

### 4.3. Bảng `academic_warnings` (Cảnh báo học vụ)
| Tên cột | Kiểu dữ liệu | Khóa | Ràng buộc | Ý nghĩa / Mô tả |
|---|---|:---:|---|---|
| `id` | `VARCHAR(64)` | PK | NOT NULL | Khóa chính cảnh báo |
| `student_id` | `VARCHAR(64)` | FK | REFERENCES students(id) | Sinh viên bị cảnh báo |
| `semester_id` | `VARCHAR(64)` | FK | REFERENCES semesters(id) | Học kỳ ghi nhận cảnh báo |
| `warning_level` | `INT` | | CHECK IN (0, 1, 2, 3) | Mức cảnh báo (Mức 0: Bình thường, Mức 1, 2, 3) (BR-09) |
| `reason` | `TEXT` | | NOT NULL | Căn cứ xử lý vi phạm quy chế |

