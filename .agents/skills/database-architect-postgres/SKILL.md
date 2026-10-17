---
name: database-architect-postgres
description: >-
  Best practices, schema templates, and 3-tier database design guidelines
  (Conceptual to 3NF Logical to Physical PostgreSQL DDL) for IT3120 Chapter 4.
---

# Database Architect PostgreSQL Skill for IT3120

Skill này cung cấp các nguyên tắc chuẩn hóa, quy tắc ánh xạ mô hình thực thể sang cơ sở dữ liệu quan hệ (PostgreSQL 14+) và hướng dẫn đồng bộ dữ liệu cho **Chương 4: Thiết kế Hệ thống & CSDL** của môn IT3120.

---

## 1. Quy trình Thiết kế CSDL 3 Mức theo Chuẩn SOICT

```
Mức 1: Conceptual (Khái niệm)
   Domain Model (27 Entities)
           │
           ▼
Mức 2: Logical (Logic)
   Chuẩn hóa 3NF + Ánh xạ Quan hệ & Kế thừa
           │
           ▼
Mức 3: Physical (Vật lý)
   PostgreSQL 14+ DDL (schema.sql) + Data Dictionary
```

---

## 2. Quy tắc Ánh xạ Kế thừa & Quan hệ (Inheritance & Associations)

### 2.1. Ánh xạ Kế thừa: Lựa chọn Mô hình Class Table (Table-per-Type)
* **Thực thể cha:** `User` $\to$ bảng `users` (lưu trữ `id`, `email`, `password_hash`, `full_name`, `status`, `created_at`).
* **Thực thể con:**
  * `Student` $\to$ bảng `students` (`id` vừa là PK vừa là FK tham chiếu đến `users(id)`, lưu thêm `student_code`, `cohort`, `admin_class_id`).
  * `Instructor` $\to$ bảng `instructors` (`id` vừa là PK vừa là FK tham chiếu đến `users(id)`, lưu thêm `staff_code`, `academic_rank`, `faculty_id`).
* **Lý do chọn cho Báo cáo:** Đạt chuẩn 3NF, không lãng phí cột NULL (khác với Single-Table), dễ bảo trì và phân quyền bảo mật.

### 2.2. Ánh xạ Quan hệ Nhiều - Nhiều ($N - N$)
* Luôn tạo bảng trung gian (Join Table) có khóa chính phức hợp hoặc khóa thay thế (surrogate key):
  * Giữa `Course` và `Course` (Tiên quyết): Bảng `prerequisites` (`course_id`, `prerequisite_course_id`, `type`).
  * Giữa `Student` và `ClassSection` (Đăng ký): Bảng `registrations` (`student_id`, `section_id`, `status`, `created_at`).

---

## 3. Tiêu chuẩn PostgreSQL DDL (`database/schema.sql`)

1. **Khóa chính & Khóa ngoại:**
   * Sử dụng `VARCHAR(64)` hoặc `UUID` với extension `"uuid-ossp"`.
   * Luôn đặt tên Constraint rõ ràng: `fk_<table_name>_<ref_table>`, `chk_<table_name>_<rule>`.
2. **Kiểu dữ liệu Liệt kê (ENUM):**
   * Định nghĩa ENUM riêng biệt cho các trạng thái:
     * `section_status_enum`: `DRAFT`, `OPEN_FOR_REG`, `CLOSED_FOR_REG`, `IN_PROGRESS`, `COMPLETED`, `CANCELLED`.
     * `registration_status_enum`: `REGISTERED`, `WITHDRAWN`, `CANCELLED`.
     * `grade_status_enum`: `DRAFT`, `PUBLISHED`, `UNDER_APPEAL`, `LOCKED`.
     * `invoice_status_enum`: `UNPAID`, `PARTIALLY_PAID`, `PAID`, `OVERDUE`.
3. **Ràng buộc Toàn vẹn (Integrity Constraints):**
   * Tín chỉ học phần: `CHECK (credits > 0)`.
   * Sĩ số lớp: `CHECK (max_capacity > 0 AND current_enrollment <= max_capacity)`.
   * Thang điểm: `CHECK (score >= 0.0 AND score <= 10.0)`.

---

## 4. Thiết kế Xử lý Tranh chấp Đăng ký (Concurrency Design - Chương 6)

Khi hàng ngàn sinh viên đăng ký đồng thời vào một lớp sắp đầy sĩ số (`current_enrollment` cận `max_capacity`), hệ thống cần một trong hai cơ chế:

### Lựa chọn 1: Khóa bi quan (Pessimistic Locking)
Khóa dòng `class_sections` ngay khi đọc để chặn race condition:
```sql
BEGIN;
-- Khóa dòng lớp học phần
SELECT current_enrollment, max_capacity 
FROM class_sections 
WHERE id = 'SEC_12345' 
FOR UPDATE;

-- Kiểm tra sĩ số còn trống (BR-04)
-- Nếu còn chỗ:
INSERT INTO registrations (id, student_id, section_id, status) 
VALUES ('REG_999', 'SV_20210001', 'SEC_12345', 'REGISTERED');

UPDATE class_sections 
SET current_enrollment = current_enrollment + 1 
WHERE id = 'SEC_12345';

COMMIT;
```

### Lựa chọn 2: Khóa lạc quan (Optimistic Locking)
Sử dụng cột `version INT DEFAULT 0` trong bảng `class_sections`:
```sql
UPDATE class_sections 
SET current_enrollment = current_enrollment + 1, 
    version = version + 1 
WHERE id = 'SEC_12345' 
  AND version = :old_version 
  AND current_enrollment < max_capacity;
```

---

## 5. Tam giác Kiểm soát Tính Đồng bộ

Khi có sự thay đổi về thực thể, Agent phải kiểm tra và cập nhật đủ 3 nơi:
1. Sơ đồ thực thể: [`diagrams/00-overall/domain-model.puml`](file:///d:/SourceCodes/Java_SourceCodes/IT3120_QuanLyDaoTao/diagrams/00-overall/domain-model.puml).
2. Từ điển dữ liệu: [`database/data-dictionary.md`](file:///d:/SourceCodes/Java_SourceCodes/IT3120_QuanLyDaoTao/database/data-dictionary.md).
3. Mã nguồn CSDL: [`database/schema.sql`](file:///d:/SourceCodes/Java_SourceCodes/IT3120_QuanLyDaoTao/database/schema.sql).
