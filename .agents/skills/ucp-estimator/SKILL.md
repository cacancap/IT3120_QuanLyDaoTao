---
name: ucp-estimator
description: >-
  Formulas, steps, calculation guidelines, and report templates for software cost estimation
  using Use Case Points (UCP) in IT3120 Chapter 5.
---

# Use Case Points (UCP) Estimator Skill for IT3120

Skill này cung cấp phương pháp luận, công thức chuẩn và bảng biểu định dạng sẵn để thực hiện nội dung **Chương 5: Ước lượng Chi phí Phần mềm theo Phương pháp Use Case Points (UCP)** cho môn học Phân tích và Thiết kế Hệ thống (IT3120).

---

## 1. Quy trình 5 Bước Tính toán UCP Chuẩn HUST

### Bước 1: Tính Trọng số Tác nhân Chưa điều chỉnh (Unadjusted Actor Weight - UAW)
Phân loại toàn bộ các Actor thành 3 mức:
* **Simple (Trọng số = 1):** Hệ thống ngoài tương tác qua REST API/Web Service chuẩn.
  * *Ví dụ đề tài:* Cổng thanh toán (Payment Gateway).
* **Average (Trọng số = 2):** Hệ thống ngoài tương tác qua giao thức mạng/gửi mail.
  * *Ví dụ đề tài:* Dịch vụ Email (Email Service).
* **Complex (Trọng số = 3):** Con người tương tác qua giao diện Web/GUI.
  * *Ví dụ đề tài:* Sinh viên, Giảng viên, Cán bộ Đào tạo, Cán bộ Khoa, Cán bộ Tài chính, Quản trị hệ thống (6 Actors).

$$\text{UAW} = (N_{\text{Simple}} \times 1) + (N_{\text{Average}} \times 2) + (N_{\text{Complex}} \times 3)$$
*Áp dụng cho đề tài:* $\text{UAW} = (1 \times 1) + (1 \times 2) + (6 \times 3) = 1 + 2 + 18 = 21$.

---

### Bước 2: Tính Trọng số Ca sử dụng Chưa điều chỉnh (Unadjusted Use Case Weight - UUCW)
Phân loại toàn bộ Use Cases theo số lượng bước giao dịch (transactions):
* **Simple (Trọng số = 5):** $1 - 3$ giao dịch (Đăng nhập, Xem TKB, Tra cứu CTĐT...).
* **Average (Trọng số = 10):** $4 - 7$ giao dịch (Mở lớp học phần, Thanh toán học phí, Nộp phúc khảo...).
* **Complex (Trọng số = 15):** $> 7$ giao dịch hoặc luồng rẽ nhánh dày đặc kiểm tra BR:
  * `UC-REG-01`: Đăng ký học phần (tích hợp BR-01..05 & BR-06).
  * `UC-GRD-01`: Nhập điểm, GPA/CPA & Cảnh báo học vụ (BR-07..10).
  * `UC-CUR-01`: Xây dựng CTĐT & kiểm tra chu trình DAG.
  * `UC-SCH-01`: Mở lớp & xếp TKB chống xung đột thời gian.

$$\text{UUCW} = (N_{\text{UC-Simple}} \times 5) + (N_{\text{UC-Average}} \times 10) + (N_{\text{UC-Complex}} \times 15)$$

---

### Bước 3: Tính Trọng số Tổng Chưa điều chỉnh (UUCP)
$$\text{UUCP} = \text{UAW} + \text{UUCW}$$

---

### Bước 4: Đánh giá Hệ số Phức tạp Kỹ thuật (TCF) và Môi trường (ECF)

#### 4.1. Hệ số Phức tạp Kỹ thuật (TCF - Technical Complexity Factor)
Gồm 13 yếu tố $T_1 \dots T_{13}$, mỗi yếu tố đánh giá mức độ ảnh hưởng từ 0 (không ảnh hưởng) đến 5 (ảnh hưởng tối đa):

| Mã | Yếu tố kỹ thuật | Trọng số ($w_i$) | Gợi ý mức điểm ($v_i$) cho đề tài |
|---|---|:---:|:---:|
| $T_1$ | Hệ thống phân tán | 2.0 | 3 |
| $T_2$ | Mục tiêu thời gian đáp ứng (Response time) | 1.0 | 5 (đăng ký đồng thời) |
| $T_3$ | Hiệu quả sử dụng tài nguyên người dùng | 1.0 | 3 |
| $T_4$ | Độ phức tạp xử lý nội bộ | 1.0 | 4 (thuật toán DAG, BRs) |
| $T_5$ | Mã nguồn có thể tái sử dụng | 1.0 | 3 |
| $T_6$ | Dễ dàng cài đặt | 0.5 | 3 |
| $T_7$ | Dễ sử dụng | 0.5 | 4 |
| $T_8$ | Khả năng di chuyển giữa các nền tảng | 2.0 | 3 |
| $T_9$ | Dễ thay đổi, bảo trì | 1.0 | 4 |
| $T_{10}$ | Khả năng xử lý đồng thời (Concurrency) | 1.0 | 5 (đỉnh điểm đăng ký) |
| $T_{11}$ | Tính năng bảo mật đặc biệt | 1.0 | 4 (điểm số, tài chính) |
| $T_{12}$ | Cung cấp truy cập trực tiếp cho bên thứ ba | 1.0 | 2 (cổng thanh toán) |
| $T_{13}$ | Yêu cầu đào tạo người dùng | 1.0 | 2 |

$$\text{TCF} = 0.6 + \left(0.01 \times \sum_{i=1}^{13} (w_i \times v_i)\right)$$

#### 4.2. Hệ số Môi trường (ECF - Environmental Complexity Factor)
Gồm 8 yếu tố $E_1 \dots E_8$:

| Mã | Yếu tố môi trường | Trọng số ($w_j$) | Đánh giá ($v_j$) |
|---|---|:---:|:---:|
| $E_1$ | Quen thuộc với quy trình phát triển | 1.5 | 3 |
| $E_2$ | Kinh nghiệm ứng dụng nghiệp vụ | 0.5 | 3 |
| $E_3$ | Kinh nghiệm hướng đối tượng (OOAD) | 1.0 | 4 |
| $E_4$ | Năng lực của Chuyên viên phân tích (Lead) | 0.5 | 4 |
| $E_5$ | Động lực làm việc của nhóm | 1.0 | 4 |
| $E_6$ | Tính ổn định của yêu cầu | 2.0 | 4 |
| $E_7$ | Nhân sự làm việc bán thời gian | -1.0 | 3 |
| $E_8$ | Độ khó của ngôn ngữ lập trình | -1.0 | 2 |

$$\text{ECF} = 1.4 + \left(-0.03 \times \sum_{j=1}^{8} (w_j \times v_j)\right)$$

---

### Bước 5: Tính Tổng UCP và Quy đổi Nỗ lực (Effort)
1. **Điểm UCP chuẩn hóa:**
   $$\text{UCP} = \text{UUCP} \times \text{TCF} \times \text{ECF}$$
2. **Nỗ lực giờ công (Man-hours):**
   $$\text{Effort} = \text{UCP} \times \text{PF}$$
   *(Chuẩn khuyến nghị của môn học: $\text{PF} = 20 \text{ giờ/UCP}$).*
3. **Số tháng công (Man-months):**
   $$\text{Man-months} = \frac{\text{Effort}}{160 \text{ giờ/tháng}}$$

---

## 2. Hướng dẫn Xuất Dữ liệu vào Báo cáo

Khi nhóm cần hoàn thiện Chương 5 trong báo cáo, Agent sử dụng skill này để sinh ra các bảng tổng hợp đầy đủ bằng Markdown có định dạng công thức LaTeX KaTeX chuẩn để dán trực tiếp vào báo cáo mà không cần tính toán thủ công.
