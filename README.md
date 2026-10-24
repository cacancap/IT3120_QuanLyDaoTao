# IT3120 - HỆ THỐNG QUẢN LÝ ĐÀO TẠO ĐẠI HỌC (HỌC CHẾ TÍN CHỈ)

> **Môn học:** Phân tích và Thiết kế Hệ thống (IT3120)  
> **Đơn vị:** Trường Công nghệ Thông tin & Truyền thông (SOICT) – Đại học Bách khoa Hà Nội  
> **Đặc thù dự án:** Phân tích nghiệp vụ, mô hình hóa UML (PlantUML) & Thiết kế CSDL (PostgreSQL). Không phát triển mã nguồn phần mềm thực thi (No-code).  
> **Mô hình phối hợp:** Phễu song song 4 thành viên (Funnel Parallel Model) – Chuyên môn hóa 100% theo 4 Phân hệ nghiệp vụ.

---

## 📌 BẢNG ĐIỀU HƯỚNG TÀI NGUYÊN DỰ ÁN

| Danh mục | Đường dẫn thư mục / Tệp tin | Mô tả nội dung chính |
|---|---|---|
| 🌟 **Tài liệu Nghiệp vụ Master (TH1 $\to$ TH5)** | [`docs/problem-discovery-and-system-request.md`](./docs/problem-discovery-and-system-request.md) | Hồ sơ tổng thể: Khám phá nhu cầu, Canvas 6 ô, 5 Whys, Lean UX Canvas, Kế hoạch thử nghiệm MVP & System Request *(65+ KB)* |
| 🖥️ **Slide Thuyết trình Marp Master (Buổi TH1)** | [`slides/BuoiTH1_Master_Discovery_LeanUX.md`](./slides/BuoiTH1_Master_Discovery_LeanUX.md) | Bộ 22 slide chuẩn Marp Markdown (16:9), tích hợp liền mạch trọn vẹn 5 bài thực hành Buổi 1 |
| 🌟 **Bức tranh Toàn cảnh & Sợi chỉ đỏ** | [`docs/big-picture-and-red-thread.md`](./docs/big-picture-and-red-thread.md) | Xâu chuỗi 5 tầng chuyển đổi từ bài giảng lý thuyết đến kiến trúc kỹ thuật |
| 📋 **Tài liệu Bối cảnh & Phạm vi** | [`docs/context-and-scope.md`](./docs/context-and-scope.md) | Bối cảnh, mục tiêu, In/Out-of-scope, Danh mục Actors, Glossary |
| 🏷️ **Quy ước & Định danh** | [`docs/conventions-and-naming.md`](./docs/conventions-and-naming.md) | Quy ước đặt tên mã `FR`, `UC`, `BR`, `SCR`, PascalCase, camelCase, snake_case |
| ⚖️ **10 Quy tắc Nghiệp vụ Cốt lõi** | [`docs/business-rules.md`](./docs/business-rules.md) | Đặc tả chi tiết logic nghiệp vụ kiểm tra từ `BR-01` đến `BR-10` |
| 🔌 **Ma trận Giao tiếp Liên Module** | [`docs/interfaces-matrix.md`](./docs/interfaces-matrix.md) | 6 Chữ ký hàm gọi chéo giữa 4 phân hệ (Inter-Module Interfaces) |
| 👥 **Lộ trình Nhóm & Kế hoạch Phối hợp** | [`docs/team-roadmap.md`](./docs/team-roadmap.md) | Quy chuẩn kỹ thuật, phân công chi tiết và các mốc bàn giao |
| 📐 **Đặc tả Ca sử dụng Lõi** | [`docs/use-cases/`](./docs/use-cases/) | Bảng đặc tả chi tiết các use case lõi (`UC-CUR-01`, `UC-SCH-01`, `UC-REG-01`, `UC-GRD-01`) |
| 🧮 **Ước lượng Chi phí Phần mềm (UCP)** | [`docs/ucp-estimation.md`](./docs/ucp-estimation.md) | Công thức và bảng tính chi phí phần mềm theo Use Case Points (UAW, UUCW, TCF, ECF) |
| 🗄️ **Thiết kế CSDL (PostgreSQL)** | [`database/`](./database/) | [Mã nguồn DDL `schema.sql`](./database/schema.sql) và [Từ điển dữ liệu `data-dictionary.md`](./database/data-dictionary.md) |
| 📊 **Mã nguồn Biểu đồ PlantUML** | [`diagrams/`](./diagrams/) | Mã nguồn `.puml` cho Domain Model, Sequence BCE, Use Case, State Machine |
| 🖼️ **Ảnh Biểu đồ đã kết xuất** | [`renders/`](./renders/) | Ảnh `.png` kết xuất tự động từ PlantUML phục vụ nhúng vào báo cáo |
| 📑 **Khung Mục lục Báo cáo Đồ án** | [`report/report-outline.md`](./report/report-outline.md) | Cấu trúc chuẩn 5 chương nộp báo cáo tổng kết môn học |
| 🐙 **Quy trình Git & GitHub** | [`docs/git-workflow.md`](./docs/git-workflow.md) | Quy chuẩn tạo nhánh, cú pháp commit, mở Pull Request và CI/CD |

---

## 👥 BẢNG PHÂN CÔNG CHUYÊN MÔN HÓA 4 THÀNH VIÊN (100% MODULE-BASED)

Áp dụng nguyên tắc **Mỗi thành viên làm chủ trọn vẹn 1 Phân hệ Nghiệp vụ (1-on-1 Module Ownership)** xuyên suốt cả kỳ học:

| Thành viên | Phân hệ Làm chủ | Đối tượng Trọng tâm | Thực thể CSDL Sở hữu | Ca sử dụng Lõi Phân tích Sâu | Trách nhiệm Điều phối Chung |
|:---:|:---:|:---:|---|---|---|
| **Thành viên A**<br>*(Team Lead)* | **REG**<br>(Đăng ký HP & Học phí) | **Sinh viên** | `RegistrationPeriod`, `Registration`, `TuitionRate`, `Invoice`, `Payment`, `Waiver` | **`UC-REG-01`**<br>Đăng ký học phần (Kiểm tra điều kiện & tính học phí) | • Quản trị GitHub Repo<br>• Trọng tâm Buổi TH1 (Lead case Sinh viên)<br>• Tính toán chi phí theo UCP |
| **Thành viên B** | **GRD**<br>(Kết quả Học tập) | **Giảng viên** | `GradeComponent`, `Grade`, `GradeAppeal`, `AcademicRecord`, `AcademicWarning` | **`UC-GRD-01`**<br>Nhập điểm, công bố điểm & Xét cảnh báo học vụ | • Chuẩn hóa Quy tắc nghiệp vụ BR-07..10<br>• Quản trị CSDL & Data Dictionary<br>• Lập Ma trận truy vết (Traceability) |
| **Thành viên C** | **SCH**<br>(Tổ chức Giảng dạy) | **Cán bộ Lập lịch (PĐT)** | `Semester`, `ClassSection`, `Room`, `ScheduleSlot`, `InstructorAssignment` | **`UC-SCH-01`**<br>Mở lớp học phần & Xếp TKB phòng học | • Thiết kế Kiến trúc Logic & Triển khai<br>• Đặc tả Yêu cầu phi chức năng (FURPS+)<br>• Quản trị Biểu đồ PlantUML & renders |
| **Thành viên D** | **CUR**<br>(Chương trình Đào tạo) | **Cán bộ CTĐT (Khoa/PĐT)** | `User`, `Role`, `Faculty`, `Major`, `Program`, `Course`, `Prerequisite`, `Student`, `Instructor`, `AdminClass` | **`UC-CUR-01`**<br>Xây dựng khung CTĐT & Thuật toán DAG | • Khảo sát bối cảnh & Chương 1 Báo cáo<br>• Kiểm soát chu trình tiên quyết DAG<br>• Định dạng & kiểm tra báo cáo cuối |

---

## 🛠️ QUY CHUẨN KỸ THUẬT & CÔNG CỤ HỖ TRỢ

1. **Nguyên tắc Sở hữu Thực thể (Entity Ownership):**
   * Mỗi thực thể chỉ do duy nhất 1 Module làm chủ sở hữu.
   * Khi module khác cần truy xuất dữ liệu, **bắt buộc** gọi thông qua 6 Chữ ký hàm chuẩn trong [`docs/interfaces-matrix.md`](./docs/interfaces-matrix.md).
2. **Quy ước Commit Git:**
   * Cú pháp: `[<MÃ_MODULE>] <Hành động>: <Nội dung chi tiết>`
   * Ví dụ:
     * `[REG] Add: UC-REG-01 sequence diagram and activity diagram`
     * `[GRD] Fix: Update grade state machine and warning levels`
     * `[DOCS] Update: Refine master discovery and system request`
3. **Kết xuất Biểu đồ PlantUML:**
   * Cài extension **PlantUML** trên VS Code để xem trước trực tiếp (`Alt + D`).
   * Chạy script PowerShell: `./scripts/render.ps1` để xuất ảnh toàn bộ vào thư mục `renders/`.
   * GitHub Actions sẽ tự động kiểm tra cú pháp và kết xuất ảnh khi có commit push lên GitHub.
