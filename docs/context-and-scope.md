# BỐI CẢNH DỰ ÁN & KIẾN TRÚC TỔNG THỂ: HỆ THỐNG QUẢN LÝ ĐÀO TẠO ĐẠI HỌC (IT3120)

## 1. Thông tin chung & Mục tiêu
- **Môn học:** Phân tích và Thiết kế Hệ thống (IT3120) - Trường CNTT&TT (SOICT), ĐH Bách khoa Hà Nội.
- **Đề tài:** Hệ thống Quản lý Đào tạo trong môi trường Đại học (theo học chế tín chỉ).
- **Đặc thù dự án:** Không viết mã nguồn phần mềm (No-code), chỉ tập trung vào khảo sát, phân tích nghiệp vụ, đặc tả yêu cầu và thiết kế hệ thống biểu đồ UML + Cơ sở dữ liệu.
- **Quy trình làm việc (Hybrid Workflow):**
  - Văn bản báo cáo, bảng biểu: Soạn thảo cộng tác trực tiếp trên Google Docs, xuất ra `.docx` và `.pdf`.
  - Quản lý mã nguồn biểu đồ: Dùng **PlantUML (`.puml`)** lưu trữ và quản lý phiên bản trên GitHub.

## 2. Phạm vi Hệ thống (Scope)
- **Trong phạm vi (In-scope):**
  - Quản lý danh mục Chương trình đào tạo (CTĐT), học phần và điều kiện học phần tiên quyết.
  - Tổ chức giảng dạy: Mở lớp học phần theo học kỳ, phân công giảng viên, xếp phòng học và thời khóa biểu.
  - Đăng ký học phần (đăng ký, rút, hủy) và tính toán công nợ học phí, thanh toán, miễn giảm.
  - Quản lý kết quả học tập: Nhập điểm thành phần, công bố điểm, phúc khảo, tính GPA/CPA và xét cảnh báo học vụ.
  - Quản lý tài khoản, phân quyền và thông báo.
  - *Xét tốt nghiệp:* Chỉ giữ ở mức liệt kê Use Case tổng quan, không phân tích sâu.
- **Ngoài phạm vi (Out-of-scope):** Tuyển sinh, ký túc xá, học bổng, nghiên cứu khoa học, đồ án tốt nghiệp, LMS (bài giảng/bài tập online), lịch thi.

## 3. Danh mục Tác nhân (Actors)
1. **Sinh viên (Student):** Tra cứu CTĐT, đăng ký/rút học phần, xem TKB, thanh toán học phí, xem điểm/GPA/cảnh báo học vụ, gửi đơn phúc khảo.
2. **Giảng viên (Instructor):** Xem lịch giảng dạy, danh sách lớp học phần, nhập điểm thành phần và xử lý phúc khảo.
3. **Cán bộ Phòng Đào tạo (Academic Affairs Staff):** Quản lý khung CTĐT, mở đợt đăng ký, mở lớp học phần, xếp thời khóa biểu, khóa bảng điểm, xét cảnh báo học vụ.
4. **Cán bộ Khoa/Viện (Faculty Staff / Advisor):** Đề xuất học phần, phân công giảng viên, tư vấn và theo dõi tiến độ học tập của sinh viên (kiêm vai trò Cố vấn học tập).
5. **Cán bộ Tài chính (Finance Staff):** Thiết lập đơn giá tín chỉ, quản lý hóa đơn học phí, đối soát thanh toán và miễn giảm.
6. **Quản trị hệ thống (System Admin):** Quản lý người dùng, phân quyền (Role-based), cấu hình hệ thống.
7. **Hệ thống ngoài (External Systems):** Cổng thanh toán trực tuyến (Payment Gateway), Dịch vụ gửi Email (Email Service).

## 4. Từ điển Thuật ngữ Chuẩn (Glossary)
- **Học phần (`Course`):** Đơn vị kiến thức trong CTĐT, có mã học phần (VD: IT3120), số tín chỉ, điều kiện tiên quyết.
- **Lớp học phần (`ClassSection`):** Một lần mở của Học phần trong một Học kỳ cụ thể, gắn với giảng viên, phòng học, kíp học và giới hạn sĩ số.
- **Đăng ký (`Registration`):** Bản ghi thể hiện việc một Sinh viên đăng ký học một Lớp học phần cụ thể.
- **Lớp hành chính (`AdminClass`):** Lớp sinh hoạt chung của sinh viên theo khóa/ngành (khác với Lớp học phần).

## 5. Phân rã 4 Module và Quyền sở hữu Thực thể (Entity Ownership)
Hệ thống được chia thành 4 Module độc lập cho 4 thành viên. **Quy tắc bất di bất dịch:** Mỗi thực thể chỉ có 1 Module làm chủ (Owner). Module khác chỉ được tham chiếu qua khóa ngoại `ID` hoặc gọi qua hàm Interface, tuyệt đối không tự ý thêm thuộc tính vào thực thể của module khác.

| Mã Module | Tên Module | Thực thể sở hữu (Entities) |
|---|---|---|
| **CUR** | Danh mục & Hệ thống | `User`, `Role`, `Notification`, `Faculty`, `Major`, `Program`, `Course`, `Prerequisite`, `Student`, `Instructor`, `AdminClass` |
| **SCH** | Tổ chức Giảng dạy | `Semester`, `ClassSection`, `Room`, `ScheduleSlot`, `InstructorAssignment` |
| **REG** | Đăng ký HP & Học phí | `RegistrationPeriod`, `Registration`, `TuitionRate`, `Invoice`, `Payment`, `Waiver` |
| **GRD** | Kết quả Học tập | `GradeComponent`, `Grade`, `GradeAppeal`, `AcademicRecord`, `AcademicWarning` |

## 6. Vòng đời Trạng thái Thực thể Chuẩn (Standard State Lifecycles)
- **`ClassSection`:** `DRAFT` (Nháp) → `OPEN_FOR_REG` (Mở ĐK) → `CLOSED_FOR_REG` (Đóng ĐK) → `IN_PROGRESS` (Đang học) → `COMPLETED` (Kết thúc) | `CANCELLED` (Hủy lớp).
- **`Registration`:** `REGISTERED` (Đã đăng ký) → `WITHDRAWN` (Đã rút) | `CANCELLED` (Bị hủy do lớp hủy).
- **`Grade`:** `DRAFT` (Nháp) → `PUBLISHED` (Đã công bố) → `LOCKED` (Đã khóa - chỉ sửa được qua quy trình Phúc khảo `GradeAppeal`).
- **`Invoice`:** `UNPAID` (Chưa thanh toán) → `PAID` (Đã thanh toán) | `OVERDUE` (Quá hạn).

