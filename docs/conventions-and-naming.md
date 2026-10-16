# QUY ƯỚC ĐẶT TÊN & ĐỊNH DANH (NAMING CONVENTIONS)

## 1. Quy ước Đặt tên Mã Yêu cầu & Đối tượng
- **Yêu cầu chức năng:** `FR-<MOD>-nn` (VD: `FR-CUR-01`, `FR-REG-01`).
- **Ca sử dụng (Use Case):** `UC-<MOD>-nn` (VD: `UC-CUR-01`, `UC-SCH-01`, `UC-REG-01`, `UC-GRD-01`).
- **Quy tắc nghiệp vụ:** `BR-nn` (Từ `BR-01` đến `BR-10`).
- **Màn hình giao diện:** `SCR-<MOD>-nn` (VD: `SCR-REG-01`, `SCR-GRD-01`).
- **Tên lớp thực thể (Entities - UML):** Tiếng Anh, chuẩn `PascalCase` (VD: `ClassSection`, `AcademicWarning`).
- **Tên thuộc tính (Attributes - UML):** Tiếng Anh, chuẩn `camelCase` (VD: `studentId`, `courseCode`, `maxCredits`).
- **Tên bảng CSDL & Cột (PostgreSQL):** Tiếng Anh, chuẩn `snake_case` (VD: `class_sections`, `course_code`, `max_capacity`).

## 2. Mẫu Biểu đồ Lớp Phân tích (BCE Pattern)
- **Boundary (Biên):** Hậu tố `Page`, `Form`, `Dialog` (VD: `RegistrationPage`, `GradeSheetForm`).
- **Control (Điều khiển):** Hậu tố `Controller`, `Service` (VD: `RegistrationController`, `RegistrationService`).
- **Entity (Thực thể):** Tên thực thể trong Domain Model (`ClassSection`, `Registration`, v.v.).

## 3. Cú pháp Commit Git
- **Quy tắc:** `[<MOD>] <Hành động>: <Nội dung chi tiết>`
- **Ví dụ:**
  - `[REG] Add: UC-REG-01 sequence diagram`
  - `[GRD] Update: State-grade diagram and BR-07 rule description`
  - `[DOCS] Fix: Update database schema and interfaces matrix`

