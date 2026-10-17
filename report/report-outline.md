# CẤU TRÚC MỤC LỤC BÁO CÁO CHÍNH THỨC (REPORT OUTLINE)
## Môn học: Phân tích và Thiết kế Hệ thống (IT3120) - SOICT, ĐH Bách khoa Hà Nội
> Khung mục lục chuẩn học thuật, bám sát toàn bộ chuỗi bài giảng lý thuyết (Slide L01 - L10) và chuẩn báo cáo đồ án của Trường CNTT&TT.

---

### LỜI NÓI ĐẦU
### DANH MỤC TỪ VIẾT TẮT & THUẬT NGỮ (GLOSSARY)
### DANH MỤC BẢNG BIỂU & HÌNH VẼ

---

### CHƯƠNG 1. MÔ HÌNH HÓA MÔI TRƯỜNG & TÍNH KHẢ THI (ENVIRONMENT MODELING & FEASIBILITY)
*(Slide Bài 2: Environment Modeling - Systems Thinking)*
- **1.1. Bối cảnh Hệ thống & Phát biểu Bài toán Nghiệp vụ (Business Problem Formulation)**
  - 1.1.1. Situation (Bối cảnh thực tế của quản lý đào tạo theo học chế tín chỉ)
  - 1.1.2. Problem (Các bất cập, điểm nghẽn trong vận hành đào tạo hiện hành)
  - 1.1.3. Impact (Thiệt hại, rủi ro đối với sinh viên, giảng viên và nhà trường)
  - 1.1.4. Need & Goal (Nhu cầu số hóa và mục tiêu giải pháp)
  - 1.1.5. Value (Giá trị cốt lõi hệ thống mang lại cho từng nhóm đối tượng)
- **1.2. Góc nhìn của Các bên liên quan (Stakeholder Analysis)**
  - 1.2.1. Phân loại Stakeholders nội bộ (Sinh viên, Giảng viên, Cán bộ Đào tạo, Cán bộ Tài chính, Quản trị viên)
  - 1.2.2. Các bên liên quan bên ngoài (Cổng thanh toán, Dịch vụ Email)
  - 1.2.3. Biểu đồ Ngữ cảnh Môi trường (System Context Diagram)
- **1.3. Đánh giá Tính Khả thi Hệ thống (Feasibility Study theo Khung DVF)**
  - 1.3.1. Tính khả thi Mong muốn (Desirability): Mức độ cấp thiết và kỳ vọng của người dùng
  - 1.3.2. Tính khả thi Kỹ thuật (Technical Feasibility): Khả năng đáp ứng tải đăng ký giờ cao điểm, giải thuật đồ thị DAG và kiểm tra xung đột thời gian
  - 1.3.3. Tính khả thi Vận hành (Operational Feasibility): Quy trình phối hợp giữa 4 phân hệ và mức độ sẵn sàng thích ứng
  - 1.3.4. Tính khả thi Kinh tế & Lợi ích (Economic Viability / Feasibility)
- **1.4. Mục tiêu và Phạm vi Hệ thống**
  - 1.4.1. Trong phạm vi (In-scope: 4 Module CUR, SCH, REG, GRD)
  - 1.4.2. Ngoài phạm vi (Out-of-scope)
- **1.5. Kết luận Chương 1**

---

### CHƯƠNG 2. MÔ HÌNH HÓA NGHIỆP VỤ & ĐẶC TẢ YÊU CẦU (BUSINESS & REQUIREMENT MODELING)
*(Slide Bài 3 & Bài 4: Business Process, FURPS+ Requirements & Functional Modeling)*
- **2.1. Mô hình hóa Quy trình Nghiệp vụ (Business Process Modeling)**
  - 2.1.1. Bảng quy trình nghiệp vụ tổng quát (Đầu vào - Xử lý - Đầu ra)
  - 2.1.2. Ma trận phân quyền CRUD theo Tác nhân và Thực thể
- **2.2. Danh mục Yêu cầu Chức năng (`FR`) phân theo 4 Phân hệ**
  - 2.2.1. Phân hệ CUR (Danh mục & Hệ thống): `FR-CUR-01` ...
  - 2.2.2. Phân hệ SCH (Tổ chức Giảng dạy): `FR-SCH-01` ...
  - 2.2.3. Phân hệ REG (Đăng ký HP & Học phí): `FR-REG-01` ...
  - 2.2.4. Phân hệ GRD (Kết quả Học tập): `FR-GRD-01` ...
- **2.3. Danh mục 10 Quy tắc Nghiệp vụ Cốt lõi (`BR-01` đến `BR-10`)**
- **2.4. Đặc tả Yêu cầu Phi Chức năng theo Chuẩn FURPS+ (NFR)**
  - 2.4.1. **F**unctionality (Bảo mật, phân quyền Role-based, tính toàn vẹn dữ liệu)
  - 2.4.2. **U**sability (Tính thân thiện giao diện, thông báo lỗi rõ ràng theo từng BR)
  - 2.4.3. **R**eliability (Độ tin cậy dữ liệu điểm số, giao dịch học phí ACID, tính sẵn sàng cao)
  - 2.4.4. **P**erformance (Khả năng chịu tải đồng thời trong đợt đăng ký tín chỉ)
  - 2.4.5. **S**upportability (Khả năng bảo trì, mở rộng kiến trúc đa phân hệ)
- **2.5. Biểu đồ Ca Sử dụng (Use Case Diagrams)**
  - 2.5.1. Biểu đồ phân rã gói Ca sử dụng tổng quát (Package Diagram)
  - 2.5.2. Biểu đồ Use Case chi tiết 4 phân hệ (CUR, SCH, REG, GRD)
- **2.6. Đặc tả Chi tiết 4 Ca Sử dụng Lõi & Biểu đồ Hoạt động Phân làn (Activity with Swimlanes)**
  - 2.6.1. `UC-CUR-01`: Xây dựng khung CTĐT & Thuật toán kiểm tra chu trình DAG
  - 2.6.2. `UC-SCH-01`: Mở lớp học phần & Thuật toán kiểm tra xung đột thời gian phòng học/giảng viên
  - 2.6.3. `UC-REG-01`: Đăng ký học phần (tích hợp chuỗi kiểm tra BR-01..05 & tính học phí BR-06)
  - 2.6.4. `UC-GRD-01`: Nhập điểm, tính điểm tổng kết, GPA/CPA & Xét cảnh báo học vụ
- **2.7. Kết luận Chương 2**

---

### CHƯƠNG 3. PHÂN TÍCH HỆ THỐNG (SYSTEM ANALYSIS)
*(Slide Bài 5 & Bài 6: Structural & Behavioral Modeling)*
- **3.1. Phân tích Cấu trúc: Biểu đồ Lớp Miền Tổng thể (Domain Model - 27 thực thể)**
  - 3.1.1. Thực thể thuộc phân hệ CUR và cấu trúc cây chương trình đào tạo
  - 3.1.2. Thực thể thuộc phân hệ SCH và tổ chức thời khóa biểu
  - 3.1.3. Thực thể thuộc phân hệ REG và mô hình hóa đăng ký - hóa đơn
  - 3.1.4. Thực thể thuộc phân hệ GRD và cơ chế đánh giá kết quả học tập
- **3.2. Thiết kế Giao diện Móc nối Liên Module (Inter-Module Interfaces Matrix)**
  - 3.2.1. Nguyên tắc Độc lập & Sở hữu Thực thể (Entity Ownership Rules)
  - 3.2.2. Ma trận và 6 Chữ ký Hàm giao tiếp chuẩn hóa
- **3.3. Phân tích Ca Sử dụng theo Mẫu BCE (Boundary - Control - Entity) & Biểu đồ Trình tự (Sequence Diagrams)**
  - 3.3.1. Phân tích BCE & Trình tự cho `UC-CUR-01`
  - 3.3.2. Phân tích BCE & Trình tự cho `UC-SCH-01`
  - 3.3.3. Phân tích BCE & Trình tự cho `UC-REG-01` (xử lý gọi chéo 3 module)
  - 3.3.4. Phân tích BCE & Trình tự cho `UC-GRD-01` (xử lý xác thực GV và khóa điểm)
- **3.4. Mô hình hóa Hành vi: Biểu đồ Máy Trạng thái (State Machine Diagrams)**
  - 3.4.1. Vòng đời Lớp học phần (`ClassSection`: DRAFT $\to$ OPEN $\to$ CLOSED $\to$ IN_PROGRESS $\to$ COMPLETED)
  - 3.4.2. Vòng đời Đăng ký (`Registration`) và Hóa đơn học phí (`Invoice`)
  - 3.4.3. Vòng đời Điểm học phần (`Grade`: DRAFT $\to$ PUBLISHED $\to$ UNDER_APPEAL $\to$ LOCKED)
- **3.5. Kết luận Chương 3**

---

### CHƯƠNG 4. THIẾT KẾ HỆ THỐNG (SYSTEM DESIGN)
*(Slide Bài 7, Bài 8 & Bài 10: Architecture, Detailed Class & Database Design)*
- **4.1. Thiết kế Kiến trúc Hệ thống (Architecture Design)**
  - 4.1.1. Kiến trúc Logic 3 lớp (3-Tier Layered Architecture: Presentation, Business/Service, Data Storage)
  - 4.1.2. Kiến trúc Triển khai Vật lý (Deployment Diagram: Client Nodes, Application Server, PostgreSQL DB Server)
- **4.2. Thiết kế Chi tiết Lớp và Phương thức (Detailed Class & Method Design)**
  - 4.2.1. Bước chuyển tiếp từ Lớp Phân tích (BCE) sang Lớp Thiết kế (Design Class Diagram)
  - 4.2.2. Bổ sung chi tiết phạm vi truy cập (`+`, `-`, `#`), kiểu dữ liệu thuộc tính và chữ ký phương thức
- **4.3. Thiết kế Cơ sở Dữ liệu Quan hệ (PostgreSQL Database Design theo 3 Mức)**
  - 4.3.1. *Mức 1 - Khái niệm (Conceptual):* Ánh xạ từ Domain Model
  - 4.3.2. *Mức 2 - Logic (Logical Design):*
    - Quy tắc ánh xạ quan hệ Association ($1 - N$, $N - N$) sang bảng trung gian
    - Quy tắc ánh xạ kế thừa (Inheritance: Lựa chọn mô hình *Class Table / Table-per-Type* giữa `User` và `Student`, `Instructor`)
    - Chứng minh CSDL đạt Chuẩn hóa bậc 3 (3NF)
  - 4.3.3. *Mức 3 - Vật lý (Physical Design):*
    - Lược đồ Thực thể - Liên kết (ERD) chi tiết
    - Từ điển dữ liệu (Data Dictionary cho 27 bảng dữ liệu)
    - Tối ưu hóa lưu trữ, chỉ mục (Indexes) và ràng buộc toàn vẹn (Check Constraints, Foreign Keys)
- **4.4. Thiết kế Giao diện Người dùng (UI Wireframes / Mockups)**
  - 4.4.1. Màn hình Quản lý Khung CTĐT (`SCR-CUR-01`)
  - 4.4.2. Màn hình Mở lớp & Xếp thời khóa biểu (`SCR-SCH-01`)
  - 4.4.3. Cổng Đăng ký học phần Sinh viên (`SCR-REG-01`)
  - 4.4.4. Màn hình Nhập & Công bố Điểm (`SCR-GRD-01`)
- **4.5. Kết luận Chương 4**

---

### CHƯƠNG 5. ƯỚC LƯỢNG CHI PHÍ PHẦN MỀM (USE CASE POINTS - UCP)
*(Slide Bài 4: Functional Modeling - UCP Cost Estimation)*
- **5.1. Phân loại và Tính Trọng số Tác nhân Chưa điều chỉnh (UAW)**
- **5.2. Phân loại và Tính Trọng số Ca Sử dụng Chưa điều chỉnh (UUCW)**
- **5.3. Đánh giá Hệ số Phức tạp Kỹ thuật (TCF - 13 yếu tố)**
- **5.4. Đánh giá Hệ số Môi trường (ECF - 8 yếu tố)**
- **5.5. Tính toán Điểm UCP Tổng hợp và Ước lượng Giờ công Nỗ lực (Effort - Man-hours / Man-months)**
- **5.6. Kết luận Chương 5**

---

### CHƯƠNG 6. KẾT LUẬN & HƯỚNG PHÁT TRIỂN
*(Slide Bài 1 & Slide Tổng kết)*
- **6.1. Đánh giá Kết quả Đạt được so với Mục tiêu Ban đầu**
- **6.2. Phân tích Chuyên sâu các Vấn đề Kỹ thuật Mở rộng**
  - 6.2.1. Đề xuất giải pháp Concurrency / Race Condition (Optimistic vs. Pessimistic Locking) trong đợt đăng ký tín chỉ cao điểm
  - 6.2.2. Giải pháp đảm bảo tính toàn vẹn và bảo mật dữ liệu điểm số
- **6.3. Hạn chế còn tồn đọng và Hướng phát triển trong tương lai**

---

### PHỤ LỤC
- **Phụ lục A:** Ma trận Truy vết Yêu cầu Toàn diện (Traceability Matrix: `FR ↔ UC ↔ Class ↔ Table`)
- **Phụ lục B:** Bảng Phân công Trách nhiệm, Tiến độ Thực tế & Link GitHub Repository
