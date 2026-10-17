---
name: plantuml-expert
description: >-
  Expert guidelines, design templates, and best practices for creating and rendering PlantUML diagrams
  for IT3120 System Design (Use Case, Activity with Swimlanes, BCE Sequence, Class, State Machine, Architecture, ERD).
---

# PlantUML Expert Skill for IT3120 (System Analysis & Design)

Skill này cung cấp các tiêu chuẩn, khuôn mẫu và chỉ dẫn kỹ thuật để tạo các biểu đồ PlantUML chất lượng học thuật cao cho đồ án **IT3120 - Hệ thống Quản lý Đào tạo Đại học**.

---

## 1. Nguyên tắc Tạo Biểu đồ Chuẩn Học thuật

1. **Giao diện & Màu sắc (Styling):**
   * Luôn sử dụng skinparam hiện đại, rõ ràng, tương phản tốt khi in ấn hoặc chèn vào tài liệu DOCX/PDF:
     ```plantuml
     skinparam handwritten false
     skinparam shadowing false
     skinparam defaultFontName "Arial"
     skinparam defaultFontSize 12
     skinparam roundcorner 8
     ```
2. **Ngôn ngữ:**
   * Tiêu đề biểu đồ (`title`), chú thích (`note`) và thông báo nghiệp vụ: **Tiếng Việt có dấu**.
   * Tên class, method, attribute: **Tiếng Anh** theo chuẩn `PascalCase` và `camelCase`.
3. **Phân rã Thư mục Lưu trữ:**
   * `diagrams/00-overall/`: Domain Model, Use Case tổng quan, Package diagram.
   * `diagrams/01-cur/`: Sơ đồ thuộc phân hệ CUR (`UC-CUR-01`).
   * `diagrams/02-sch/`: Sơ đồ thuộc phân hệ SCH (`UC-SCH-01`).
   * `diagrams/03-reg/`: Sơ đồ thuộc phân hệ REG (`UC-REG-01`).
   * `diagrams/04-grd/`: Sơ đồ thuộc phân hệ GRD (`UC-GRD-01`).

---

## 2. Khuôn mẫu Các Loại Biểu đồ Cốt lõi

### Mẫu 1: Biểu đồ Trình tự Phân tích theo Mẫu BCE (BCE Sequence Diagram)
* **Quy chuẩn:** Phải có Actor, Boundary (`boundary`), Control (`control`), Entity (`entity`) và Database (`database`).
* **Gọi chéo liên module:** Bắt buộc dùng đúng 6 chữ ký hàm trong `docs/interfaces-matrix.md`.

```plantuml
@startuml UC-REG-01-sequence
title Biểu đồ Trình tự: UC-REG-01 Đăng ký Học phần (BCE Pattern)
autonumber
skinparam responseMessageBelowArrow true

actor "Sinh viên" as Student
boundary "RegistrationPage" as Page <<boundary>>
control "RegistrationController" as Ctrl <<control>>
control "CUR_Service" as CUR <<control>>
control "SCH_Service" as SCH <<control>>
control "GRD_Service" as GRD <<control>>
entity "Registration" as Reg <<entity>>
database "PostgreSQL" as DB

Student -> Page : Nhập sectionId và bấm "Đăng ký"
activate Page
Page -> Ctrl : registerSection(studentId, sectionId)
activate Ctrl

' Gọi kiểm tra chéo module
Ctrl -> CUR : getCourseInfo(courseCode)
Ctrl -> GRD : hasPassed(studentId, prereqCode)
note right of Ctrl : Kiểm tra BR-01 (Tiên quyết)

Ctrl -> GRD : getWarningLevel(studentId, semesterId)
note right of Ctrl : Kiểm tra BR-02 (Trần tín chỉ theo cảnh báo)

alt Vi phạm quy tắc nghiệp vụ (BR-01..05)
    Ctrl --> Page : Trả về thông báo lỗi chi tiết
    Page --> Student : Hiển thị cảnh báo lỗi
else Tất cả điều kiện hợp lệ
    Ctrl -> Reg : create(studentId, sectionId, "REGISTERED")
    Reg -> DB : INSERT INTO registrations ...
    Ctrl --> Page : Đăng ký thành công & học phí tạm tính (BR-06)
    Page --> Student : Cập nhật TKB cá nhân
end

deactivate Ctrl
deactivate Page
@enduml
```

### Mẫu 2: Biểu đồ Hoạt động Phân làn (Activity Diagram with Swimlanes)
* Thể hiện rõ các làn hoạt động (Actor, Controller/Service, External/Database).
* Làm nổi bật các điểm rẽ nhánh quyết định (Diamond) kiểm tra BR.

```plantuml
@startuml UC-REG-01-activity
title Biểu đồ Hoạt động: UC-REG-01 Đăng ký Học phần
|#EBF5FB|Sinh viên|
start
:Mở cổng đăng ký học phần;
:Chọn lớp học phần cần đăng ký;
:Nhấn nút "Xác nhận Đăng ký";

|#E8F8F5|Hệ thống (Controller / Business Logic)|
:Kiểm tra khung thời gian đợt đăng ký (BR-05);
if (Đợt đăng ký đang mở?) then (không)
  #Pink:Báo lỗi ngoài thời hạn đăng ký;
  |Sinh viên|
  :Xem thông báo từ chối;
  stop
else (có)
endif

:Kiểm tra học phần tiên quyết đã đạt (BR-01);
if (Đã đạt tất cả môn tiên quyết?) then (không)
  #Pink:Báo lỗi chưa đạt tiên quyết;
  |Sinh viên|
  :Xem thông báo từ chối;
  stop
else (có)
endif

:Kiểm tra tổng tín chỉ không vượt trần MAX (BR-02);
:Kiểm tra không trùng kíp học (BR-03);
:Kiểm tra sĩ số lớp còn chỗ (BR-04);

if (Tất cả hợp lệ?) then (có)
  :Ghi nhận đăng ký thành công;
  :Cập nhật công nợ học phí theo BR-06;
  |Sinh viên|
  #PaleGreen:Nhận thông báo đăng ký thành công;
  stop
else (vi phạm)
  #Pink:Báo lỗi vi phạm quy tắc tương ứng;
  |Sinh viên|
  :Xem thông báo lỗi;
  stop
endif
@enduml
```

### Mẫu 3: Biểu đồ Máy Trạng thái (State Machine Diagram)
* Dùng cho vòng đời thực thể: `ClassSection`, `Registration`, `Invoice`, `Grade`.

```plantuml
@startuml state-grade
title Vòng đời Trạng thái của Điểm học phần (Grade State Machine)
hide empty description

[*] --> DRAFT : Giảng viên tạo bảng điểm
DRAFT --> PUBLISHED : Giảng viên nhấn "Công bố điểm" (BR-07, BR-10)
PUBLISHED --> UNDER_APPEAL : Sinh viên nộp đơn phúc khảo hợp lệ
UNDER_APPEAL --> PUBLISHED : Cập nhật điểm sau phúc khảo
PUBLISHED --> LOCKED : Phòng Đào tạo khóa điểm & Chạy xét học vụ (BR-08, BR-09)
LOCKED --> [*]
@enduml
```

---

## 3. Quy trình Kiểm thử & Kết xuất Ảnh Biểu đồ

Sau khi tạo hoặc chỉnh sửa file `.puml`, Agent hoặc người dùng có thể kết xuất ngay sang PNG bằng PowerShell:

```powershell
# Chạy script render cục bộ nếu có plantuml.jar
./scripts/render.ps1

# Hoặc kiểm tra cú pháp nhanh qua công cụ dòng lệnh nếu máy có Java:
java -jar ./scripts/plantuml.jar -syntax diagrams/00-overall/domain-model.puml
```

Toàn bộ ảnh sẽ được đưa vào thư mục `renders/` với cấu trúc thư mục con tương ứng, sẵn sàng để chèn vào báo cáo.
