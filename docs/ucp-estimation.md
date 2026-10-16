# HƯỚNG DẪN & CÔNG THỨC ƯỚC LƯỢNG CHI PHÍ PHẦN MỀM (USE CASE POINTS - UCP)

Tài liệu phục vụ thực hiện nội dung **Chương 5 của Báo cáo** do **Thành viên C** phụ trách tính toán.

---

## 1. Quy trình 5 bước tính toán Use Case Points (UCP)

### Bước 1: Tính Trọng số Tác nhân Chưa điều chỉnh (Unadjusted Actor Weight - UAW)
Phân loại toàn bộ các Actor của hệ thống thành 3 mức:

| Loại Actor | Đặc điểm nhận diện | Trọng số ($W_i$) | Danh sách Actor trong Hệ thống |
|---|---|:---:|---|
| **Đơn giản (Simple)** | Hệ thống ngoài giao tiếp qua API chuẩn, giao diện máy tính xác định (RESTful API, Web Services). | **1** | • Payment Gateway (Cổng thanh toán trực tuyến) |
| **Trung bình (Average)** | Hệ thống ngoài tương tác qua giao thức mạng phức tạp hơn hoặc email (SMTP, FTP, v.v.). | **2** | • Email Service (Dịch vụ gửi thông báo email) |
| **Phức tạp (Complex)** | Con người tương tác trực tiếp thông qua giao diện đồ họa (GUI / Web Browser / Mobile). | **3** | • Sinh viên (Student)<br>• Giảng viên (Instructor)<br>• Cán bộ Phòng Đào tạo<br>• Cán bộ Khoa/Viện<br>• Cán bộ Tài chính<br>• Quản trị hệ thống (Admin) |

$$\text{UAW} = \sum_{i=1}^{3} (\text{Số lượng Actor loại } i \times W_i)$$

### Bước 2: Tính Trọng số Ca sử dụng Chưa điều chỉnh (Unadjusted Use Case Weight - UUCW)
Phân loại toàn bộ các Use Case của hệ thống dựa vào số lượng giao dịch (transactions / bước xử lý):

| Loại Use Case | Số bước giao dịch (Transactions) | Trọng số ($W_j$) | Ví dụ tiêu biểu trong Đề tài |
|---|:---:|:---:|---|
| **Đơn giản (Simple)** | $1 - 3$ giao dịch, ít bảng dữ liệu liên quan | **5** | Đăng nhập, Xem thời khóa biểu, Tra cứu CTĐT |
| **Trung bình (Average)** | $4 - 7$ giao dịch, tác động nhiều bảng | **10** | Mở lớp học phần, Thanh toán học phí, Nộp đơn phúc khảo |
| **Phức tạp (Complex)** | $> 7$ giao dịch, nhiều rẽ nhánh kiểm tra quy tắc nghiệp vụ (BR) | **15** | `UC-REG-01` (Đăng ký học phần - BR01..06)<br>`UC-GRD-01` (Nhập điểm, GPA/CPA & Xét học vụ) |

$$\text{UUCW} = \sum_{j=1}^{3} (\text{Số lượng Use Case loại } j \times W_j)$$

### Bước 3: Tính Trọng số Ca sử dụng Chưa điều chỉnh Tổng (UUCP)
$$\text{UUCP} = \text{UAW} + \text{UUCW}$$

### Bước 4: Đánh giá Hệ số Phức tạp Kỹ thuật (TCF) và Môi trường (ECF)
- **Hệ số phức tạp Kỹ thuật (Technical Complexity Factor - TCF):** Gồm 13 yếu tố $T_1 \dots T_{13}$ (Hệ thống phân tán, hiệu năng, khả năng mở rộng, bảo mật, v.v.):
  $$\text{TCF} = 0.6 + (0.01 \times \sum_{k=1}^{13} (T_k \times \text{Weight}_k))$$
- **Hệ số Môi trường (Environmental Complexity Factor - ECF):** Gồm 8 yếu tố $E_1 \dots E_8$ (Kinh nghiệm nhóm, độ ổn định yêu cầu, động lực làm việc, v.v.):
  $$\text{ECF} = 1.4 + (-0.03 \times \sum_{m=1}^{8} (E_m \times \text{Weight}_m))$$

### Bước 5: Tính Tổng điểm UCP và Ước lượng Nỗ lực (Effort)
- **Tổng điểm Use Case Points:**
  $$\text{UCP} = \text{UUCP} \times \text{TCF} \times \text{ECF}$$
- **Ước lượng Giờ công nỗ lực (Effort):**
  $$\text{Effort (Man-hours)} = \text{UCP} \times \text{PF}$$
  *(Trong đó $\text{PF}$ - Productivity Factor: thường chọn chuẩn là **20 giờ / UCP**).*
- **Ước lượng Số tháng công (Man-months):**
  $$\text{Man-months} = \frac{\text{Effort}}{160 \text{ giờ/tháng}}$$

