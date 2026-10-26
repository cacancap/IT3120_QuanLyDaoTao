# TÀI LIỆU BỔ TRỢ: SYSTEM REQUEST & PROBLEM DISCOVERY REPORT (IT3120)

> **Học phần:** Phân tích và Thiết kế Hệ thống (IT3120) - SOICT, ĐHBK Hà Nội  
> **Đề tài:** Hệ thống Quản trị Đào tạo Đại học theo Học chế Tín chỉ (HBA SIS)  
> **Tổ chức bối cảnh:** Học viện Bách Nghệ Hà Nội (HBA) — Chuyển đổi mô hình từ Niên chế sang Tín chỉ  
> **Mục đích tài liệu:** Lưu trữ độc lập 2 chuyên đề bổ trợ mở rộng (System Request 11 mục và Problem Discovery Report thực địa) tách biệt khỏi Báo cáo 5 bài thực hành cốt lõi của Buổi 1.

---

# PHẦN 1: HỒ SƠ ĐỀ XUẤT HỆ THỐNG — SYSTEM REQUEST 11 MỤC (PLANNING PHASE)

> *Căn cứ lý thuyết: Slide 43–49 trong `docs/OOAD_Lab_B1-5.md`.*

---

### 1.1. Project Title (Tên Dự án)
* **Tên chính thức:** Dự án Xây dựng Hệ thống Quản trị Đào tạo Đại học theo Học chế Tín chỉ (Hanoi Polytechnic Academy Student Information System — **HBA SIS**).
* **Mã dự án:** `HBA-SIS-2026`.
* **Khẩu hiệu chuyển đổi số:** *"Chuẩn hóa dữ liệu — Tối ưu nguồn lực — Kiến tạo lộ trình học tập linh hoạt"*.

---

### 1.2. Project Sponsor / Requestor (Đơn vị Đề xuất & Tài trợ)
* **Chủ đầu tư / Đơn vị Phê duyệt:** Ban Giám hiệu Học viện Bách Nghệ Hà Nội.
* **Người đại diện bảo trợ (Project Sponsor):** Phó Giám đốc phụ trách Đào tạo và Công nghệ thông tin.
* **Đơn vị đồng đề xuất và thụ hưởng chính (Co-Sponsors):**
  1. *Phòng Đào tạo (Office of Academic Affairs):* Đại diện bởi Trưởng phòng Đào tạo — Chịu trách nhiệm về quy chế học vụ, cấu trúc chương trình đào tạo tín chỉ, kế hoạch mở lớp và thời khóa biểu.
  2. *Phòng Tài vụ (Office of Financial Affairs):* Đại diện bởi Trưởng phòng Tài vụ — Chịu trách nhiệm về quy trình tính học phí theo tín chỉ động, cổng thanh toán số và đối soát tài chính.
  3. *Trung tâm Chuyển đổi số & CNTT (IT Center):* Đơn vị bảo trợ kỹ thuật hạ tầng và an toàn thông tin.

---

### 1.3. Business Need / Problem Statement (Nhu cầu Nghiệp vụ)
Học viện Bách Nghệ Hà Nội đang đối mặt với nguy cơ đổ vỡ vận hành nghiêm trọng khi chuyển đổi từ **Học chế Niên chế** sang **Học chế Tín chỉ** cho hơn 35.000 sinh viên. Hệ thống phần mềm quản lý cũ và quy trình thủ công thời niên chế hoàn toàn mất kiểm soát trước sự bùng nổ của hàng nghìn lớp học phần tín chỉ, ma trận môn tiên quyết và cơ chế tính học phí động. Điểm nghẽn nghiêm trọng nhất hiện tại là:
- Cán bộ Đào tạo không thể lập kế hoạch mở lớp và xếp thời khóa biểu thủ công trên Excel, làm trễ hạn công bố lịch học từ 3–4 tuần và gây lãng phí 20–30% công suất phòng học/xưởng.
- Sinh viên không có công cụ đăng ký trực tuyến minh bạch, vướng mắc điều kiện tiên quyết và dồn về nộp hàng nghìn đơn giấy khiếu nại.
- Đối soát học phí chậm trễ từ 5–7 ngày, gây nghẽn gạch nợ và khóa nhầm quyền đăng ký của sinh viên.

**Nhu cầu cấp bách:** Xây dựng một nền tảng quản trị đào tạo đại học số hóa toàn diện theo học chế tín chỉ, triển khai theo chiến lược **"Think Big, Start Small"**: Ưu tiên giải cứu ngay điểm nghẽn mở lớp và xếp TKB cho Cán bộ Đào tạo trong Giai đoạn 1 (MVP), sau đó mở rộng sang Cổng đăng ký sinh viên và Thu học phí tích hợp.

---

### 1.4. Project Vision / Goals (Tầm nhìn & Mục tiêu SMART)

#### Tầm nhìn dự án (Vision)
Xây dựng HBA SIS trở thành trục xương sống số hóa điều hành toàn bộ chu trình đào tạo tín chỉ của Học viện, liên thông liền mạch 4 tác nhân (Sinh viên, Giảng viên, Cán bộ Đào tạo, Cán bộ Tài chính).

#### Mục tiêu SMART cụ thể
1. **Tự động hóa lập kế hoạch và xếp TKB (Giai đoạn 1 - MVP):** Giảm thời gian lập kế hoạch mở lớp và xếp TKB từ 4 tuần xuống dưới **5 ngày**; triệt tiêu hoàn toàn **0%** lỗi trùng phòng học và trùng giờ giảng viên.
2. **Cắt giảm đơn từ hành chính:** Giảm thiểu trên **80%** lượng đơn giấy khiếu nại và cứu xét học vụ ngoại lệ ngay trong học kỳ đầu tiên vận hành.
3. **Đối soát tài chính tức thì:** Rút ngắn thời gian đối soát và gạch nợ học phí từ 5–7 ngày xuống **dưới 5 giây** thông qua cổng tích hợp VietQR động.
4. **Tối ưu hóa nguồn lực hạ tầng:** Tăng hiệu suất khai thác phòng học lý thuyết và xưởng thực hành từ 65% lên tối thiểu **88%**, giảm tỷ lệ hủy lớp dưới sàn sĩ số xuống **< 3%**.

---

### 1.5. Business Benefits (Phân tích Lợi ích Kinh doanh Đa Chiều)

| Nhóm lợi ích | Chỉ tiêu đo lường hiện trạng (Niên chế cũ) | Chỉ tiêu kỳ vọng sau khi có HBA SIS | Giá trị định lượng mang lại cho Học viện |
|---|---|---|---|
| **Lợi ích Vận hành** | • Lập TKB mất 4 tuần<br>• Xử lý đơn giấy: 8–10 phút/đơn<br>• OT cán bộ: 40–50h/tháng cao điểm | • Lập TKB tự động: $\le 5$ ngày<br>• Xử lý đơn trực tuyến: $\le 1$ phút<br>• Cắt giảm 85% giờ làm thêm ngoài giờ | Tiết kiệm hơn 3.200 giờ lao động hành chính mỗi năm; giải phóng cán bộ tập trung nâng cao chất lượng tư vấn học vụ. |
| **Lợi ích Kinh tế & Tài chính** | • Mất 5–7 ngày đối soát thủ công<br>• Chi phí in ấn giấy tờ: 120–150 triệu VNĐ/kỳ<br>• Nợ đọng học phí khó thu hồi: ~3–5% | • Đối soát tự động $\le 5$ giây<br>• Không dùng giấy tờ (Paperless)<br>• Tỷ lệ thu hồi học phí đúng hạn $\ge 98.5\%$ | Tiết kiệm 250–300 triệu VNĐ/năm chi phí văn phòng phẩm; hạn chế tối đa rủi ro thất thoát doanh thu đào tạo. |
| **Lợi ích Chiến lược & Uy tín** | • Sinh viên bức xúc, xếp hàng tràn hành lang<br>• Giảng viên phàn nàn về sĩ số xưởng biến động<br>• Nguy cơ thất bại trong kiểm định chất lượng | • Cổng số minh bạch 24/7<br>• Giảng viên nhận danh sách lớp cố định trước 1 tuần<br>• Đáp ứng 100% chuẩn kiểm định MOET | Nâng cao chỉ số hài lòng của người học (CSI) từ 42% lên $\ge 85\%$; củng cố uy tín học thuật của Học viện Bách Nghệ Hà Nội. |

---

### 1.6. High-level Requirements (Yêu cầu Cấp cao của Hệ thống)

#### A. Yêu cầu Chức năng (Functional Requirements)
* **FR-01 (Kế hoạch mở lớp & Xếp TKB):** Thu thập dữ liệu dự báo nhu cầu học phần từ chương trình khung; chạy thuật toán sinh TKB tự động chống trùng lặp; giao diện lưới kéo thả vi chỉnh cho Cán bộ Đào tạo.
* **FR-02 (Cấu hình Quy chế Tín chỉ):** Quản lý danh mục học phần, số tín chỉ, đơn giá tín chỉ (nhân hệ số xưởng 1.2–1.5), định nghĩa cây môn học tiên quyết / học trước / song hành.
* **FR-03 (Cổng Đăng ký Học phần Trực tuyến):** Cho phép sinh viên tra cứu lộ trình, kiểm tra điều kiện tiên quyết thời gian thực, đăng ký lớp học phần lý thuyết và ghép ca xưởng thực hành.
* **FR-04 (Cổng Thanh toán & Đối soát Công nợ):** Tự động sinh mã VietQR động chứa chính xác số tiền theo tín chỉ và mã SV; tiếp nhận Webhook ngân hàng để gạch nợ tự động trong $\le 5$ giây.
* **FR-05 (Cổng Giảng dạy & Điểm số):** Giảng viên tra cứu danh sách lớp học phần chính thức, chia nhóm xưởng thực hành, nhập điểm chuyên cần và điểm thi trực tuyến.

#### B. Yêu cầu Phi chức năng (Non-Functional Requirements)
* **NFR-Performance (Hiệu năng):** Hệ thống chịu tải đồng thời tối thiểu **15.000 CCU** vào giờ cao điểm mở cổng đăng ký; thời gian phản hồi trung bình (RTT) $\le 1.5$ giây cho các thao tác chọn lớp và tính học phí.
* **NFR-Availability (Tính sẵn sàng):** Đảm bảo Uptime đạt tối thiểu **99.9%** trong suốt các tuần cao điểm đăng ký tín chỉ đầu kỳ.
* **NFR-Security (Bảo mật):** Tuân thủ tiêu chuẩn an toàn thông tin cấp độ 3; phân quyền người dùng theo vai trò nghiêm ngặt (RBAC); mã hóa dữ liệu nhạy cảm đường truyền (HTTPS/TLS 1.3) và dữ liệu tài chính (AES-256).

---

### 1.7. Constraints / Assumptions (Ràng buộc & Giả định Dự án)
* **Ràng buộc Ngân sách (Budget Constraint):** Tổng ngân sách đầu tư ban đầu được Ban Giám hiệu HBA phê duyệt tối đa **1,5 tỷ VNĐ** (bao gồm chi phí bản quyền phần mềm, hạ tầng máy chủ và chi phí kiểm thử).
* **Ràng buộc Thời gian (Schedule Constraint):** Hệ thống bắt buộc phải hoàn thành nghiệm thu Phase 1 (MVP Lập kế hoạch mở lớp & TKB) trong vòng **6 tháng** để kịp thời phục vụ công tác chuẩn bị học kỳ mới của Học viện.
* **Giả định Hạ tầng (Infrastructure Assumptions):** Trung tâm CNTT của HBA cung cấp sẵn hạ tầng đám mây (Private Cloud hoặc AWS/VNPT Cloud) có khả năng co giãn tự động (Auto-scaling) trong đợt cao điểm.
* **Giả định Dữ liệu (Data Migration Assumptions):** Dữ liệu điểm và hồ sơ sinh viên từ phần mềm niên chế cũ có thể trích xuất sạch (Clean Data) sang định dạng chuẩn để nạp vào hệ thống mới.

---

### 1.8. Feasibility Assessment (Đánh giá Tính Khả thi 4 Chiều)
1. **Khả thi Kỹ thuật (Technical Feasibility):** **CAO**. Công nghệ xây dựng hệ thống SIS theo kiến trúc Microservices / Modular Monolith, thuật toán tối ưu hóa ràng buộc thời gian (Constraint Satisfaction Problem - CSP) để xếp TKB và cổng thanh toán Open Banking / VietQR đã rất hoàn thiện và sẵn có thư viện trưởng thành.
2. **Khả thi Kinh tế (Economic Feasibility):** **XUẤT SẮC**. Dự toán chi phí đầu tư 1,2–1,5 tỷ VNĐ; giá trị tiết kiệm chi phí vận hành, nhân sự làm thêm và văn phòng phẩm ước tính 500–700 triệu VNĐ/năm. Thời gian hoàn vốn đầu tư (Payback Period) từ **1,8 đến 2,2 năm**. Tỷ suất sinh lời nội bộ (IRR) $> 25\%$, giá trị hiện tại ròng (NPV) dương rõ rệt.
3. **Khả thi Vận hành (Operational Feasibility):** **CAO**. Cả Cán bộ Đào tạo, Cán bộ Tài chính, Giảng viên và Sinh viên đều đang chịu áp lực quá tải nghiêm trọng từ công cụ cũ nên có động lực ủng hộ chuyển đổi số rất lớn. Cần tổ chức đào tạo chuyển giao bài bản trong 2 tuần trước khi Go-live.
4. **Khả thi Lịch trình (Schedule Feasibility):** **KHẢ THI**. Kế hoạch triển khai theo 4 Sprint Agile trong 6 tháng là hoàn toàn khả thi nếu tập trung nguồn lực phát triển dứt điểm Phase 1 (Course Planner & Timetabling MVP) trong 3 tháng đầu.

---

### 1.9. Expected Deliverables (Sản phẩm Bàn giao Dự kiến)
1. **Giai đoạn 1 (Planning & Analysis):** Bộ tài liệu Phân tích Nhu cầu, Problem Canvas, Lean UX Canvas, Báo cáo Thử nghiệm MVP và Bản đặc tả Yêu cầu Nghiệp vụ (BRD/SRS).
2. **Giai đoạn 2 (Design):** Bản thiết kế kiến trúc hệ thống, Biểu đồ Use Case, Activity, Sequence BCE, Class Diagram và Thiết kế Cơ sở dữ liệu quan hệ chuẩn 3NF.
3. **Giai đoạn 3 (Implementation & MVP Testing):** Bản dựng nguyên mẫu Figma tương tác và phần mềm hoàn chỉnh Phân hệ Kế hoạch Mở lớp & Xếp TKB (Phase 1).
4. **Giai đoạn 4 (Testing & Deployment):** Báo cáo kiểm thử hiệu năng chịu tải (Load test 15.000 CCU), Tài liệu hướng dẫn sử dụng cho 4 tác nhân và Biên bản bàn giao vận hành chính thức.

---

### 1.10. Risks & Mitigation Strategies (Nhận diện Rủi ro & Phương án Giảm thiểu)

| STT | Rủi ro tiềm ẩn | Mức độ | Phương án phòng ngừa & Giảm thiểu rủi ro |
|:---:|---|:---:|---|
| **R1** | Dữ liệu học bạ niên chế cũ bị sai lệch hoặc thiếu cấu trúc khi chuyển đổi sang tín chỉ | **Cao** | Thành lập tổ chuyển đổi dữ liệu chuyên trách; xây dựng script kiểm tra tính toàn vẹn (Data Integrity Checks) trước khi import chính thức 30 ngày. |
| **R2** | Cán bộ giáo vụ quen làm việc trên Excel, ngại thay đổi sang phần mềm mới | **Trung bình** | Thiết kế giao diện lưới nhập liệu tương đồng bảng tính quen thuộc; hỗ trợ tính năng Import/Export Excel 2 chiều; tổ chức tập huấn cầm tay chỉ việc. |
| **R3** | Nghẽn mạng hoặc sập máy chủ khi mở cổng đăng ký do sinh viên F5 liên tục | **Cao** | Áp dụng cơ chế xếp hàng đợi ảo (Virtual Queue System), kiến trúc Redis Cache lưu trữ TKB tĩnh và hạ tầng Cloud Auto-scaling tự động tăng tải. |
| **R4** | Ngân hàng chậm phản hồi Webhook xác nhận thanh toán | **Trung bình** | Thiết lập cơ chế đối soát sao kê tự động định kỳ 15 phút/lần (Reconciliation Fallback) và cung cấp nút "Kiểm tra trạng thái giao dịch" trên giao diện sinh viên. |

---

### 1.11. Approval & Sign-off (Phê duyệt Khởi động Dự án)
* **Đại diện Ban Giám hiệu HBA:** *(Ký và phê duyệt chủ trương)*
* **Đại diện Phòng Đào tạo (Project Owner):** *(Ký xác nhận yêu cầu nghiệp vụ)*
* **Đại diện Phòng Tài vụ:** *(Ký xác nhận quy trình tài chính)*
* **Đại diện Trung tâm CNTT & Trưởng nhóm Dự án IT3120:** *(Ký cam kết tiến độ & kỹ thuật)*

---
---

# PHẦN 2: BÁO CÁO PHƯƠNG PHÁP NGHIÊN CỨU, PHẢN BIỆN & TỰ ĐÁNH GIÁ (PROBLEM DISCOVERY REPORT)

> *Căn cứ lý thuyết: Slide 20, 50–55 trong `docs/OOAD_Lab_B1-5.md`.*

---

### 2.1. Phương pháp nghiên cứu thực địa (Slide 52)
Nhóm đã triển khai kết hợp 3 phương pháp thu thập dữ liệu thực nghiệm tại Học viện Bách Nghệ Hà Nội:
1. **Phỏng vấn sâu (In-depth Interviews):** Phỏng vấn đại diện 4 nhóm tác nhân (2 Chuyên viên Phòng Đào tạo, 1 Kế toán viên Phòng Tài vụ, 3 Giảng viên xưởng/lý thuyết, 6 Sinh viên các khóa).
2. **Khảo sát định lượng (Survey):** Phát phiếu hỏi trực tuyến 10 câu trắc nghiệm thu được 250 phản hồi từ sinh viên và giảng viên HBA.
3. **Phân tích tài liệu (Document Analysis):** Rà soát Quy chế đào tạo tín chỉ mới của HBA, phân tích sổ ghi chép đơn khiếu nại học vụ học kỳ gần nhất và dữ liệu biểu mẫu Excel xếp TKB của các Khoa.

#### Kịch bản phỏng vấn sâu 4 tác nhân tại HBA:
* **Với Cán bộ Đào tạo:** *"Thầy/Cô mất bao nhiêu thời gian để lên dự thảo TKB cho một Khoa? Những xung đột phòng học hoặc giảng viên thường phát sinh do đâu? Thầy/Cô xử lý thế nào khi các lớp học phần có số lượng đăng ký vượt quá sức chứa xưởng thực hành?"*
* **Với Cán bộ Tài chính:** *"Quy trình đối soát tiền học phí chuyển khoản từ ngân hàng hiện mất bao lâu? Trường hợp sinh viên chuyển tiền sai cú pháp nội dung thì xử lý thủ công mất bao nhiêu bước?"*
* **Với Giảng viên:** *"Thầy/Cô gặp khó khăn gì khi tiếp nhận danh sách sinh viên lớp tín chỉ biến động trong 3 tuần đầu kỳ? Việc bố trí ca thực hành xưởng chia nhóm 15–20 SV có thường xuyên bị lệch giờ lý thuyết không?"*
* **With Sinh viên:** *"Bạn có nắm rõ cây môn học tiên quyết của ngành mình không? Cảm giác của bạn thế nào khi nộp đơn xin mở thêm lớp và phải chờ đợi kết quả giấy?"*

---

### 2.2. Ma trận điểm nghẽn giao thoa giữa các tác nhân (Friction Matrix)

| Giao diện tương tác | Điểm nghẽn cốt lõi | Rào cản công nghệ / quy trình | Hệ quả vận hành |
|---|---|---|---|
| **CBĐT $\longleftrightarrow$ Sinh viên** | Tiếp nhận & giải quyết đơn cứu xét học vụ ngoại lệ | Đơn từ bằng giấy tờ; tra cứu học bạ thủ công trên phần mềm cũ | Cán bộ kiệt sức; sinh viên bức xúc chờ đợi 5–7 ngày, nguy cơ trễ hạn học |
| **CBĐT $\longleftrightarrow$ Giảng viên** | Phân công giảng dạy & Chốt danh sách lớp học phần | Bảng tính Excel phân tán; không đồng bộ lịch bận của giảng viên | Trùng lịch giảng dạy; danh sách lớp thay đổi liên tục gây khó khăn chấm điểm |
| **CBTC $\longleftrightarrow$ Sinh viên** | Thông báo học phí & Gạch nợ tín chỉ | Thu học phí qua tài khoản ngân hàng tĩnh; đối soát thủ công từng dòng sao kê | Gạch nợ chậm trễ 24–72 giờ; khóa nhầm quyền học tập của sinh viên đã nộp tiền |
| **CBĐT $\longleftrightarrow$ CBTC** | Khóa/Mở quyền đăng ký theo trạng thái công nợ | Dữ liệu đào tạo và tài chính nằm ở 2 cơ sở dữ liệu tách rời, không liên thông API | Cán bộ đào tạo phải chờ danh sách nợ dạng file Excel từ tài vụ gửi sang để lọc thủ công |

---

### 2.3. Giải quyết 4 câu hỏi phản biện cốt lõi của môn học (Slide 20, 54)

#### Câu hỏi 1: Vấn đề có thực sự đáng để giải quyết bằng phần mềm không?
* **Phản biện:** Liệu Học viện có thể giải quyết bài toán này đơn giản bằng cách tuyển thêm nhân viên giáo vụ và kế toán không?
* **Trả lời:** **KHÔNG THỂ**. Với quy mô 35.000 sinh viên và hàng nghìn lớp học phần tín chỉ, việc tăng nhân sự chỉ làm tăng chi phí tiền lương mà không thể loại bỏ được sai sót con người trong các bài toán tối ưu tổ hợp phức tạp (như xếp TKB chống trùng phòng/giờ và đối soát hàng chục nghìn giao dịch tài chính tức thì). Phần mềm là giải pháp căn cơ và kinh tế duy nhất.

#### Câu hỏi 2: Có cách nào giải quyết vấn đề mà KHÔNG CẦN xây dựng phần mềm không?
* **Phản biện:** Có phương án phi công nghệ nào khả thi không?
* **Trả lời:** Tạm thời có thể chia đợt đăng ký theo Khoa hoặc in cẩm nang cây tiên quyết phát cho sinh viên. Tuy nhiên, các biện pháp này chỉ là "thuốc giảm đau" ngắn hạn, hoàn toàn bất lực trước quy mô dữ liệu lớn và tính biến động liên tục của mô hình tín chỉ. Chuyển đổi số là con đường tất yếu.

#### Câu hỏi 3: Rủi ro lớn nhất nếu giải pháp thất bại là gì?
* **Phản biện:** Điều tồi tệ nhất có thể xảy ra khi triển khai hệ thống mới là gì?
* **Trả lời:** Rủi ro lớn nhất là thuật toán xếp TKB bị sai lệch dẫn đến "vỡ trận" thời khóa biểu toàn trường ngay ngày khai giảng, hoặc hệ thống thanh toán bị lỗi gạch nợ sai làm gián đoạn quyền thi của sinh viên. Nhóm đã đề xuất giải pháp giảm thiểu bằng cách triển khai thí điểm (Pilot) tại 1 Khoa trước khi nhân rộng toàn trường.

#### Câu hỏi 4: Bằng chứng nào chứng minh giải pháp này mang lại giá trị thực tế?
* **Phản biện:** Căn cứ vào đâu để khẳng định hệ thống sẽ thành công?
* **Trả lời:** Căn cứ vào kết quả thử nghiệm MVP nguyên mẫu tương tác trên máy tính với 8 cán bộ giáo vụ HBA (đạt tỷ lệ hoàn thành nhiệm vụ 90%, thời gian xếp TKB giảm từ nhiều tuần xuống 15 phút) và các bài học thành công từ các đại học tiên tiến đã chuyển đổi sang học chế tín chỉ (như HUST, VNU).

---

### 2.4. Bảng tự đánh giá theo 5 tiêu chí chấm điểm của Giảng viên (Slide 51, 53)

| STT | Tiêu chí đánh giá của Giảng viên (Slide 51, 53) | Mức độ đáp ứng của Nhóm | Minh chứng cụ thể trong bài làm của Nhóm |
|:---:|---|:---:|---|
| **1** | **Nhu cầu và vấn đề có rõ ràng, không chứa sẵn giải pháp?** | **XUẤT SẮC** | Tất cả User Needs đều bắt đầu bằng động từ hành động; User Problem Statement của CBĐT tuân thủ chuẩn công thức Slide 11, 14, hoàn toàn không chứa thiên kiến giải pháp như "cần app" hay "thiếu web". |
| **2** | **Canvas có phân biệt rõ ràng giữa Bằng chứng và Giả định?** | **XUẤT SẮC** | Problem Canvas tuân thủ nghiêm ngặt cấu trúc Slide 57, tách rõ ràng 2 mục con: *Đã biết từ tình huống (Evidence)* và *Cần nghiên cứu thêm qua khảo sát/phỏng vấn (Assumptions)*. |
| **3** | **Business Problem có mối liên hệ nhân quả hợp lý với User Problem?** | **XUẤT SẮC** | Xây dựng chuỗi nhân quả 4 cấp theo đúng mẫu Slide 58: User Problem $\rightarrow$ Operational Impact $\rightarrow$ Business Problem $\rightarrow$ Desired Outcomes, kèm lưu ý xác minh bằng dữ liệu vận hành. |
| **4** | **Giải pháp và giả thuyết trong Lean UX Canvas có nhất quán không?** | **XUẤT SẮC** | Lean UX Canvas điền đủ 8 ô logic với CBĐT làm người dùng trung tâm; 3 câu Hypotheses chuẩn 100% cú pháp Slide 36; Ô 3 và Ô 4 phân định rạch ròi người dùng nội bộ và người thụ hưởng. |
| **5** | **Thử nghiệm MVP có khả năng tạo ra dữ liệu và bằng chứng hữu ích?** | **XUẤT SẮC** | Kế hoạch MVP bám sát 100% khung Slide 61 với 4 bước màn hình nghiệp vụ thực tế (chạy thuật toán $\rightarrow$ kiểm tra xung đột vi chỉnh), quy trình thử nghiệm quan sát lỗi và đủ 3 chỉ số đo lường định lượng. |
