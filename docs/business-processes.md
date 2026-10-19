# CHƯƠNG 2.1: MÔ HÌNH HÓA QUY TRÌNH NGHIỆP VỤ & MA TRẬN PHÂN QUYỀN CRUD
## Dự án: Hệ thống Quản lý Đào tạo Đại học theo Học chế Tín chỉ (IT3120)

> **Tài liệu phục vụ:** Mục 2.1 của Báo cáo Đồ án chính thức ([`report/report-outline.md`](../report/report-outline.md)).  
> **Người thực hiện:** Thành viên A (Kiêm nhiệm Quản trị Kiến trúc Hệ thống).

---

## 2.1.1. Bảng Quy trình Nghiệp vụ Tổng quát (Input - Process - Output)

Hệ thống quản lý đào tạo đại học tín chỉ vận hành theo chuỗi 4 quy trình nghiệp vụ cốt lõi, móc nối chặt chẽ giữa 4 phân hệ:

| STT | Tên Quy trình Nghiệp vụ | Phân hệ Chủ trì | Đầu vào (Input) | Các bước Xử lý Chính (Process) | Đầu ra (Output) |
|:---:|---|:---:|---|---|---|
| **P-01** | **Xây dựng & Quản lý Khung CTĐT** | **CUR** | • Danh mục Ngành, Chuyên ngành.<br>• Danh sách môn học & số tín chỉ.<br>• Dự kiến học kỳ & Điều kiện tiên quyết. | 1. Nhập cấu trúc CTĐT theo khối kiến thức.<br>2. Thiết lập liên kết môn học tiên quyết.<br>3. Chạy thuật toán phát hiện chu trình đồ thị có hướng (**DAG Cycle Detection**).<br>4. Lưu trữ cấu trúc khung vào CSDL khi không có vòng lặp. | • Khung CTĐT chuẩn hóa.<br>• Cây phụ thuộc tiên quyết hợp lệ.<br>• Dữ liệu nền tảng cho việc mở lớp và đăng ký. |
| **P-02** | **Tổ chức Giảng dạy & Xếp Thời khóa biểu** | **SCH** | • Khung CTĐT kỳ tác nghiệp.<br>• Danh mục phòng học & sức chứa.<br>• Danh sách giảng viên bộ môn.<br>• Nhu cầu mở lớp dự kiến. | 1. Khởi tạo lớp học phần (`ClassSection`) gắn với môn học và học kỳ.<br>2. Phân bổ Kíp học (`ScheduleSlot`: Thứ, Tiết, Tuần).<br>3. Kiểm tra kiểm soát xung đột thời gian phòng học và lịch giảng viên theo công thức: $(\text{StartA} < \text{EndB}) \land (\text{EndA} > \text{StartB})$.<br>4. Đối chiếu sức chứa phòng $\ge$ Sĩ số tối đa (`BR-04`).<br>5. Chuyển trạng thái lớp sang `OPEN_FOR_REG`. | • Danh sách lớp học phần mở đăng ký.<br>• Thời khóa biểu toàn trường không xung đột.<br>• Bảng phân công giảng viên chính thức (`InstructorAssignment`). |
| **P-03** | **Đăng ký Học phần & Tính toán Học phí** | **REG** | • Mã sinh viên đăng nhập.<br>• Mã lớp học phần (`sectionId`) muốn đăng ký.<br>• Trạng thái đợt đăng ký (`RegistrationPeriod`). | 1. Kiểm tra đợt đăng ký đang `OPEN` (**BR-05**).<br>2. Gọi `CUR_Service` và `GRD_Service.hasPassed()` kiểm tra môn tiên quyết (**BR-01**).<br>3. Gọi `GRD_Service.getWarningLevel()` kiểm tra trần tín chỉ theo cảnh báo (**BR-02**).<br>4. Kiểm tra chống trùng lịch kíp học (**BR-03**).<br>5. Kiểm tra sĩ số lớp còn chỗ (**BR-04**).<br>6. Tạo bản ghi `Registration`, tăng sĩ số lớp.<br>7. Tính lại học phí theo **BR-06** và cập nhật hóa đơn `Invoice`. | • Bản ghi đăng ký hợp lệ (`REGISTERED`).<br>• Thời khóa biểu cá nhân của sinh viên.<br>• Hóa đơn học phí học kỳ cập nhật theo thời gian thực. |
| **P-04** | **Quản lý Điểm số, GPA/CPA & Cảnh báo Học vụ** | **GRD** | • Danh sách sinh viên đăng ký lớp (từ REG).<br>• Điểm quá trình, điểm thi kết thúc học phần.<br>• Trọng số đánh giá môn học (`GradeComponent`). | 1. Xác thực quyền hạn giảng viên phụ trách lớp (**BR-10** qua `SCH_Service`).<br>2. Kiểm tra tính hợp lệ điểm $[0.0, 10.0]$, tính điểm tổng kết hệ 10 theo trọng số (**BR-07**), quy đổi điểm chữ và thang 4.0.<br>3. Công bố bảng điểm lớp (`PUBLISHED`).<br>4. Tiếp nhận và xử lý đơn phúc khảo (nếu có).<br>5. Khóa bảng điểm (`LOCKED`), tự động tính GPA học kỳ và CPA tích lũy toàn khóa (**BR-08**).<br>6. Tự động xét mức cảnh báo học vụ (0..3) theo ngưỡng quy chế (**BR-09**). | • Bảng điểm lớp học phần chính thức.<br>• Hồ sơ tích lũy học tập (`AcademicRecord`).<br>• Quyết định cảnh báo học vụ (`AcademicWarning`). |

---

## 2.1.2. Ma trận Phân quyền CRUD theo Tác nhân và Thực thể (CRUD Matrix)

> **Ký hiệu:**  
> • **C (Create):** Quyền thêm mới  
> • **R (Read):** Quyền xem / tra cứu  
> • **U (Update):** Quyền chỉnh sửa / cập nhật  
> • **D (Delete):** Quyền xóa  
> • **— :** Không có quyền truy cập  

| Thực thể Nghiệp vụ (Entities) | Phân hệ | Sinh viên (Student) | Giảng viên (Instructor) | Cán bộ Đào tạo (Academic Staff) | Cán bộ Khoa (Faculty Staff) | Cán bộ Tài chính (Finance Staff) | Quản trị Hệ thống (Admin) | Cổng Thanh toán (Payment Gateway) |
|---|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| **`User`, `Role`** | CUR | R (bản thân) | R (bản thân) | R | R | R | **CRUD** | — |
| **`Faculty`, `Major`** | CUR | R | R | **CRUD** | R | R | **CRUD** | — |
| **`Program`, `Course`** | CUR | R | R | **CRUD** | C, R, U (đề xuất) | R | R | — |
| **`Prerequisite`** | CUR | R | R | **CRUD** | C, R (góp ý) | — | R | — |
| **`Student`, `AdminClass`** | CUR | R (bản thân) | R (lớp dạy) | **CRUD** | R (thuộc khoa) | R | **CRUD** | — |
| **`Instructor`** | CUR | R | R (bản thân) | **CRUD** | **CRUD** | R | **CRUD** | — |
| **`Semester`** | SCH | R | R | **CRUD** | R | R | R | — |
| **`ClassSection`** | SCH | R | R (lớp dạy) | **CRUD** | R (thuộc khoa) | R | R | — |
| **`Room`, `ScheduleSlot`**| SCH | R | R | **CRUD** | R | — | R | — |
| **`InstructorAssignment`** | SCH | R | R (lịch dạy) | **CRUD** | **CRUD** | — | R | — |
| **`RegistrationPeriod`** | REG | R | R | **CRUD** | R | R | R | — |
| **`Registration`** | REG | **C, R, U (hủy)** | R (lớp dạy) | **CRUD** | R | R | R | — |
| **`TuitionRate`** | REG | R | — | R | — | **CRUD** | R | — |
| **`Invoice`** | REG | R (bản thân) | — | R | — | **CRUD** | R | R, U (giao dịch) |
| **`Payment`** | REG | **C, R** | — | R | — | **CRUD** | R | **C, R** |
| **`Waiver`** | REG | R (bản thân) | — | R | — | **CRUD** | R | — |
| **`GradeComponent`** | GRD | R | **C, R, U** | **CRUD** | R | — | R | — |
| **`Grade`** | GRD | R (bản thân) | **C, R, U (nhập)**| **R, U (khóa)** | R | — | R | — |
| **`GradeAppeal`** | GRD | **C, R** | **R, U (trả lời)**| **R, U (duyệt)** | R | — | R | — |
| **`AcademicRecord`** | GRD | R (bản thân) | R (cố vấn) | **CRUD** | R (thuộc khoa) | R | R | — |
| **`AcademicWarning`** | GRD | R (bản thân) | R (cố vấn) | **CRUD** | R (thuộc khoa) | — | R | — |
| **`Notification`** | CUR | R (nhận) | R (nhận) | **C, R** | **C, R** | **C, R** | **CRUD** | — |
