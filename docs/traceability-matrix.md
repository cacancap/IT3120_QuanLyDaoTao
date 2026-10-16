# MA TRẬN TRUY VẾT YÊU CẦU (TRACEABILITY MATRIX)

Tài liệu phục vụ **Phụ lục A của Báo cáo**, do **Thành viên D** chủ trì lập và rà soát tính nhất quán xuyên suốt đồ án:
`Yêu cầu chức năng (FR) ↔ Ca sử dụng (UC) ↔ Lớp thực thể (Class) ↔ Bảng CSDL (Table)`

---

## Bảng Ma trận Mẫu (Template)

| Mã FR | Tên Yêu cầu Chức năng | Ca sử dụng (UC) | Quy tắc BR | Lớp Phân tích / Thực thể (Class) | Bảng CSDL (PostgreSQL) | Thành viên Phụ trách |
|---|---|---|---|---|---|:---:|
| `FR-CUR-01` | Quản lý khung CTĐT & tiên quyết | `UC-CUR-01` | - | `Program`, `Course`, `Prerequisite` | `programs`, `courses`, `prerequisites` | Thành viên A |
| `FR-SCH-01` | Mở lớp học phần & Xếp TKB | `UC-SCH-01` | `BR-03`, `BR-04` | `ClassSection`, `ScheduleSlot`, `Room`, `InstructorAssignment` | `class_sections`, `schedule_slots`, `rooms`, `instructor_assignments` | Thành viên B |
| `FR-REG-01` | Đăng ký lớp học phần | `UC-REG-01` | `BR-01..05` | `Registration`, `ClassSection`, `RegistrationPeriod` | `registrations`, `class_sections`, `registration_periods` | Thành viên C |
| `FR-REG-02` | Tính toán và cập nhật học phí | `UC-REG-01` | `BR-06` | `Invoice`, `TuitionRate`, `Payment` | `invoices`, `tuition_rates`, `payments` | Thành viên C |
| `FR-GRD-01` | Nhập và công bố điểm lớp HP | `UC-GRD-01` | `BR-07`, `BR-10` | `Grade`, `GradeComponent` | `grades`, `grade_components` | Thành viên D |
| `FR-GRD-02` | Khóa điểm, tính GPA/CPA & Xét học vụ | `UC-GRD-01` | `BR-08`, `BR-09` | `AcademicRecord`, `AcademicWarning` | `academic_records`, `academic_warnings` | Thành viên D |

*(Nhóm sẽ tiếp tục bổ sung các dòng còn lại trong quá trình hoàn thiện đồ án).*

