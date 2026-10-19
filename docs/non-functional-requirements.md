# CHƯƠNG 2.4: ĐẶC TẢ YÊU CẦU PHI CHỨC NĂNG THEO CHUẨN FURPS+ (NFR)
## Dự án: Hệ thống Quản lý Đào tạo Đại học theo Học chế Tín chỉ (IT3120)

> **Tài liệu phục vụ:** Mục 2.4 của Báo cáo Đồ án chính thức ([`report/report-outline.md`](../report/report-outline.md)).  
> **Người thực hiện:** Thành viên A (Kiêm nhiệm & Chuẩn hóa NFR toàn hệ thống).

---

Mô hình **FURPS+** (Robert Grady - Hewlett-Packard) phân rã các yêu cầu chất lượng của hệ thống phần mềm thành 5 khía cạnh cốt lõi cùng các ràng buộc mở rộng:

---

## 1. F - Functionality (Yêu cầu Chức năng & Bảo mật Toàn diện)

### 1.1. Phân quyền và Kiểm soát Truy cập (Role-Based Access Control - RBAC)
* **RBAC-01:** Hệ thống hỗ trợ tối thiểu 7 nhóm vai trò (`Role`): Sinh viên, Giảng viên, Cán bộ Phòng Đào tạo, Cán bộ Khoa/Viện, Cán bộ Tài chính, Quản trị hệ thống, Cổng thanh toán.
* **RBAC-02:** Áp dụng nguyên tắc đặc quyền tối thiểu (*Principle of Least Privilege*). Mỗi vai trò chỉ có quyền thao tác trên các thực thể nghiệp vụ được định nghĩa trong [Ma trận phân quyền CRUD](./business-processes.md#212-ma-trận-phân-quyền-crud-theo-tác-nhân-và-thực-thể-crud-matrix).
* **RBAC-03 (BR-10):** Riêng quyền nhập điểm học phần, hệ thống kiểm tra kép: Giảng viên phải vừa có Role `INSTRUCTOR`, vừa phải có bản ghi chỉ định chính thức trong `InstructorAssignment` của lớp học phần tương ứng.

### 1.2. Xác thực và Bảo mật Thông tin (Authentication & Security)
* **SEC-01:** Mọi kết nối truyền thông giữa Client và Application Server bắt buộc mã hóa qua giao thức HTTPS (TLS 1.3).
* **SEC-02:** Xác thực người dùng sử dụng chuỗi mã hóa JSON Web Token (JWT) có chữ ký số (HMAC-SHA256 hoặc RSA-256), thời gian sống (TTL) của Access Token là 30 phút, Refresh Token là 7 ngày.
* **SEC-03:** Mật khẩu người dùng được băm một chiều bằng thuật toán `Argon2id` hoặc `bcrypt` với cost factor $\ge 12$, chống tuyệt đối tấn công vét cạn (Brute-force) và Bảng cầu vồng (Rainbow Table).
* **SEC-04:** Chống các lỗ hổng bảo mật phổ biến theo chuẩn OWASP Top 10: SQL Injection (100% sử dụng Parameterized Queries / Prepared Statements), Cross-Site Scripting (XSS), Cross-Site Request Forgery (CSRF).

### 1.3. Tính Toàn vẹn Dữ liệu & Nhật ký Vết (Data Integrity & Audit Trail)
* **INT-01:** Toàn bộ các trạng thái thực thể phải tuân thủ nghiêm ngặt theo các kiểu liệt kê ENUM (`section_status_enum`, `registration_status_enum`, `grade_status_enum`, `invoice_status_enum`).
* **LOG-01:** Hệ thống kích hoạt cơ chế Audit Logging tự động ghi nhận nhật ký mọi thao tác nhạy cảm: Thời điểm (timestamp UTC), Tác nhân thực hiện (`userId`), Địa chỉ IP, Hành động (`INSERT/UPDATE/DELETE`), Giá trị trước và sau khi thay đổi (Old Value $\to$ New Value). Áp dụng bắt buộc cho: Nhập điểm (`grades`), Phê duyệt phúc khảo (`grade_appeals`), Thay đổi trần học phí (`tuition_rates`), Khóa bảng điểm (`academic_records`).

---

## 2. U - Usability (Khả năng Sử dụng & Trải nghiệm Người dùng)

### 2.1. Tính Tường minh của Thông báo Nghiệp vụ (Clarity of Feedback)
* **USA-01:** Khi người dùng vi phạm bất kỳ quy tắc nào trong 10 Quy tắc nghiệp vụ (`BR-01` .. `BR-10`), hệ thống không được đưa ra các thông báo chung chung ("Đăng ký thất bại"), mà **bắt buộc phải hiển thị nguyên nhân chi tiết và chỉ dẫn khắc phục**:
  * *Vi phạm BR-01:* `"Đăng ký thất bại: Bạn chưa hoàn thành học phần tiên quyết [Mã HP - Tên HP] (Điểm yêu cầu: hasPassed = true)"`.
  * *Vi phạm BR-02:* `"Đăng ký thất bại: Vượt quá giới hạn [MAX] tín chỉ cho phép đối với mức Cảnh báo học vụ [Mức n]"`.
  * *Vi phạm BR-03:* `"Đăng ký thất bại: Trùng lịch học với lớp [Mã lớp - Tên HP] vào [Thứ x, Tiết y-z]"`.
  * *Vi phạm BR-04:* `"Đăng ký thất bại: Lớp học phần đã đạt sĩ số tối đa ([currentEnrollment]/[maxCapacity])"`.

### 2.2. Khả năng Học và Sử dụng (Learnability & Accessibility)
* **USA-02:** Giao diện người dùng tuân theo chuẩn Web Responsive Design, hiển thị tối ưu trên cả màn hình máy tính (Desktop/Laptop $\ge 1280\text{px}$) và thiết bị di động (Tablet/Smartphone $\ge 375\text{px}$).
* **USA-03:** Thời gian học sử dụng (Learnability): Một sinh viên mới có thể hoàn tất việc tra cứu CTĐT và đăng ký thử nghiệm một lớp học phần trong thời gian không quá 5 phút mà không cần tài liệu hướng dẫn.

---

## 3. R - Reliability (Độ Tin cậy & Tính Sẵn sàng Hệ thống)

### 3.1. Tính Sẵn sàng Cao (Availability)
* **REL-01:** Hệ thống cam kết thời gian hoạt động liên tục (Uptime) tối thiểu **99.5%** trong suốt học kỳ ($< 3.6$ giờ bảo trì/tháng ngoài giờ cao điểm).
* **REL-02:** Trong các tuần cao điểm mở cổng Đăng ký học phần (2 tuần đầu học kỳ), cam kết chỉ số Uptime tối thiểu **99.9%** trong khung giờ tác nghiệp từ 06:00 đến 22:00.

### 3.2. Đảm bảo Tính Toàn vẹn Giao dịch (ACID Transactions)
* **REL-03:** Toàn bộ các thao tác làm thay đổi đồng thời nhiều bảng dữ liệu bắt buộc phải đóng gói trong Transaction với mức cô lập dữ liệu tối thiểu `READ COMMITTED` (và `REPEATABLE READ` hoặc `SERIALIZABLE` cho luồng kiểm tra sĩ số lớp):
  * Thao tác đăng ký: Gồm kiểm tra BR $\to$ Tăng `current_enrollment` $\to$ Insert `registrations` $\to$ Recalculate & Update `invoices`. Hoặc thành công toàn bộ, hoặc Rollback 100%.

### 3.3. Sao lưu & Phục hồi Sự cố (Backup & Disaster Recovery)
* **REL-04 (RPO - Recovery Point Objective):** $\le 15$ phút. Hệ thống sử dụng cơ chế ghi nhật ký trước (Write-Ahead Logging - WAL) của PostgreSQL để liên tục lưu trữ thay đổi.
* **REL-05 (RTO - Recovery Time Objective):** $\le 2$ giờ. Kịch bản khôi phục tự động từ bản sao lưu gần nhất (Automated Snapshot Daily).

---

## 4. P - Performance (Hiệu năng & Khả năng Chịu tải Cao điểm)

### 4.1. Khả năng Chịu tải Đồng thời (Peak Concurrency)
* **PER-01:** Tại thời điểm mở cổng đăng ký tín chỉ (08:00 sáng), hệ thống phải đáp ứng tải đồng thời tối thiểu **5.000 yêu cầu/giây (5.000 RPS)** với số lượng người dùng đồng thời (Concurrent Users) lên tới **15.000 sinh viên**.

### 4.2. Thời gian Đáp ứng (Response Time)
* **PER-02:** Đối với tác vụ nặng Đăng ký học phần (phải gọi chéo 3 module và kiểm tra chuỗi BR-01..05):
  * Thời gian phản hồi ở phân vị 95th ($p95$) $\le 1.5$ giây.
  * Thời gian phản hồi tối đa ($p99$) $\le 3.0$ giây.
* **PER-03:** Đối với các tác vụ đọc/tra cứu dữ liệu (Xem TKB, Xem CTĐT, Tra cứu điểm):
  * Thời gian phản hồi $p95 \le 500$ ms.

### 4.3. Giải pháp Xử lý Tranh chấp Sĩ số Lớp (Race Condition Mitigation)
* **PER-04:** Khi hàng trăm sinh viên cùng lúc bấm đăng ký vào 1 vị trí cuối cùng của lớp học phần ($currentEnrollment = maxCapacity - 1$), hệ thống phải ngăn chặn tuyệt đối hiện tượng vượt sĩ số (Over-enrollment) bằng kỹ thuật khóa bi quan (`SELECT ... FOR UPDATE`) hoặc hàng đợi xếp hàng giao dịch phân tán (Message Queue / Redis Lock).

---

## 5. S - Supportability (Khả năng Mở rộng & Dễ Bảo trì)

### 5.1. Kiến trúc Ghép nối Lỏng (Loose Coupling Architecture)
* **SUP-01:** 4 phân hệ (CUR, SCH, REG, GRD) độc lập về cơ chế xử lý logic nội bộ. Khi một phân hệ cần thay đổi logic thuật toán (ví dụ: đổi thuật toán xếp phòng trong SCH, đổi công thức tính học phí trong REG), không được làm ảnh hưởng đến mã nguồn của các phân hệ khác, miễn là tuân thủ đúng 6 Chữ ký hàm Interface chuẩn trong [`docs/interfaces-matrix.md`](./interfaces-matrix.md).

### 5.2. Chuẩn hóa Cơ sở Dữ liệu & Mở rộng (3NF Schema Extensibility)
* **SUP-02:** CSDL đạt Chuẩn hóa bậc 3 (3NF), đảm bảo không tồn tại dư thừa dữ liệu (Data Redundancy) hay bất thường khi cập nhật (Update Anomalies). Khi nhà trường mở thêm Ngành mới, Khóa đào tạo mới hoặc Chương trình chất lượng cao, hệ thống chỉ cần thêm bản ghi vào bảng `majors`, `programs`, `courses` mà không phải cấu trúc lại schema CSDL.
