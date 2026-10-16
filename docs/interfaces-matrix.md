# MA TRẬN PHÂN MẠNH & 6 CHỮ KÝ HÀM GIAO TIẾP LIÊN MODULE (INTERFACES)

Tài liệu này định nghĩa bắt buộc 6 chữ ký hàm (Method Signatures) giao tiếp giữa 4 Module (`CUR`, `SCH`, `REG`, `GRD`). 

Khi thiết kế **Biểu đồ Trình tự (Sequence Diagram)** hoặc viết mã đặc tả, mọi tương tác gọi chéo giữa các phân hệ **bắt buộc** phải tuân theo đúng tên hàm, tham số và kiểu dữ liệu trả về được chuẩn hóa dưới đây.

---

## 1. Danh sách 6 Chữ ký Hàm Chuẩn

### ① REG gọi sang SCH: Lấy danh sách lớp học phần đang mở
* **Chữ ký:** `SCH_Service.getOpenSections(semesterId: String) : List<ClassSection>`
* **Mục đích:** Module REG gọi để lấy danh sách các lớp học phần được phép đăng ký trong học kỳ tương ứng.
* **Quy tắc liên quan:** Phục vụ hiển thị danh sách lớp trên `RegistrationPage`.

### ② REG gọi sang CUR: Lấy số tín chỉ và học phần tiên quyết
* **Chữ ký:** `CUR_Service.getCourseInfo(courseCode: String) : CourseInfoDTO {credits: Int, prerequisites: List<String>}`
* **Mục đích:** Module REG gọi để kiểm tra số tín chỉ của học phần cần đăng ký và lấy danh sách các mã môn học bắt buộc phải hoàn thành trước.
* **Quy tắc liên quan:** `BR-01`, `BR-02`, `BR-06`.

### ③ REG gọi sang GRD: Kiểm tra điều kiện tiên quyết
* **Chữ ký:** `GRD_Service.hasPassed(studentId: String, courseCode: String) : Boolean`
* **Mục đích:** Module REG kiểm tra xem sinh viên đã có điểm đạt (`hasPassed = true`, ví dụ: điểm chữ khác `F`) đối với từng học phần tiên quyết hay chưa.
* **Quy tắc liên quan:** `BR-01`.

### ④ REG gọi sang GRD: Lấy mức cảnh báo học vụ
* **Chữ ký:** `GRD_Service.getWarningLevel(studentId: String, semesterId: String) : Int`
* **Mục đích:** Trả về mức cảnh báo học vụ hiện tại của sinh viên (`0`, `1`, `2`, hoặc `3`) từ học kỳ gần nhất để áp trần số tín chỉ tối đa được phép đăng ký trong kỳ.
* **Quy tắc liên quan:** `BR-02`.

### ⑤ GRD gọi sang REG: Lấy danh sách sinh viên đăng ký lớp học phần
* **Chữ ký:** `REG_Service.getRegisteredStudents(sectionId: String) : List<String>`
* **Mục đích:** Module GRD gọi để lấy danh sách mã sinh viên (`studentId`) đã đăng ký hợp lệ (trạng thái `REGISTERED`) vào lớp học phần để lập bảng điểm thành phần.
* **Quy tắc liên quan:** Phục vụ bước khởi tạo và hiển thị bảng nhập điểm trong `UC-GRD-01`.

### ⑥ GRD gọi sang SCH: Xác thực quyền hạn của giảng viên
* **Chữ ký:** `SCH_Service.getSectionInstructor(sectionId: String) : String`
* **Mục đích:** Trả về mã định danh của giảng viên (`instructorId`) được phân công phụ trách chính thức lớp học phần đó, nhằm ngăn chặn việc giảng viên khác nhập điểm trái phép.
* **Quy tắc liên quan:** `BR-10`.

---

## 2. Bảng Ma trận Gọi chéo Liên Module (Cross-Module Invocation Matrix)

| Module Gọi | Module Được Gọi | Tên Hàm | Tham số Truyền vào | Dữ liệu Trả về |
|---|---|---|---|---|
| **REG** | **SCH** | `getOpenSections` | `semesterId: String` | `List<ClassSection>` |
| **REG** | **CUR** | `getCourseInfo` | `courseCode: String` | `CourseInfoDTO {credits, prerequisites}` |
| **REG** | **GRD** | `hasPassed` | `studentId: String, courseCode: String` | `Boolean` |
| **REG** | **GRD** | `getWarningLevel` | `studentId: String, semesterId: String` | `Int (0..3)` |
| **GRD** | **REG** | `getRegisteredStudents` | `sectionId: String` | `List<String>` |
| **GRD** | **SCH** | `getSectionInstructor` | `sectionId: String` | `String (instructorId)` |