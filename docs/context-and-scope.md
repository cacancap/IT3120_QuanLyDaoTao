# BỐI CẢNH DỰ ÁN & KIẾN TRÚC TỔNG THỂ: HỆ THỐNG QUẢN LÝ ĐÀO TẠO ĐẠI HỌC (IT3120)

> **Môn học:** Phân tích và Thiết kế Hệ thống (IT3120) - Trường CNTT&TT (SOICT), ĐH Bách khoa Hà Nội.  
> **Đặc thù dự án:** Phân tích nghiệp vụ, mô hình hóa UML (PlantUML) & Thiết kế CSDL (PostgreSQL). Không viết mã nguồn phần mềm (No-code).  
> **Phương pháp tiếp cận:** Tư duy hệ thống (Systems Thinking), Khung DVF, và Quy trình phát triển hướng đối tượng (OOAD).

---

## 1. Phát biểu Bài toán Nghiệp vụ theo Chuẩn Systems Thinking (Slide L02)

| Khía cạnh | Nội dung phân tích cụ thể cho Đề tài Quản lý Đào tạo |
|---|---|
| **1. Situation (Bối cảnh)** | Các trường đại học quy mô lớn (như ĐHBK Hà Nội với 35.000+ sinh viên) vận hành theo học chế tín chỉ: sinh viên được chủ động xây dựng lộ trình học tập, đăng ký học phần, giảng viên quản lý điểm thành phần và phòng Đào tạo quản lý khung CTĐT. |
| **2. Problem (Vấn đề)** | • **Nghẽn mạng & xung đột:** Sinh viên ồ ạt đăng ký học phần vào các khung giờ mở cổng gây nghẽn hệ thống; dễ xảy ra tranh chấp dữ liệu khi lớp sắp đầy sĩ số.<br>• **Vi phạm điều kiện tiên quyết:** Đăng ký môn học khi chưa hoàn thành môn tiên quyết hoặc vi phạm ràng buộc đồ thị (vòng lặp tiên quyết).<br>• **Trùng lịch & quá tải:** Xung đột thời khóa biểu phòng học, trùng kíp dạy của giảng viên.<br>• **Sai lệch công nợ & điểm số:** Chậm trễ trong cập nhật hóa đơn học phí khi rút/thêm môn, sai sót khi tính điểm tổng kết/GPA/CPA và chậm cảnh báo học vụ. |
| **3. Impact (Tác động)** | Gây bức xúc cho sinh viên, gia tăng áp lực giải quyết khiếu nại cho Phòng Đào tạo và Cán bộ Khoa, nguy cơ sai sót học phí và chậm trễ trong việc xét tốt nghiệp / cảnh báo học vụ. |
| **4. Need & Goal (Nhu cầu & Mục tiêu)** | Xây dựng một hệ thống phần mềm quản lý đào tạo hợp nhất, tự động hóa toàn bộ việc kiểm tra ràng buộc nghiệp vụ (BR-01..10) theo thời gian thực, đảm bảo tính nhất quán dữ liệu và tối ưu trải nghiệm người dùng. |
| **5. Value (Giá trị mang lại)** | • **Sinh viên:** Đăng ký công bằng, minh bạch, tra cứu kết quả học tập và công nợ tức thời.<br>• **Giảng viên:** Quản lý lớp học phần, nhập điểm tiện lợi và bảo mật.<br>• **Nhà trường:** Tối ưu hóa phòng học, giảm thiểu sai sót thủ công và nâng cao chất lượng quản trị đào tạo. |

---

## 2. Đánh giá Tính Khả thi Hệ thống (Feasibility Study theo Khung DVF - Slide L02)

1. **Khả thi về Mong muốn (Desirability):**
   * Nhu cầu số hóa của các trường đại học tín chỉ là bắt buộc và cấp thiết.
   * Sinh viên và giảng viên có động lực sử dụng cao vì giao diện trực tuyến giúp tiết kiệm thời gian xếp hàng, nộp đơn thủ công.
2. **Khả thi về Kỹ thuật (Technical Feasibility):**
   * *Thuật toán:* Áp dụng thuật toán duyệt đồ thị có hướng (DAG Cycle Detection) kiểm tra vòng lặp tiên quyết, thuật toán kiểm tra giao đoạn thời gian `(StartA < EndB) AND (EndA > StartB)` chống trùng lịch.
   * *Kiến trúc & CSDL:* Áp dụng kiến trúc 3 lớp (3-Tier Layered Architecture) và CSDL quan hệ PostgreSQL với các ràng buộc CHECK, ENUM, UNIQUE và Index tối ưu truy vấn.
3. **Khả thi về Vận hành (Operational Feasibility):**
   * Phân quyền rõ ràng (Role-based Access Control) cho 7 tác nhân.
   * 4 phân hệ (CUR, SCH, REG, GRD) có ranh giới thực thể độc lập, giao tiếp qua Interface, đảm bảo tính vận hành trơn tru giữa các phòng ban.
4. **Khả thi về Kinh tế (Economic Viability / Feasibility):**
   * Chi phí ước lượng phần mềm được tính toán bài bản theo phương pháp Use Case Points (UCP - Chương 5). Tiết kiệm chi phí nhân sự đối soát thủ công hàng kỳ.

---

## 3. Phân tích Các bên liên quan (Stakeholder Analysis - Slide L02)

| Tác nhân (Actor / Stakeholder) | Vai trò & Trách nhiệm chính trong Hệ thống |
|---|---|
| **Sinh viên (Student)** | Tra cứu CTĐT, đăng ký/rút học phần, xem TKB, thanh toán học phí, xem điểm/GPA/cảnh báo học vụ, gửi đơn phúc khảo. |
| **Giảng viên (Instructor)** | Xem lịch giảng dạy, danh sách sinh viên lớp học phần, nhập điểm quá trình/cuối kỳ và xử lý đơn phúc khảo. |
| **Cán bộ Phòng Đào tạo (Academic Affairs Staff)** | Quản lý khung CTĐT, mở đợt đăng ký, mở lớp học phần, xếp phòng học và TKB, khóa bảng điểm, xét cảnh báo học vụ. |
| **Cán bộ Khoa/Viện (Faculty Staff / Advisor)** | Đề xuất học phần, phân công giảng viên giảng dạy, tư vấn tiến độ học tập (Cố vấn học tập). |
| **Cán bộ Tài chính (Finance Staff)** | Thiết lập định mức học phí tín chỉ, quản lý hóa đơn, đối soát thanh toán và miễn giảm. |
| **Quản trị hệ thống (System Admin)** | Quản lý tài khoản, phân quyền Role-based, theo dõi nhật ký hệ thống. |
| **Cổng thanh toán trực tuyến (Payment Gateway)** | Hệ thống ngoài: Tiếp nhận yêu cầu thanh toán học phí và phản hồi kết quả giao dịch. |
| **Dịch vụ Email (Email Service)** | Hệ thống ngoài: Gửi thông báo đợt đăng ký, cảnh báo học vụ, hóa đơn học phí. |

---

## 4. Phạm vi Hệ thống (Scope)
- **Trong phạm vi (In-scope):**
  - Quản lý danh mục Chương trình đào tạo (CTĐT), học phần và điều kiện học phần tiên quyết (CUR).
  - Tổ chức giảng dạy: Mở lớp học phần theo học kỳ, phân công giảng viên, xếp phòng học và thời khóa biểu (SCH).
  - Đăng ký học phần (đăng ký, rút, hủy) và tính toán công nợ học phí, thanh toán, miễn giảm (REG).
  - Quản lý kết quả học tập: Nhập điểm thành phần, công bố điểm, phúc khảo, tính GPA/CPA và xét cảnh báo học vụ (GRD).
  - Quản lý tài khoản, phân quyền và thông báo.
  - *Xét tốt nghiệp:* Chỉ giữ ở mức liệt kê Use Case tổng quan, không phân tích sâu.
- **Ngoài phạm vi (Out-of-scope):** Tuyển sinh, ký túc xá, học bổng, nghiên cứu khoa học, đồ án tốt nghiệp, LMS (bài giảng/bài tập online), lịch thi.

---

## 5. Từ điển Thuật ngữ Chuẩn (Glossary)
- **Học phần (`Course`):** Đơn vị kiến thức trong CTĐT, có mã học phần (VD: IT3120), số tín chỉ, điều kiện tiên quyết.
- **Lớp học phần (`ClassSection`):** Một lần mở của Học phần trong một Học kỳ cụ thể, gắn với giảng viên, phòng học, kíp học và giới hạn sĩ số.
- **Đăng ký (`Registration`):** Bản ghi thể hiện việc một Sinh viên đăng ký học một Lớp học phần cụ thể.
- **Lớp hành chính (`AdminClass`):** Lớp sinh hoạt chung của sinh viên theo khóa/ngành (khác với Lớp học phần).

---

## 6. Phân rã 4 Module và Quyền sở hữu Thực thể (Entity Ownership)
Mỗi thực thể chỉ có 1 Module làm chủ (Owner). Module khác chỉ được tham chiếu qua khóa ngoại hoặc gọi qua hàm Interface:

| Mã Module | Tên Module | Thực thể sở hữu (Entities) |
|---|---|---|
| **CUR** | Danh mục & Hệ thống | `User`, `Role`, `Notification`, `Faculty`, `Major`, `Program`, `Course`, `Prerequisite`, `Student`, `Instructor`, `AdminClass` |
| **SCH** | Tổ chức Giảng dạy | `Semester`, `ClassSection`, `Room`, `ScheduleSlot`, `InstructorAssignment` |
| **REG** | Đăng ký HP & Học phí | `RegistrationPeriod`, `Registration`, `TuitionRate`, `Invoice`, `Payment`, `Waiver` |
| **GRD** | Kết quả Học tập | `GradeComponent`, `Grade`, `GradeAppeal`, `AcademicRecord`, `AcademicWarning` |

---

## 7. Vòng đời Trạng thái Thực thể Chuẩn (Standard State Lifecycles)
- **`ClassSection`:** `DRAFT` (Nháp) $\to$ `OPEN_FOR_REG` (Mở ĐK) $\to$ `CLOSED_FOR_REG` (Đóng ĐK) $\to$ `IN_PROGRESS` (Đang học) $\to$ `COMPLETED` (Kết thúc) | `CANCELLED` (Hủy lớp).
- **`Registration`:** `REGISTERED` (Đã đăng ký) $\to$ `WITHDRAWN` (Đã rút) | `CANCELLED` (Bị hủy do lớp hủy).
- **`Grade`:** `DRAFT` (Nháp) $\to$ `PUBLISHED` (Đã công bố) $\to$ `UNDER_APPEAL` (Đang phúc khảo) $\to$ `LOCKED` (Đã khóa).
- **`Invoice`:** `UNPAID` (Chưa thanh toán) $\to$ `PARTIALLY_PAID` $\to$ `PAID` (Đã thanh toán) | `OVERDUE` (Quá hạn).
