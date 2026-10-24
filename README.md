# DỰ ÁN PHÂN TÍCH VÀ THIẾT KẾ HỆ THỐNG (IT3120)
## HỆ THỐNG QUẢN LÝ ĐÀO TẠO ĐẠI HỌC THEO HỌC CHẾ TÍN CHỈ (HUST SIS)
### TRƯỜNG CÔNG NGHỆ THÔNG TIN VÀ TRUYỀN THÔNG (SOICT) — ĐẠI HỌC BÁCH KHOA HÀ NỘI

---

> [!IMPORTANT]
> ### 🔥 TRỌNG TÂM HIỆN TẠI: BÀI TẬP 1 — PROBLEM DISCOVERY, LEAN UX & SYSTEM REQUEST
> Toàn bộ repo đã được tái cấu trúc tinh gọn để 100% tài nguyên và sự tập trung của nhóm hướng vào việc hoàn thành xuất sắc **Bài tập 1** dựa trên 62 slides bài giảng chuẩn mực trong [`docs/OOAD_Lab_B1-5.md`](./docs/OOAD_Lab_B1-5.md).

---

## 1. BẢNG PHÂN CÔNG NHIỆM VỤ 4 THÀNH VIÊN (MÔ HÌNH 4 TÁC NHÂN)

Dự án áp dụng chiến lược **Workload Balancing**: TV1 phụ trách xuyên suốt luồng người dùng ưu tiên (Sinh viên) từ Problem Statement đến Lean UX và MVP; 3 thành viên còn lại phụ trách 3 tác nhân nội bộ kèm 3 chuyên đề học thuật lớn của môn học.

| Thành viên | Tác nhân phụ trách | Hạng mục bài tập đảm nhận | Slides tham chiếu | File làm bài chi tiết |
|:---:|---|---|:---:|---|
| **TV1** | **Sinh viên (SV)** *(Ưu tiên)* | • **TH1:** User Needs & Problem Statement của SV<br>• **TH2:** Problem Statement Canvas của SV<br>• **TH4:** Lean UX Canvas hoàn chỉnh 8 ô<br>• **TH5:** MVP Clickable Prototype & Usability Test Plan | Slide 7–21<br>Slide 33–44<br>Slide 56–62 | [`bai-tap-1/TV1-SinhVien.md`](./bai-tap-1/TV1-SinhVien.md) |
| **TV2** | **Cán bộ Đào tạo (CBĐT)** | • **TH1:** User Needs của CBĐT<br>• **TH2:** Problem Statement Canvas của CBĐT<br>• **TH3:** Chuỗi lập luận nhân quả, Phân tích 5 Whys, Biểu đồ Fishbone / 5W-1H, 3 Business Problems chuẩn 5 mục & Danh sách Business Requirements | Slide 7–19<br>Slide 22–35<br>Slide 54, 58 | [`bai-tap-1/TV2-CanBoDaoTao.md`](./bai-tap-1/TV2-CanBoDaoTao.md) |
| **TV3** | **Cán bộ Tài chính (CBTC)** | • **TH1:** User Needs của CBTC<br>• **TH2:** Problem Statement Canvas của CBTC<br>• **System Request:** Hồ sơ Đề xuất Hệ thống chính thức chuẩn 11 mục (Planning Phase), Phân tích Lợi ích 3 chiều, Đánh giá Khả thi 4 chiều & Ma trận Rủi ro | Slide 7–19<br>Slide 45–51 | [`bai-tap-1/TV3-CanBoTaiChinh.md`](./bai-tap-1/TV3-CanBoTaiChinh.md) |
| **TV4** | **Giảng viên (GV)** | • **TH1:** User Needs của GV<br>• **TH2:** Problem Statement Canvas của GV<br>• **Problem Discovery Report:** Biên soạn hoàn chỉnh Báo cáo Khám phá Vấn đề 5 phần (Executive Summary, Problem Anchor, Context, Methodology/Survey, Ma trận Điểm nghẽn Giao thoa 4 tác nhân)<br>• Trả lời 4 câu hỏi phản biện & Tự đánh giá theo 5 tiêu chí chấm điểm | Slide 7–21<br>Slide 51–55 | [`bai-tap-1/TV4-GiangVien.md`](./bai-tap-1/TV4-GiangVien.md) |

---

## 2. KỊCH BẢN "NEO ĐỒNG BỘ" XUYÊN SUỐT (5 PHÚT ĐỌC TRƯỚC KHI LÀM)

Để tránh tình trạng mỗi thành viên phân tích một hướng rời rạc, cả nhóm cùng neo vào một kịch bản nghiệp vụ trọng tâm:

> **Kịch bản Neo:** **"Đăng ký học phần, Kiểm tra điều kiện tiên quyết & Đối soát công nợ học phí đầu kỳ"**
> 
> *Luồng nghiệp vụ giao thoa giữa 4 tác nhân:*
> 1. **Cán bộ Đào tạo (TV2):** Thiết lập quy chế, mở đợt đăng ký, cấu hình môn tiên quyết và giới hạn sĩ số lớp.
> 2. **Cán bộ Tài chính (TV3):** Cập nhật đơn giá tín chỉ, đối soát công nợ cũ, gửi yêu cầu khóa/mở quyền đăng ký.
> 3. **Sinh viên (TV1):** Tra cứu môn học, kiểm tra điều kiện tiên quyết, xếp thời khóa biểu chống trùng và gửi đăng ký.
> 4. **Giảng viên (TV4):** Tiếp nhận danh sách lớp chính thức đã được chốt và quản lý sĩ số ổn định để giảng dạy.

Chi tiết về sơ đồ luồng Mermaid và ma trận điểm nghẽn có tại: [`docs/huong-dan-ke-hoach-bai-tap-1.md`](./docs/huong-dan-ke-hoach-bai-tap-1.md#phần-ii-chốt-nhanh-neo-đồng-bộ-5-phút-trước-khi-làm).

---

## 3. CẤU TRÚC THƯ MỤC DỰ ÁN

```
IT3120_QuanLyDaoTao/
├── README.md                           # Trang chủ điều phối dự án (File này)
├── AGENTS.md                           # Bộ quy tắc dành riêng cho AI Agent (No-code, 3 nguyên tắc cốt lõi)
├── .gitignore                          # Cấu hình Git bỏ qua file nhị phân/rác
│
├── docs/
│   ├── OOAD_Lab_B1-5.md                # Tài liệu gốc 62 slides bài giảng môn học (Bắt buộc đọc)
│   └── huong-dan-ke-hoach-bai-tap-1.md # Kịch bản Kế hoạch & Bàn giao chi tiết (Phần I đến IV)
│
├── bai-tap-1/                          # Thư mục chứa toàn bộ sản phẩm Bài tập 1
│   ├── TV1-SinhVien.md                 # Phiếu bài làm của TV1 (Sinh viên + Lean UX + MVP)
│   ├── TV2-CanBoDaoTao.md             # Phiếu bài làm của TV2 (CB Đào tạo + Business Problem + 5 Whys)
│   ├── TV3-CanBoTaiChinh.md           # Phiếu bài làm của TV3 (CB Tài chính + System Request 11 mục)
│   └── TV4-GiangVien.md              # Phiếu bài làm của TV4 (Giảng viên + Báo cáo 5 phần & Phản biện)
│
├── .agents/                            # Công cụ & Kỹ năng hỗ trợ của Agent
│   └── skills/                         # Các kỹ năng định dạng, PlantUML, Database, UCP
└── scripts/
    └── render.ps1                      # Script tự động hóa hỗ trợ
```

---

## 4. TIẾN ĐỘ THỰC HIỆN DỰ KIẾN (LỊCH TRÌNH 4 NGÀY TƯƠNG ĐỐI)

* **Ngày 0 (Khởi động - 15 phút):** Cả nhóm họp nhanh, đọc kỹ kịch bản neo tại Phần II trong tài liệu hướng dẫn.
* **Ngày 1:** Từng thành viên điền độc lập **Phần A (TH1)** và **Phần B (TH2)** trong file `bai-tap-1/TV*.md` của mình.
* **Ngày 2:** Mỗi thành viên tập trung hoàn thiện chuyên đề lớn được giao (TV1: Lean UX & MVP; TV2: Business Problem & 5 Whys; TV3: System Request; TV4: Báo cáo khám phá vấn đề).
* **Ngày 3:** TV4 tổng hợp dữ liệu từ 3 thành viên còn lại vào Báo cáo chung; cả nhóm rà soát chéo (Cross-review).
* **Ngày 4:** Sửa chữa các điểm chưa đồng nhất, đối soát theo 5 tiêu chí chấm điểm và nộp bài.

---

## 5. TÀI LIỆU HƯỚNG DẪN CHI TIẾT
Mọi câu hỏi về phương pháp luận, công thức viết phát biểu vấn đề, cấu trúc 5 Whys, Lean UX Canvas 8 ô và mẫu văn bản System Request đều được hướng dẫn chi tiết tại:
👉 **[`docs/huong-dan-ke-hoach-bai-tap-1.md`](./docs/huong-dan-ke-hoach-bai-tap-1.md)**
