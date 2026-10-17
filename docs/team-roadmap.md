# KẾ HOẠCH VÀ PHÂN CÔNG CHI TIẾT CHẶNG 1 & 2 (DỰ ÁN IT3120)
## Hệ thống Quản lý Đào tạo Đại học theo Học chế Tín chỉ
*(Đồng bộ hóa trực tiếp từ tài liệu làm việc chính thức của nhóm trên Google Docs: [IT3120_TaskAnalysis.md](https://docs.google.com/document/d/1jiKlOosNQs4pjGGe4y44H7tnXUyxFF-9uj6AfKUexWs/edit))*

---

## PHẦN I. QUY CHUẨN KỸ THUẬT VÀ NGUYÊN TẮC CHUNG (BẮT BUỘC)

### 1. Quy chuẩn Đặt tên & Mã định danh
* **Mã Yêu cầu Chức năng:** `FR-<MODULE>-nn` (Ví dụ: `FR-CUR-01`, `FR-REG-03`, `FR-GRD-02`).
* **Mã Use Case:** `UC-<MODULE>-nn` (Ví dụ: `UC-CUR-01`, `UC-SCH-01`, `UC-REG-01`, `UC-GRD-01`).
* **Mã Quy tắc Nghiệp vụ:** `BR-nn` (Từ `BR-01` đến `BR-10`).
* **Mã Màn hình / Wireframe:** `SCR-<MODULE>-nn`.
* **Tên Thực thể (Entities / Tables):** Dùng tiếng Anh, chuẩn `PascalCase` trong UML (Ví dụ: `ClassSection`, `RegistrationPeriod`, `AcademicWarning`) và `snake_case` trong PostgreSQL.
* **Tên Thuộc tính (Attributes / Columns):** Dùng tiếng Anh, chuẩn `camelCase` trong UML (Ví dụ: `studentId`, `maxCredits`, `courseCode`) và `snake_case` trong PostgreSQL.

### 2. Quy tắc Sở hữu Thực thể (Entity Ownership Rules)
* Mỗi Thực thể trong Cơ sở dữ liệu chỉ do duy nhất **1 Module làm chủ sở hữu (Owner)**.
* Thành viên sở hữu có toàn quyền định nghĩa các thuộc tính, trạng thái và chỉnh sửa thực thể đó.
* Các Module khác chỉ được phép tham chiếu qua khóa chính `id` hoặc gọi qua Chữ ký Hàm (Interface APIs) đã chốt, tuyệt đối không tự ý thêm thuộc tính vào thực thể của người khác.

### 3. Quy chuẩn Mẫu Biểu đồ UML (BCE Pattern)
* **Biểu đồ Lớp Phân tích (BCE Pattern):**
  * **Boundary (Lớp Biên):** Đặt tên dạng `*Page`, `*Form`, `*Dialog` (VD: `RegistrationPage`, `GradeEntryForm`).
  * **Control (Lớp Điều khiển):** Đặt tên dạng `*Controller`, `*Service` (VD: `RegistrationController`, `RegistrationService`).
  * **Entity (Lớp Thực thể):** Tên các Thực thể sở hữu tương ứng.
* **Công cụ thể hiện:** Sử dụng **PlantUML** (lưu mã `.puml` trong thư mục `/diagrams/` và ảnh `.png` trong `/renders/`).

---

## PHẦN II. PHÂN CÔNG CHI TIẾT THEO TỪNG THÀNH VIÊN

### 1. THÀNH VIÊN A — MODULE CUR (Danh mục & Hệ thống)
#### A. Phạm vi & Thực thể sở hữu
* **Thực thể làm chủ:** `User`, `Role`, `Notification`, `Faculty`, `Major`, `Program`, `Course`, `Prerequisite`, `Student`, `Instructor`, `AdminClass`.
* **Interface cung cấp cho Module khác:**
  ```java
  CUR.getCourseInfo(courseCode: String) : CourseInfoDTO {credits: Int, prerequisites: List<String>}
  ```

#### B. Chi tiết Đầu mục Công việc Chặng 1 & 2
* **Chặng 1 (Nền tảng):**
  * Khởi tạo GitHub Repository, tạo đúng cấu trúc thư mục `/docs`, `/diagrams`, `/report`. *(Đã hoàn thành [a])*
  * Soạn thảo **Chương 1 (Mô hình hóa môi trường & Tính khả thi)**: Khảo sát hiện trạng, bài toán nghiệp vụ (Situation $\to$ Problem $\to$ Impact $\to$ Need $\to$ Value), phân tích Stakeholders, đánh giá tính khả thi theo khung DVF, Phạm vi (In/Out-of-scope), Từ điển thuật ngữ.
  * Tổng hợp danh mục `FR-CUR-nn` và danh mục `UC-CUR-nn`.
* **Chặng 2 (Phân tích & Thiết kế):**
  * Đặc tả chi tiết `UC-CUR-01`: Xây dựng khung CTĐT (có cơ chế chặn vòng lặp môn học tiên quyết).
  * Vẽ Biểu đồ Hoạt động (Activity Diagram có Swimlanes): Cho `UC-CUR-01`.
  * Vẽ Biểu đồ Lớp Phân tích (BCE Diagram): Cho `UC-CUR-01`.
  * Vẽ Biểu đồ Trình tự (Sequence Diagram): Cho `UC-CUR-01`.
  * Vẽ Biểu đồ Trạng thái (State Diagram): Cho `ClassSection` (trạng thái: `DRAFT` $\to$ `OPEN_FOR_REG` $\to$ `CLOSED_FOR_REG` $\to$ `IN_PROGRESS` $\to$ `COMPLETED` / `CANCELLED`) để các module khác tham chiếu.
  * **Đầu mối tổng hợp File Báo cáo:** Thu gom nội dung từ các thành viên, viết Lời nói đầu, Chương 6 (Kết luận), định dạng file Báo cáo `.docx` và `.pdf`.

#### C. Quy chuẩn Đầu vào & Đầu ra
* **Đầu vào (Input):** Khung chương trình đào tạo mẫu của đại học, danh sách Khoa/Ngành/Môn học, tệp Phase 0 đã chốt.
* **Đầu ra (Output):**
  * Chương 1 hoàn chỉnh + Danh mục FR/UC module CUR.
  * Bản đặc tả `UC-CUR-01` + File mã nguồn biểu đồ PlantUML (`.puml`) & ảnh kết xuất.
  * File Báo cáo tổng hợp được ghép hoàn chỉnh.

#### D. Nội dung cần nghiên cứu thêm
* **Thuật toán phát hiện chu trình trên Đồ thị có hướng (Directed Acyclic Graph - DAG Cycle Detection / Tarjan / DFS):** Để giải thích cơ chế chặn vòng lặp môn tiên quyết (A tiên quyết B, B tiên quyết C, C lại tiên quyết A) trong báo cáo.
* **Quy chế tổ chức CTĐT hệ thống tín chỉ:** Cấu trúc khối kiến thức đại cương, cơ sở ngành, chuyên ngành, tự chọn.

---

### 2. THÀNH VIÊN B — MODULE SCH (Tổ chức Giảng dạy)
#### A. Phạm vi & Thực thể sở hữu
* **Thực thể làm chủ:** `Semester`, `ClassSection`, `Room`, `ScheduleSlot`, `InstructorAssignment`.
* **Interface cung cấp cho Module khác:**
  ```java
  SCH.getOpenSections(semesterId: String) : List<ClassSection>
  SCH.getSectionInstructor(sectionId: String) : String // trả về instructorId
  ```

#### B. Chi tiết Đầu mục Công việc Chặng 1 & 2
* **Chặng 1 (Nền tảng):**
  * Soạn thảo **Yêu cầu phi chức năng (NFR)** ở Chương 2 theo chuẩn **FURPS+**: Bảo mật (JWT, Role-based), Hiệu năng, Tính sẵn sàng, Dễ sử dụng, Khả năng bảo trì.
  * Lập danh mục `FR-SCH-nn` và danh mục `UC-SCH-nn`.
* **Chặng 2 (Phân tích & Thiết kế):**
  * Đặc tả chi tiết `UC-SCH-01`: Mở lớp học phần & Xếp thời khóa biểu (kiểm tra xung đột phòng học / giảng viên).
  * Vẽ Biểu đồ Hoạt động (Activity Diagram có Swimlanes): Cho `UC-SCH-01`.
  * Vẽ Biểu đồ Lớp Phân tích (BCE Diagram): Cho `UC-SCH-01`.
  * Vẽ Biểu đồ Trình tự (Sequence Diagram): Cho `UC-SCH-01`.
  * Vẽ Biểu đồ Kiến trúc Logic (Logical Architecture): 3 lớp (UI Presentation, Service/Business Logic, Database + Modules).
  * Vẽ Biểu đồ Kiến trúc Triển khai (Deployment Architecture): Client Browser, Application Server, PostgreSQL DB Server.
  * Chuẩn bị khung Slide bảo vệ: Dàn ý 15 - 20 trang slide.

#### C. Quy chuẩn Đầu vào & Đầu ra
* **Đầu vào (Input):** Danh sách phòng học, các kíp học (`ScheduleSlot`: Thứ, Tiết bắt đầu, Tiết kết thúc), danh sách giảng viên.
* **Đầu ra (Output):**
  * Phần Yêu cầu phi chức năng FURPS+ (Chương 2).
  * Bản đặc tả `UC-SCH-01` + File mã sơ đồ PlantUML (Activity, BCE, Sequence) + Biểu đồ Kiến trúc Logic/Triển khai.
  * Bộ Slide thuyết trình khung.

#### D. Nội dung cần nghiên cứu thêm
* **Thuật toán kiểm tra xung đột thời gian (Time Overlap Detection):** Công thức toán học kiểm tra 2 khoảng thời gian `(StartA < EndB) AND (EndA > StartB)` áp dụng cho phòng học và lịch giảng viên.
* **Mô hình Kiến trúc phần mềm:** Kiến trúc ứng dụng Web 3 lớp (3-tier Architecture) và RESTful Web Services.

---

### 3. THÀNH VIÊN C — MODULE REG (Đăng ký Học phần & Học phí) — PHÂN HỆ NẶNG NHẤT
#### A. Phạm vi & Thực thể sở hữu
* **Thực thể làm chủ:** `RegistrationPeriod`, `Registration`, `TuitionRate`, `Invoice`, `Payment`, `Waiver`.
* **Interface sử dụng & cung cấp:**
  * *Gọi sang Module khác:*
    * `SCH.getOpenSections(semesterId: String)`
    * `CUR.getCourseInfo(courseCode: String)`
    * `GRD.hasPassed(studentId: String, courseCode: String)`
    * `GRD.getWarningLevel(studentId: String, semesterId: String)`
  * *Cung cấp cho Module GRD:*
    ```java
    REG.getRegisteredStudents(sectionId: String) : List<String> // danh sách studentId
    ```

#### B. Chi tiết Đầu mục Công việc Chặng 1 & 2
* **Chặng 1 (Nền tảng):**
  * Lập danh mục `FR-REG-nn` và danh mục `UC-REG-nn`.
  * Soạn thảo chi tiết Quy tắc Nghiệp vụ (`BR-01` đến `BR-06`):
    * `BR-01`: Tiên quyết bắt buộc "đã đạt".
    * `BR-02`: Tín chỉ đăng ký/kỳ $\in [MIN, MAX]$; $MAX$ giảm theo mức cảnh báo học vụ (Mức 0: 24TC, Mức 1: 18TC, Mức 2: 14TC, Mức 3: 8TC).
    * `BR-03`: Trùng kíp học (xung đột lịch học).
    * `BR-04`: Giới hạn sĩ số lớp học phần.
    * `BR-05`: Khung thời gian đợt đăng ký.
    * `BR-06`: Công thức tính học phí (Số tín chỉ $\times$ Đơn giá tín chỉ $\times$ Hệ số học phần).
* **Chặng 2 (Phân tích & Thiết kế):**
  * Đặc tả chi tiết `UC-REG-01`: Đăng ký học phần (mô tả cực kỳ chi tiết các luồng rẽ nhánh ngoại lệ do vi phạm BR-01..BR-05).
  * Vẽ Biểu đồ Hoạt động (Activity Diagram có Swimlanes): Thể hiện rõ các chốt kiểm tra rẽ nhánh BR-01 $\to$ BR-05.
  * Vẽ Biểu đồ Lớp Phân tích (BCE Diagram): Cho `UC-REG-01`.
  * Vẽ Biểu đồ Trình tự (Sequence Diagram): Cho `UC-REG-01` (thể hiện rõ các thông điệp gọi sang Interface của CUR, SCH, GRD).
  * Vẽ Biểu đồ Trạng thái (State Diagram): Cho `Registration` (Đã đăng ký $\to$ Đã rút / Bị hủy) và `Invoice` (Chưa thanh toán $\to$ Đã thanh toán / Quá hạn).
  * **Tính toán Chương 5 (Chặng 3):** Ước lượng chi phí phần mềm theo phương pháp Use Case Points (UCP).

#### C. Quy chuẩn Đầu vào & Đầu ra
* **Đầu vào (Input):** Mã sinh viên, Mã lớp học phần (`classSectionId`), Thông tin đợt đăng ký, Chữ ký hàm Interfaces từ SCH, CUR, GRD.
* **Đầu ra (Output):**
  * Bảng Quy tắc nghiệp vụ BR-01..BR-06.
  * Bản đặc tả `UC-REG-01` (luồng phức tạp nhất hệ thống).
  * File mã sơ đồ PlantUML (Activity, BCE, Sequence, State Diagrams) cho Module REG.
  * Bảng tính toán UCP chi tiết ở Chương 5.

#### D. Nội dung cần nghiên cứu thêm
* **Quy chế Đào tạo Tín chỉ HUST:** Khung tín chỉ tối đa/tối thiểu theo từng mức cảnh báo học vụ; quy định rút học phần; định mức học phí theo loại học phần.
* **Kỹ thuật xử lý tranh chấp dữ liệu (Concurrency / Race Conditions):** Cơ chế khóa lạc quan/bi quan (Optimistic/Pessimistic Locking) trong CSDL khi hàng ngàn sinh viên cùng bấm đăng ký vào 1 lớp sắp đầy sĩ số.

---

### 4. THÀNH VIÊN D — MODULE GRD (Kết quả Học tập & Quản lý Điểm)
#### A. Phạm vi & Thực thể sở hữu
* **Thực thể làm chủ:** `GradeComponent`, `Grade`, `GradeAppeal`, `AcademicRecord`, `AcademicWarning`.
* **Interface sử dụng & cung cấp:**
  * *Gọi sang Module khác:*
    * `SCH.getSectionInstructor(sectionId: String)`
    * `REG.getRegisteredStudents(sectionId: String)`
  * *Cung cấp cho Module REG:*
    ```java
    GRD.hasPassed(studentId: String, courseCode: String) : Boolean
    GRD.getWarningLevel(studentId: String, semesterId: String) : Int // 0, 1, 2, 3
    ```

#### B. Chi tiết Đầu mục Công việc Chặng 1 & 2
* **Chặng 1 (Nền tảng):**
  * Lập danh mục `FR-GRD-nn` và danh mục `UC-GRD-nn`.
  * Soạn thảo Quy tắc Nghiệp vụ tính điểm (`BR-07` đến `BR-10`):
    * `BR-07`: Điểm học phần = $\sum(\text{Trọng số} \times \text{Điểm thành phần})$.
    * `BR-08`: Công thức tính GPA (học kỳ) và CPA (tích lũy) theo thang điểm 4.0.
    * `BR-09`: Mức cảnh báo học vụ theo ngưỡng CPA (Mức 0, 1, 2, 3 / Buộc thôi học).
    * `BR-10`: Phân quyền nhập điểm (chỉ GV phụ trách lớp).
  * **Dựng Biểu đồ Lớp Miền Tổng thể (Domain Model):** Gom tất cả thực thể sở hữu của 4 thành viên thành 1 sơ đồ lớp domain chung (27 thực thể).
* **Chặng 2 (Phân tích & Thiết kế):**
  * Đặc tả chi tiết `UC-GRD-01`: Nhập điểm $\to$ Tính kết quả $\to$ Cập nhật GPA/CPA & Cảnh báo học vụ.
  * Vẽ Biểu đồ Hoạt động (Activity Diagram có Swimlanes): Cho `UC-GRD-01`.
  * Vẽ Biểu đồ Lớp Phân tích (BCE Diagram): Cho `UC-GRD-01`.
  * Vẽ Biểu đồ Trình tự (Sequence Diagram): Cho `UC-GRD-01`.
  * Vẽ Biểu đồ Trạng thái (State Diagram): Cho `Grade` (Nháp $\to$ Đã công bố $\to$ Đang phúc khảo $\to$ Đã khóa).
  * **Vẽ Biểu đồ ERD Tổng thể & Thiết kế Bảng Dữ liệu (Data Dictionary):** Chuyển Domain Model thành ERD chuẩn hóa, đặc tả chi tiết 27 bảng dữ liệu, kiểu dữ liệu PostgreSQL, khóa chính, khóa ngoại.
  * **Kiểm soát Chất lượng (Chặng 3):** Lập Ma trận truy vết (Traceability Matrix: `FR ↔ UC ↔ Class ↔ Table`).

#### C. Quy chuẩn Đầu vào & Đầu ra
* **Đầu vào (Input):** Bảng điểm thành phần, Trọng số điểm (Quá trình, Cuối kỳ, BTL), Danh sách sinh viên đăng ký lớp (từ REG), Giảng viên phụ trách (từ SCH).
* **Đầu ra (Output):**
  * Biểu đồ Lớp Miền tổng thể (Domain Model) cho Chặng 1.
  * Quy tắc BR-07..BR-10.
  * Bản đặc tả `UC-GRD-01` + File mã sơ đồ PlantUML (Activity, BCE, Sequence, State Diagrams).
  * Biểu đồ ERD tổng thể & Bảng từ điển dữ liệu (Data Dictionary) ở Chương 4.
  * Bảng Ma trận truy vết hoàn chỉnh ở Phụ lục A.

#### D. Nội dung cần nghiên cứu thêm
* **Thang điểm chữ (A+, A, B+, B, C+, C, D+, D, F) & Quy đổi Thang 4.0 theo Quy chế HUST:** Công thức tính CPA khi học cải thiện / học lại (chọn điểm cao nhất trong các lần học).
* **Kỹ thuật Thiết kế Cơ sở Dữ liệu Quan hệ (Relational DB Design):** Chuẩn hóa CSDL (1NF, 2NF, 3NF), biểu diễn quan hệ 1-1, 1-N, N-N (bảng trung gian) và ánh xạ kế thừa.

---

## PHẦN III. MA TRẬN MÓC NỐI GIAO DIỆN VÀ TIẾN ĐỘ THỜI GIAN

### 1. Bảng Kiểm tra Giao diện Móc nối (Interfaces Matrix)
Khi vẽ Biểu đồ Trình tự (Sequence Diagram), các thành viên bắt buộc phải tuân thủ đúng các lời gọi hàm sau:

| Module Gọi | Module Nhận | Chữ ký Hàm | Mục đích Nghiệp vụ |
|---|---|---|---|
| **REG** | **SCH** | `getOpenSections(semesterId: String)` | Lấy danh sách lớp HP đang mở trong đợt |
| **REG** | **CUR** | `getCourseInfo(courseCode: String)` | Lấy số tín chỉ & danh sách môn tiên quyết |
| **REG** | **GRD** | `hasPassed(studentId: String, courseCode: String)` | Kiểm tra sinh viên đã đạt môn tiên quyết chưa (BR-01) |
| **REG** | **GRD** | `getWarningLevel(studentId: String, semesterId: String)` | Lấy mức cảnh báo học vụ để áp trần Max tín chỉ (BR-02) |
| **GRD** | **REG** | `getRegisteredStudents(sectionId: String)` | Lấy danh sách sinh viên chính thức để lập bảng điểm |
| **GRD** | **SCH** | `getSectionInstructor(sectionId: String)` | Kiểm tra người đang nhập điểm có phải GV phụ trách (BR-10) |

### 2. Lịch trình Giao nộp Chặng 1 & 2 (Liền nhau)
* **Mốc 1 (Ngày 3):** Thành viên D chốt sơ bộ Domain Model; Thành viên C chốt bảng BR-01..BR-06; Thành viên A khởi tạo Repo GitHub.
* **Mốc 2 (Ngày 7 - Hết Chặng 1):** Hoàn thành Chương 1, Danh mục FR/UC của 4 module, kiểm tra không bị lấn phạm vi.
* **Mốc 3 (Ngày 11):** Hoàn thành Bảng đặc tả & 3 biểu đồ (Activity, BCE, Sequence) cho 4 Use Case lõi (`UC-CUR-01`, `UC-SCH-01`, `UC-REG-01`, `UC-GRD-01`).
* **Mốc 4 (Ngày 14 - Hết Chặng 2):** Hoàn thành Biểu đồ Trạng thái (State), ERD Tổng thể, Biểu đồ Kiến trúc Logic/Triển khai, Ráp nối kiểm tra sự ăn khớp của 6 Chữ ký Hàm Interfaces.
