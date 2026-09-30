# IT3120 - HỆ THỐNG QUẢN LÝ ĐÀO TẠO ĐẠI HỌC (TÍN CHỈ)

## 📌 THÔNG TIN DỰ ÁN
* **Môn học:** Phân tích và Thiết kế Hệ thống (IT3120) - Trường CNTT&TT, ĐH Bách khoa Hà Nội[cite: 1, 2]
* **Đề tài:** Hệ thống Quản lý Đào tạo Đại học
* **Mô hình triển khai:** Hybrid (Google Docs Soạn thảo văn bản + GitHub Quản lý mã sơ đồ & Báo cáo)

## 🔗 TÀI LIỆU LÀM VIỆC NHÓM
* 📝 **Google Docs Báo cáo chính thức:** [Dán link Google Docs của nhóm tại đây]
* 📐 **Mã nguồn Biểu đồ PlantUML:** [`/diagrams/`](./diagrams/)[cite: 2]
* 🖼️ **Hình ảnh Biểu đồ đã xuất (.PNG):** [`/renders/`](./renders/)[cite: 2]
* 📋 **Tài liệu Quy ước & Giao diện:** [`/docs/`](./docs/)[cite: 2]

## 👥 BẢNG PHÂN CÔNG NHIỆM VỤ
| Thành viên | Module | Thực thể sở hữu | Workflows & Sơ đồ chính |
|---|---|---|---|
| **Thành viên A** | **CUR** (Danh mục & Hệ thống) | `User`, `Course`, `Program`... | UC-CUR-01, Khảo sát, Gom Báo cáo |
| **Thành viên B** | **SCH** (Tổ chức giảng dạy) | `Semester`, `ClassSection`, `Room`... | UC-SCH-01, NFR, Biểu đồ Kiến trúc[cite: 2] |
| **Thành viên C** | **REG** (Đăng ký HP & Học phí) | `Registration`, `Invoice`... | UC-REG-01, Quy tắc BR-01..06, UCP[cite: 2] |
| **Thành viên D** | **GRD** (Kết quả học tập) | `Grade`, `AcademicWarning`... | UC-GRD-01, BR-07..10, Domain Model, ERD[cite: 2] |

## 🛠️ QUY ƯỚC QUẢN LÝ
* **Đặt tên mã:** `FR-<MOD>-nn`, `UC-<MOD>-nn`, `BR-nn`[cite: 2]
* **Cú pháp Commit:** `[<MOD>] Add/Update <Tên sơ đồ/tài liệu>` (VD: `[REG] Add UC-REG-01 sequence diagram`)