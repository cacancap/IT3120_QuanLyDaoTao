# IT3120 - HỆ THỐNG QUẢN LÝ ĐÀO TẠO ĐẠI HỌC (HỌC CHẾ TÍN CHỈ)

> **Môn học:** Phân tích và Thiết kế Hệ thống (IT3120)  
> **Đơn vị:** Trường Công nghệ Thông tin & Truyền thông (SOICT) – Đại học Bách khoa Hà Nội  
> **Đặc thù dự án:** Phân tích nghiệp vụ, mô hình hóa UML (PlantUML) & Thiết kế CSDL (PostgreSQL). Không phát triển mã nguồn phần mềm (No-code).  
> **Mô hình làm việc (Hybrid):** Soạn thảo báo cáo trên Google Docs + Quản lý mã nguồn biểu đồ & tài liệu kỹ thuật trên GitHub.

---

## 📌 BẢNG ĐIỀU HƯỚNG TÀI LIỆU DỰ ÁN

| Danh mục | Đường dẫn thư mục / Tệp tin | Mô tả nội dung |
|---|---|---|
| 📋 **Tài liệu Bối cảnh & Phạm vi** | [`docs/context-and-scope.md`](./docs/context-and-scope.md) | Bối cảnh, mục tiêu, In/Out-of-scope, Actors, Glossary |
| 🏷️ **Quy ước & Định danh** | [`docs/conventions-and-naming.md`](./docs/conventions-and-naming.md) | Quy ước đặt tên mã `FR`, `UC`, `BR`, `SCR`, PascalCase, camelCase |
| ⚖️ **10 Quy tắc Nghiệp vụ** | [`docs/business-rules.md`](./docs/business-rules.md) | Đặc tả logic kiểm tra chi tiết từ `BR-01` đến `BR-10` |
| 🔌 **Ma trận Giao tiếp Liên Module** | [`docs/interfaces-matrix.md`](./docs/interfaces-matrix.md) | 6 Chữ ký hàm gọi chéo giữa các phân hệ (Inter-Module Interfaces) |
| 👥 **Phân công & Lộ trình** | [`docs/team-roadmap.md`](./docs/team-roadmap.md) | Bảng trách nhiệm 4 thành viên và tiến độ 3 tuần |
| 📐 **Đặc tả Ca sử dụng Lõi** | [`docs/use-cases/`](./docs/use-cases/) | Bảng đặc tả chi tiết các use case lõi (`UC-CUR-01`, `UC-SCH-01`, `UC-REG-01`, `UC-GRD-01`) |
| 🧮 **Ước lượng Chi phí (UCP)** | [`docs/ucp-estimation.md`](./docs/ucp-estimation.md) | Hướng dẫn và công thức tính UAW, UUCW, TCF, ECF, UCP, Effort |
| 🗄️ **Thiết kế CSDL (PostgreSQL)** | [`database/`](./database/) | [Mã nguồn DDL `schema.sql`](./database/schema.sql) và [Từ điển dữ liệu `data-dictionary.md`](./database/data-dictionary.md) |
| 📊 **Mã nguồn Biểu đồ PlantUML** | [`diagrams/`](./diagrams/) | Mã `.puml` cho Domain Model, Sequence, Use Case, State Machine |
| 🖼️ **Ảnh Biểu đồ đã kết xuất** | [`renders/`](./renders/) | Thư mục chứa ảnh `.png` phục vụ chèn trực tiếp vào báo cáo |
| 📑 **Khung Mục lục Báo cáo** | [`report/report-outline.md`](./report/report-outline.md) | Cấu trúc chuẩn 6 chương nộp bài tập lớn |
| 🐙 **Quy trình Git & GitHub** | [`docs/git-workflow.md`](./docs/git-workflow.md) | Quy chuẩn tạo nhánh, commit, mở Pull Request và xử lý CI/CD |

---

## 👥 BẢNG PHÂN CÔNG TRÁCH NHIỆM 4 THÀNH VIÊN

| Thành viên | Module Phụ trách | Thực thể Sở hữu | Ca sử dụng Lõi Phân tích Sâu | Trách nhiệm Chung Kiêm nhiệm |
|:---:|:---:|---|---|---|
| **Thành viên A** | **CUR**<br>(Danh mục & Hệ thống) | `User`, `Role`, `Faculty`, `Major`, `Program`, `Course`, `Prerequisite`, `Student`, `Instructor`, `AdminClass` | **`UC-CUR-01`**<br>Xây dựng khung CTĐT & thuật toán DAG chống lặp | • Quản trị GitHub Repo<br>• Lời nói đầu, Chương 1, Chương 6<br>• Use Case tổng quan, State `ClassSection`<br>• Ghép nối & format báo cáo cuối |
| **Thành viên B** | **SCH**<br>(Tổ chức Giảng dạy) | `Semester`, `ClassSection`, `Room`, `ScheduleSlot`, `InstructorAssignment` | **`UC-SCH-01`**<br>Mở lớp học phần & Xếp TKB chống trùng lịch | • Soạn thảo Yêu cầu phi chức năng (NFR)<br>• Thiết kế Kiến trúc Logic & Triển khai<br>• Thiết kế Slide thuyết trình bảo vệ |
| **Thành viên C** | **REG**<br>(Đăng ký & Học phí) | `RegistrationPeriod`, `Registration`, `TuitionRate`, `Invoice`, `Payment`, `Waiver` | **`UC-REG-01`**<br>Đăng ký học phần (tích hợp BR-01..05 & tính học phí BR-06) | • Chuẩn hóa Quy tắc nghiệp vụ BR-01..06<br>• Vẽ State Diagram cho `Registration` & `Invoice`<br>• Tính toán chi phí phần mềm theo **UCP** |
| **Thành viên D** | **GRD**<br>(Kết quả Học tập) | `GradeComponent`, `Grade`, `GradeAppeal`, `AcademicRecord`, `AcademicWarning` | **`UC-GRD-01`**<br>Nhập điểm, công bố điểm, tính GPA/CPA & Xét học vụ | • Chuẩn hóa Quy tắc nghiệp vụ BR-07..10<br>• Vẽ **Domain Model** & **ERD tổng thể**<br>• Xây dựng **Data Dictionary** CSDL<br>• Lập Ma trận truy vết (Traceability Matrix) |

---

## 🛠️ QUY CHUẨN LÀM VIỆC & QUẢN LÝ PHIÊN BẢN

1. **Quy tắc sở hữu thực thể (Entity Ownership):**
   - Mỗi thực thể chỉ do duy nhất 1 Module làm chủ.
   - Khi module khác cần dữ liệu, **bắt buộc** gọi thông qua 6 Chữ ký hàm chuẩn trong [`docs/interfaces-matrix.md`](./docs/interfaces-matrix.md).
2. **Quy ước Commit Git:**
   - Cú pháp: `[<MÃ_MODULE>] <Hành động>: <Nội dung chi tiết>`
   - Ví dụ:
     - `[REG] Add: UC-REG-01 sequence diagram and activity diagram`
     - `[GRD] Fix: Update grade state machine and BR-07 formula`
     - `[DOCS] Update: Add PostgreSQL DDL schema and data dictionary`
3. **Cách kết xuất biểu đồ PlantUML:**
   - Cài extension **PlantUML** trên VS Code để xem trước trực tiếp (`Alt + D`).
   - Chạy script PowerShell: `./scripts/render.ps1` để xuất ảnh toàn bộ ra `renders/`.
   - GitHub Actions sẽ tự động biên dịch toàn bộ file `.puml` sang `.png` trong thư mục `renders/` khi có commit push lên nhánh chính.