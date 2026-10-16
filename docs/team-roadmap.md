# PHÂN CÔNG NHIỆM VỤ 4 THÀNH VIÊN & LỘ TRÌNH THỰC HIỆN

## 1. Bảng Phân công Trách nhiệm Chi tiết

| Thành viên | Phụ trách Module | Use Case Lõi làm sâu (Đặc tả + Activity + BCE + Sequence + State) | Công việc Chung kiêm nhiệm |
|---|---|---|---|
| **Thành viên A** | **CUR** (Danh mục & Hệ thống) | **UC-CUR-01:** Xây dựng & cập nhật khung CTĐT (tích hợp thuật toán kiểm tra đồ thị DAG chặn vòng lặp môn tiên quyết). | - Khởi tạo & quản lý GitHub Repo.<br>- Viết Lời nói đầu, **Chương 1 (Khảo sát)**, **Chương 6 (Kết luận)**.<br>- Vẽ Use Case tổng quan toàn hệ thống.<br>- Vẽ State Diagram cho `ClassSection`.<br>- Ghép nối và định dạng file Báo cáo cuối (`.docx`, `.pdf`). |
| **Thành viên B** | **SCH** (Tổ chức Giảng dạy) | **UC-SCH-01:** Mở lớp học phần & Xếp thời khóa biểu (kiểm tra xung đột lịch phòng học và lịch giảng viên). | - Viết phần **Yêu cầu phi chức năng (NFR)** ở Chương 2.<br>- Thiết kế **Kiến trúc Logic & Kiến trúc Triển khai** ở Chương 4.<br>- Thiết kế bộ Slide thuyết trình bảo vệ đồ án. |
| **Thành viên C** | **REG** (Đăng ký HP & Học phí) | **UC-REG-01:** Đăng ký học phần (luồng phức tạp nhất, kiểm tra toàn bộ ràng buộc BR-01 đến BR-05 và tính học phí BR-06). | - Chuẩn hóa bảng Quy tắc nghiệp vụ `BR-01..BR-06`.<br>- Vẽ State Diagram cho `Registration` và `Invoice`.<br>- Tính toán **Chương 5: Ước lượng chi phí phần mềm (UCP - Use Case Points)**. |
| **Thành viên D** | **GRD** (Kết quả Học tập) | **UC-GRD-01:** Nhập điểm thành phần → Tính điểm tổng kết → Cập nhật GPA/CPA & Xét cảnh báo học vụ. | - Chuẩn hóa bảng Quy tắc nghiệp vụ `BR-07..BR-10`.<br>- Vẽ **Biểu đồ Lớp miền tổng (Domain Model)** ở Chương 3.<br>- Vẽ **ERD tổng thể & Từ điển dữ liệu** ở Chương 4.<br>- Vẽ State Diagram cho `Grade`.<br>- Lập Ma trận truy vết (Traceability Matrix) & Rà soát tính nhất quán cuối kỳ. |

---

## 2. Lộ trình Phối hợp 3 Chặng (3 Tuần)

### Chặng 1: Nền tảng (Ngày 1 - Ngày 7)
- **Mốc 1 (Ngày 1 - 3):**
  - Chốt cứng tài liệu Phase 0 và 6 chữ ký hàm Interface.
  - Thành viên A tạo Repo GitHub và tài liệu Google Docs khung.
  - Thành viên D phác thảo sơ bộ **Domain Model** chứa toàn bộ 27 thực thể của 4 module.
- **Mốc 2 (Ngày 4 - 7):**
  - Thành viên A hoàn thành Chương 1.
  - Cả 4 thành viên liệt kê đầy đủ danh sách Yêu cầu chức năng (`FR-<MOD>-nn`) và danh sách Use Case (`UC-<MOD>-nn`) của module mình.
  - Rà soát chéo: Đảm bảo không trùng lặp Use Case và tên Actor thống nhất 100%.

### Chặng 2: Phân tích & Thiết kế Chi tiết (Ngày 8 - Ngày 14)
- **Mốc 3 (Ngày 8 - 11):**
  - Mỗi thành viên viết Bảng đặc tả chi tiết và vẽ bộ 3 biểu đồ (**Activity có Swimlane, Lớp phân tích BCE, Sequence**) cho Use Case lõi của mình bằng PlantUML.
- **Mốc 4 (Ngày 12 - 14):**
  - Hoàn thiện các Biểu đồ Trạng thái (State Diagram).
  - Thành viên B vẽ Biểu đồ Kiến trúc Logic & Triển khai.
  - Thành viên D gom các thực thể từ các biểu đồ BCE/Sequence để chuẩn hóa thành **ERD Tổng thể** và viết bảng Đặc tả CSDL.
  - Kiểm tra khớp nối: Đảm bảo các thông điệp gọi chéo giữa REG, GRD, SCH, CUR trong Sequence Diagram khớp hoàn toàn với 6 chữ ký hàm Interface.

### Chặng 3: Ước lượng, Ráp nối & Hoàn thiện (Ngày 15 - Ngày 21)
- **Ngày 15 - 17:** Khóa số lượng Actor và Use Case để Thành viên C tính điểm **UCP (TCF, ECF, UUCP)**. Thành viên D lập Ma trận truy vết `FR ↔ UC ↔ Class`.
- **Ngày 18 - 21:** Thành viên A xuất báo cáo hoàn chỉnh, cả nhóm đọc rà soát lỗi chính tả, xóa bỏ ghi chú nháp, commit báo cáo cuối lên GitHub và hoàn thiện Slide bảo vệ.

