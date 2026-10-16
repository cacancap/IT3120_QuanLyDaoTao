# CẤU TRÚC MỤC LỤC BÁO CÁO CHÍNH THỨC (REPORT OUTLINE)

Khung mục lục chuẩn mực dùng để định dạng tài liệu nộp đồ án môn học Phân tích & Thiết kế Hệ thống (IT3120).

---

### LỜI NÓI ĐẦU
### DANH MỤC TỪ VIẾT TẮT & THUẬT NGỮ
### DANH MỤC BẢNG BIỂU & HÌNH VẼ

---

### CHƯƠNG 1. KHẢO SÁT BÀI TOÁN & HIỆN TRẠNG
- **1.1. Bối cảnh và sự cần thiết của hệ thống quản lý đào tạo theo tín chỉ**
- **1.2. Khảo sát hiện trạng và các bất cập trong nghiệp vụ thực tế**
  - 1.2.1. Đăng ký học phần và nghẽn mạng giờ cao điểm
  - 1.2.2. Kiểm soát điều kiện tiên quyết và cảnh báo học vụ
- **1.3. Mục tiêu và phạm vi của hệ thống (In-scope & Out-of-scope)**
- **1.4. Xác định các tác nhân (Actors) và phân quyền tổng quát**
- **1.5. Từ điển thuật ngữ nghiệp vụ (Glossary)**

---

### CHƯƠNG 2. ĐẶC TẢ YÊU CẦU HỆ THỐNG
- **2.1. Danh mục Yêu cầu chức năng (`FR`) theo 4 phân hệ (CUR, SCH, REG, GRD)**
- **2.2. Danh mục Quy tắc nghiệp vụ dùng chung (`BR-01` đến `BR-10`)**
- **2.3. Biểu đồ Ca sử dụng (Use Case Diagrams)**
  - 2.3.1. Biểu đồ phân rã gói Use Case tổng quát (Package Diagram)
  - 2.3.2. Biểu đồ Use Case phân hệ Danh mục & Hệ thống (CUR)
  - 2.3.3. Biểu đồ Use Case phân hệ Tổ chức Giảng dạy (SCH)
  - 2.3.4. Biểu đồ Use Case phân hệ Đăng ký & Học phí (REG)
  - 2.3.5. Biểu đồ Use Case phân hệ Kết quả Học tập (GRD)
- **2.4. Đặc tả chi tiết các Ca sử dụng lõi và Biểu đồ Hoạt động (Activity Diagrams)**
  - 2.4.1. `UC-CUR-01`: Xây dựng khung CTĐT và kiểm tra chu trình DAG
  - 2.4.2. `UC-SCH-01`: Mở lớp học phần và xếp TKB (kiểm tra xung đột)
  - 2.4.3. `UC-REG-01`: Đăng ký học phần (tích hợp BR-01..06)
  - 2.4.4. `UC-GRD-01`: Nhập điểm, tính GPA/CPA và xét cảnh báo học vụ
- **2.5. Đặc tả Yêu cầu phi chức năng (NFR)**
  - 2.5.1. Hiệu năng & Khả năng chịu tải đợt đăng ký
  - 2.5.2. Tính bảo mật & Toàn vẹn dữ liệu điểm số
  - 2.5.3. Độ tin cậy & Khả năng phục hồi

---

### CHƯƠNG 3. PHÂN TÍCH HỆ THỐNG
- **3.1. Biểu đồ Lớp miền tổng thể (Domain Model - 27 thực thể)**
- **3.2. Thiết kế giao diện móc nối giữa các phân hệ (Inter-Module Interfaces)**
- **3.3. Biểu đồ Lớp phân tích (BCE) và Biểu đồ Trình tự (Sequence Diagrams)**
  - 3.3.1. Phân tích `UC-CUR-01`
  - 3.3.2. Phân tích `UC-SCH-01`
  - 3.3.3. Phân tích `UC-REG-01`
  - 3.3.4. Phân tích `UC-GRD-01`
- **3.4. Biểu đồ Trạng thái (State Machine Diagrams)**
  - 3.4.1. Vòng đời Lớp học phần (`ClassSection`)
  - 3.4.2. Vòng đời Đăng ký (`Registration`) và Hóa đơn (`Invoice`)
  - 3.4.3. Vòng đời Điểm học phần (`Grade`)

---

### CHƯƠNG 4. THIẾT KẾ HỆ THỐNG
- **4.1. Thiết kế Kiến trúc hệ thống**
  - 4.1.1. Kiến trúc Logic (3-Tier Modular Architecture)
  - 4.1.2. Kiến trúc Triển khai (Deployment Diagram)
- **4.2. Thiết kế Cơ sở dữ liệu (PostgreSQL)**
  - 4.2.1. Lược đồ Thực thể - Liên kết tổng thể (ERD)
  - 4.2.2. Đặc tả chi tiết các bảng dữ liệu (Data Dictionary)
  - 4.2.3. Ràng buộc toàn vẹn và tối ưu hóa truy vấn
- **4.3. Thiết kế Giao diện người dùng (Wireframes / Mockups)**
  - 4.3.1. Màn hình Quản lý CTĐT (`SCR-CUR-01`)
  - 4.3.2. Màn hình Xếp thời khóa biểu (`SCR-SCH-01`)
  - 4.3.3. Cổng Đăng ký học phần Sinh viên (`SCR-REG-01`)
  - 4.3.4. Màn hình Nhập & Công bố Điểm (`SCR-GRD-01`)

---

### CHƯƠNG 5. ƯỚC LƯỢNG CHI PHÍ PHẦN MỀM (USE CASE POINTS - UCP)
- **5.1. Tính toán trọng số tác nhân chưa điều chỉnh (UAW)**
- **5.2. Tính toán trọng số ca sử dụng chưa điều chỉnh (UUCW)**
- **5.3. Đánh giá các hệ số phức tạp kỹ thuật (TCF) và môi trường (ECF)**
- **5.4. Tính toán điểm UCP tổng hợp và ước lượng giờ công (Man-hours)**

---

### CHƯƠNG 6. KẾT LUẬN VÀ HƯỚNG PHÁT TRIỂN
- **6.1. Đánh giá kết quả đạt được so với mục tiêu**
- **6.2. Các hạn chế còn tồn đọng**
- **6.3. Hướng phát triển và mở rộng trong tương lai**

---

### PHỤ LỤC
- **Phụ lục A:** Ma trận truy vết (Traceability Matrix: `FR ↔ UC ↔ Class ↔ Table`)
- **Phụ lục B:** Bảng phân công nhiệm vụ, tỷ lệ đóng góp & Link GitHub Repository

