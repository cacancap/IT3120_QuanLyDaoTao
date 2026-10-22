# BẢN PHÁC THẢO THUYẾT TRÌNH BÀI THỰC HÀNH IT3120 (SOICT - ĐHBK HÀ NỘI)
## Đề tài: Hệ thống Quản lý Đào tạo Đại học theo Học chế Tín chỉ
**Thời lượng dự kiến:** 10 – 15 phút  
**Phương pháp luận:** User-Centered Design, Systems Thinking (Slide L02), Lean UX Canvas & Requirement Engineering (Slide L03)

---

## 📋 TỔNG QUAN CẤU TRÚC BÀI THUYẾT TRÌNH (SLIDE OUTLINE)

| Slide # | Tiêu đề Slide | Nội dung trọng tâm | Mục tiêu chuẩn hóa (Ảnh Slide) |
| :---: | :--- | :--- | :--- |
| **01** | **Tiêu đề & Giới thiệu Nhóm** | Tên đề tài, thành viên nhóm, bối cảnh bài thực hành SOICT | Mở đầu |
| **02** | **Phân biệt 3 Khái niệm Nền tảng** | User Needs vs. User Problem Statement vs. Business Problem | *Mục tiêu 1: Phân biệt 3 khái niệm & tránh bẫy tư duy* |
| **03** | **Tuyên bố Nhu cầu Người dùng (POV)** | Bản mẫu chuẩn hóa "Động từ vs. Danh từ" cho 4 tác nhân (SV, GV, PĐT, Tài vụ) theo slide 8 bài giảng SOICT | *Mục tiêu 1b: Bản mẫu POV hướng Động từ, tránh thiên kiến giải pháp* |
| **04** | **Viết User Problem Statement Chuẩn** | Công thức chuẩn hóa + Phát biểu cụ thể cho Sinh viên, Giảng viên, Phòng Đào tạo kèm bằng chứng nghiên cứu | *Mục tiêu 2: Viết User Problem Statement có bằng chứng* |
| **05** | **User Problem Statement Canvas** | Khung Canvas trực quan hóa: Persona, Bối cảnh, Khó khăn, Nguyên nhân gốc rễ (4 khía cạnh), Tác động | *Mục tiêu 3: Sử dụng Canvas làm rõ bối cảnh & nguyên nhân* |
| **06** | **Kết nối Vấn đề Người dùng & Kinh doanh** | Mô hình cầu nối nhân quả, Ma trận ánh xạ 1-1, Tuyệt đối không đánh đồng | *Mục tiêu 4: Kết nối mà không đánh đồng hai loại vấn đề* |
| **07** | **Lean UX Canvas (Phần 1: Ô 1 → Ô 5)** | Vấn đề kinh doanh, Kết quả kỳ vọng, Khách hàng, Giá trị người dùng, Giải pháp hệ thống | *Mục tiêu 5: Xây dựng Lean UX Canvas* |
| **08** | **Lean UX Canvas (Phần 2: Ô 6 → Ô 8)** | Giả thuyết kiểm chứng (Hypotheses), Rủi ro lớn nhất cần học, Kế hoạch thử nghiệm MVP | *Mục tiêu 5: Giả thuyết & Kế hoạch kiểm chứng* |
| **09** | **Kế hoạch Kiểm chứng Thực tế (Experiment Plan)** | Chỉ số đo lường (Metrics), Phương pháp thử nghiệm (Stress test, Usability test) | Đảm bảo tính khả thi thực tế |
| **10** | **Tổng kết & Q&A** | 3 thông điệp then chốt (Key Takeaways) & Mời thầy cô, các bạn đặt câu hỏi | Kết thúc |
| **11** | **Phụ lục: Phân công Trách nhiệm Nhóm** | Khớp nối 4 thành viên theo 4 phân hệ (CUR, SCH, REG, GRD) trong đồ án | Tổ chức nhóm |

---

## 🎤 CHI TIẾT TỪNG SLIDE & KỊCH BẢN THUYẾT TRÌNH (SPEAKER NOTES)

### SLIDE 1: MỞ ĐẦU & BỐI CẢNH DỰ ÁN
**Tiêu đề:** TỪ VẤN ĐỀ NGƯỜI DÙNG ĐẾN GIẢI PHÁP HỆ THỐNG: TIẾP CẬN BẰNG USER PROBLEM CANVAS VÀ LEAN UX CANVAS  
**Đề tài:** Hệ thống Quản lý Đào tạo Đại học theo Học chế Tín chỉ (SOICT - ĐHBK Hà Nội)  
**Nhóm thực hiện:** Nhóm [Số nhóm] (4 thành viên phụ trách 4 phân hệ: CUR, SCH, REG, GRD)

*Nội dung trên slide:*
- Logo Đại học Bách Khoa Hà Nội & SOICT.
- Thông điệp chủ đạo: *"Một hệ thống phần mềm chỉ thực sự thành công khi giải quyết đúng nỗi đau của người dùng (User Problem) để trực tiếp mang lại giá trị vận hành cho tổ chức (Business Value)."*

> **🗣️ Lời thoại thuyết trình (Speaker Script):**  
> *"Kính chào thầy/cô và các bạn. Hôm nay, nhóm chúng em xin trình bày kết quả bài thực hành phân tích yêu cầu môn IT3120 cho đề tài 'Hệ thống Quản lý Đào tạo Đại học theo Học chế Tín chỉ'. Thay vì vội vã nhảy ngay vào việc vẽ Use Case hay viết mã nguồn, bài thực hành này giúp nhóm trả lời câu hỏi cốt lõi nhất: Người dùng thực sự cần gì, gặp khó khăn gì, và làm sao để kết nối những khó khăn đó với mục tiêu quản lý của nhà trường thông qua hai công cụ: User Problem Statement Canvas và Lean UX Canvas."*

---

### SLIDE 2: PHÂN BIỆT USER NEEDS, USER PROBLEM STATEMENT VÀ BUSINESS PROBLEM
**Mục tiêu:** Giải quyết trọn vẹn Mục tiêu 1 của bài thực hành.

*Bảng so sánh trên slide:*

| Tiêu chí | 1. User Needs (Nhu cầu người dùng) | 2. User Problem Statement (Phát biểu vấn đề người dùng) | 3. Business Problem (Vấn đề nghiệp vụ / Nhà trường) |
| :--- | :--- | :--- | :--- |
| **Bản chất** | Mong muốn/Mục tiêu tích cực mà người dùng muốn hoàn thành. | Rào cản, khó khăn cụ thể cản trở người dùng đạt được nhu cầu + cảm xúc tiêu cực. | Tổn thất về chi phí, hiệu suất, uy tín hoặc rủi ro pháp lý/quy chế của tổ chức. |
| **Chủ thể** | Cá nhân người dùng (Sinh viên, Giảng viên). | Trải nghiệm của người dùng trong bối cảnh thực tế. | Tổ chức vận hành (Nhà trường, Phòng Đào tạo). |
| **Ví dụ tại ĐHBK HN** | *"Sinh viên cần đăng ký các học phần đúng lộ trình kỳ này mà không bị trùng lịch học."* | *"Sinh viên K67 bị văng khỏi cổng đăng ký và không kịp chọn lớp vì hệ thống sập trong 15 phút đầu, dẫn đến nguy cơ chậm tiến độ tốt nghiệp và cảm thấy bất an, hoảng loạn."* | *"Phòng Đào tạo tốn hơn 120 giờ nhân sự giải quyết 3.000 đơn khiếu nại mở lớp/hủy lớp thủ công, làm chậm tiến độ thu học phí và gây bức xúc dư luận."* |
| **Bẫy tư duy thường gặp (Pitfalls)** | Nhầm lẫn giữa **Nhu cầu** với **Tính năng phần mềm** (Ví dụ: "Nhu cầu của SV là cần một app mobile" $\to$ Sai, app là giải pháp). | Đánh đồng **Vấn đề người dùng** với **Vấn đề kinh doanh** (Ví dụ: "Vấn đề của SV là trường bị thiếu phòng học" $\to$ Sai, thiếu phòng là vấn đề của Nhà trường). | Nhầm lẫn **Triệu chứng bên ngoài** với **Vấn đề gốc rễ** (Ví dụ: "Sinh viên nộp đơn nhiều" chỉ là triệu chứng của việc đăng ký thất bại). |

> **🗣️ Lời thoại thuyết trình (Speaker Script):**  
> *"Thưa thầy cô, sai lầm phổ biến nhất trong phân tích hệ thống là 'nhảy cóc' từ nhu cầu người dùng sang tính năng phần mềm mà bỏ qua việc định nghĩa vấn đề. Ở bảng so sánh này, nhóm phân định rạch ròi: User Needs là 'mong muốn' (đăng ký đúng môn); User Problem là 'rào cản và nỗi đau' (hệ thống nghẽn, mất lượt, nguy cơ trễ tốt nghiệp); còn Business Problem là 'tổn thất của nhà trường' (quá tải phòng ban, chi phí trực ca, chậm tiến độ đào tạo). Việc tách biệt này giúp chúng em không áp đặt vấn đề của nhà trường lên vai người học."*

---

### SLIDE 3: TUYÊN BỐ NHU CẦU NGƯỜI DÙNG (USER NEED STATEMENT - POV) — NGUYÊN TẮC "ĐỘNG TỪ VS. DANH TỪ"
**Mục tiêu:** Xây dựng Bản mẫu hoàn chỉnh (Authoritative Reference Template) theo chuẩn bài giảng SOICT ĐHBK Hà Nội (Trang 8): Bản tường thuật quan điểm (Point of View - POV), lấy **ĐỘNG TỪ** hành động làm trung tâm thay vì **DANH TỪ** giải pháp cho cả 4 nhóm tác nhân chính.

#### 1. Khung lý thuyết & Bản chất học thuật chuẩn SOICT (Slide 8)
- **User Need Statement:** Là bản tường thuật quan điểm (Point of View - POV), tóm tắt súc tích và nhất quán:
  - **Người dùng là ai?** (Chân dung cụ thể, vai trò, bối cảnh)
  - **Họ cần gì?** (Nhu cầu, hành động, mục tiêu muốn đạt được)
  - **Tại sao điều đó lại quan trọng với họ?** (Sự thấu hiểu sâu sắc về động cơ / Deep Insight).
- **Mục đích cốt lõi (Core Purpose):**
  - Tập trung tuyệt đối vào **"ĐỘNG TỪ"** (hành động hoặc mục tiêu mà người dùng muốn hoàn thành) thay vì **"DANH TỪ"** (một giải pháp công nghệ, công cụ cụ thể hoặc một tính năng phần mềm như app, website, giao diện, bảng tính).
  - Triệt tiêu bẫy tư duy **Thiên kiến giải pháp (Solution Bias)**: Nhảy ngay vào "làm app gì, xây chức năng gì" khi chưa hiểu bản chất hành vi và mục đích cốt lõi của người dùng.
- **3 Yếu tố cấu thành bắt buộc (Key Elements):**
  1. **Chân dung người dùng cụ thể (Specific User Persona):** Xác định rõ ràng vị trí, trách nhiệm và áp lực thực tế trong quy trình đào tạo tín chỉ Bách Khoa.
  2. **Nhu cầu được xác định rõ ràng (Clear Need via Action Verbs):** Sử dụng các động từ hành động mạnh mẽ, độc lập với giải pháp kỹ thuật.
  3. **Sự thấu hiểu sâu sắc về động cơ (Deep Insight / Fundamental Motivation):** Đào sâu vào giá trị cốt lõi, tâm lý, trách nhiệm pháp lý và tác động sống còn đối với người dùng nếu nhu cầu không được đáp ứng.

#### 2. Cấu trúc câu chuẩn mực (POV Reference Template)
$$\text{[Chân dung người dùng cụ thể]} + \text{\textbf{cần [Hành động / Mục tiêu bằng ĐỘNG TỪ]}} + \text{\textbf{bởi vì [Sự thấu hiểu sâu sắc về động cơ -- Deep Insight]}}$$

---

#### 3. Bản mẫu hoàn chỉnh cho 4 Nhóm Tác nhân Lõi (CUR - SCH - REG - GRD)

##### 1. Sinh viên Đại học Chính quy (Trọng tâm Phân hệ REG & SCH)
* **[Người dùng là ai]:** Sinh viên đại học chính quy ĐHBK Hà Nội (đặc biệt giai đoạn chuyển tiếp năm 2 – năm 4 chuẩn bị bước vào khối kiến thức chuyên ngành / làm đồ án tốt nghiệp).
* **[Cần gì - bằng ĐỘNG TỪ hành động]:** **Chủ động lựa chọn, sắp xếp thời khóa biểu hợp lý (không bị trùng kíp học BR-03), kiểm tra tức thời điều kiện học phần tiên quyết (BR-01) và ghi danh giữ chỗ kịp thời các lớp học phần theo đúng khung chương trình đào tạo chuẩn.**
* **[Bẫy tư duy: Danh từ vs. Động từ]:**
  * $\times$ **Bẫy Danh từ (SAI - Thiên kiến giải pháp):** *"Sinh viên cần một **ứng dụng di động (Mobile App) iOS/Android** có giao diện Dark Mode và nút đăng ký nhanh."*  
    $\to$ *Phân tích sai lầm:* App mobile hay Dark Mode chỉ là phương tiện/giải pháp công nghệ (Danh từ). Nếu ứng dụng mobile chạy mượt mà nhưng mở ra là hết chỗ, không cho lập kế hoạch trước hoặc không cảnh báo trùng lịch thì ứng dụng đó hoàn toàn vô giá trị với người học.
  * $\checkmark$ **Chuẩn Động từ (ĐÚNG - Hướng mục tiêu):** *"Sinh viên cần **lập kế hoạch học tập trước**, **kiểm tra tính hợp lệ học vụ tức thời**, và **xác nhận giữ chỗ an toàn** vào lớp học phần cốt lõi."*
* **[Tại sao quan trọng - Deep Insight / Động cơ sâu sắc]:**
  * Sinh viên không đăng ký tín chỉ vì sở thích tương tác phần mềm, mà vì mục tiêu sinh tồn học vụ: tích lũy đủ số tín chỉ yêu cầu của kỳ để bảo đảm tốt nghiệp đúng hạn 4–5 năm. Tại ĐHBK Hà Nội, các môn chuyên ngành thường chỉ mở 1 lần duy nhất trong cả năm học; một khi trượt môn hoặc không đăng ký được, sinh viên đối mặt nguy cơ chậm ra trường ít nhất 1 năm, kéo theo tổn thất tài chính lớn cho gia đình, mất cơ hội việc làm, học bổng và chịu áp lực tâm lý tự ti, hoang mang.

##### 2. Giảng viên Giảng dạy & Cố vấn Học thuật (Trọng tâm Phân hệ GRD & SCH)
* **[Người dùng là ai]:** Giảng viên trực tiếp phụ trách lớp học phần và giảng viên làm công tác cố vấn học tập tại các Trường/Khoa chuyên ngành.
* **[Cần gì - bằng ĐỘNG TỪ hành động]:** **Ghi nhận, tính toán chính xác điểm quá trình/cuối kỳ theo đúng tỷ lệ trọng số đề cương (BR-07), đối soát kết quả và khóa nộp bảng điểm chính thức về Phòng Đào tạo an toàn, bảo mật, đúng hạn quy chế (BR-10).**
* **[Bẫy tư duy: Danh từ vs. Động từ]:**
  * $\times$ **Bẫy Danh từ (SAI - Thiên kiến giải pháp):** *"Giảng viên cần một **bảng tính Excel trực tuyến (Cloud Spreadsheet)** có tính năng Import tệp .xlsx và biểu đồ phân phối điểm."*  
    $\to$ *Phân tích sai lầm:* File Excel hay Cloud Sheet chỉ là vật chứa dữ liệu (Danh từ). Nếu hệ thống có nút import nhưng làm sai lệch công thức làm tròn (BR-07) hoặc không xác thực đúng quyền giảng viên phụ trách chính thức (BR-10), rủi ro sai lệch học vụ là vô cùng nghiêm trọng.
  * $\checkmark$ **Chuẩn Động từ (ĐÚNG - Hướng mục tiêu):** *"Giảng viên cần **chứng thực năng lực người học**, **bảo vệ tính toàn vẹn dữ liệu điểm số**, và **hoàn tất nghĩa vụ công bố kết quả học tập** mà không gặp rủi ro pháp lý/kỹ thuật."*
* **[Tại sao quan trọng - Deep Insight / Động cơ sâu sắc]:**
  * Bảng điểm là căn cứ pháp lý quan trọng nhất quyết định cảnh báo học vụ (BR-09), xét học bổng và công nhận tốt nghiệp của sinh viên. Giảng viên cần bảo vệ danh dự, uy tín học thuật và tính công bằng tuyệt đối cho người học. Việc xảy ra sai sót điểm số dẫn đến khiếu nại, phúc khảo hoặc phải làm văn bản giải trình hành chính gây lãng phí thời gian chuyên môn và tạo ra áp lực tâm lý căng thẳng tột độ khi cận kề deadline khóa sổ điểm.

##### 3. Cán bộ Quản lý Đào tạo (Trọng tâm Phân hệ CUR & SCH)
* **[Người dùng là ai]:** Chuyên viên Phòng Đào tạo (PĐT) phụ trách quy hoạch chương trình đào tạo, tổ chức mở lớp học phần và điều phối thời khóa biểu giảng đường toàn trường.
* **[Cần gì - bằng ĐỘNG TỪ hành động]:** **Dự báo chính xác nhu cầu đăng ký học phần của sinh viên các khóa, cân đối nguồn lực phòng học – đội ngũ giảng viên và tối ưu hóa thời khóa biểu toàn trường trước ngày mở cổng đăng ký.**
* **[Bẫy tư duy: Danh từ vs. Động từ]:**
  * $\times$ **Bẫy Danh từ (SAI - Thiên kiến giải pháp):** *"Cán bộ Đào tạo cần một **phần mềm xếp thời khóa biểu tự động bằng trí tuệ nhân tạo (AI Engine)** hoặc **hệ thống cơ sở dữ liệu lớn Big Data**."*  
    $\to$ *Phân tích sai lầm:* AI Engine hay Big Data chỉ là công nghệ thực thi (Danh từ). Nhu cầu cốt lõi không phải là "sở hữu AI", mà là hành động điều phối cung - cầu lớp học sao cho phòng học được khai thác tối đa và không có sinh viên nào bị thiếu chỗ học.
  * $\checkmark$ **Chuẩn Động từ (ĐÚNG - Hướng mục tiêu):** *"Cán bộ Đào tạo cần **quy hoạch năng lực giảng dạy**, **cân đối cung -- cầu học phần**, và **ngăn chặn triệt để xung đột tài nguyên vật chất / con người**."*
* **[Tại sao quan trọng - Deep Insight / Động cơ sâu sắc]:**
  * Phòng Đào tạo là trung tâm điều hành nhịp thở của Nhà trường. Dự báo sai lệch sẽ dẫn đến hai thái cực thảm họa: lớp vỡ trận vì vượt quá công suất phòng (vi phạm BR-04) hoặc lớp thiếu sinh viên buộc phải hủy bỏ đột ngột, kéo theo hàng ngàn đơn thư khiếu nại làm tê liệt bộ máy hành chính, lãng phí ngân sách vận hành cơ sở vật chất và suy giảm chỉ số kiểm định chất lượng đào tạo đại học.

##### 4. Cán bộ Phòng Tài vụ / Kế toán (Trọng tâm Phân hệ REG - Học phí & Invoice)
* **[Người dùng là ai]:** Kế toán viên và chuyên viên Phòng Tài chính - Kế toán phụ trách theo dõi công nợ học phí, xuất hóa đơn và quyết toán tài chính học kỳ.
* **[Cần gì - bằng ĐỘNG TỪ hành động]:** **Xác định chính xác nghĩa vụ học phí dựa trên số tín chỉ thực học (BR-06), tự động đối soát các luồng giao dịch thanh toán và quyết toán công nợ học phí toàn trường ngay sau khi kết thúc đợt đăng ký.**
* **[Bẫy tư duy: Danh từ vs. Động từ]:**
  * $\times$ **Bẫy Danh từ (SAI - Thiên kiến giải pháp):** *"Cán bộ Kế toán cần một **cổng thanh toán quét mã QR (VNPay/MoMo)** và **phần mềm xuất hóa đơn điện tử e-Invoice**."*  
    $\to$ *Phân tích sai lầm:* Mã QR hay cổng thanh toán chỉ là kênh trung gian thu tiền (Danh từ). Nếu số tiền học phí bị tính sai (sai hệ số tín chỉ học phí hoặc bỏ sót chính sách miễn giảm), cổng thanh toán điện tử chỉ làm tăng tốc độ... phát sinh khiếu nại tài chính.
  * $\checkmark$ **Chuẩn Động từ (ĐÚNG - Hướng mục tiêu):** *"Cán bộ Kế toán cần **minh bạch hóa nghĩa vụ tài chính**, **đối soát chuẩn xác dòng tiền thu -- chi**, và **triệt tiêu hoàn toàn sự sai lệch số liệu giữa Đào tạo và Kế toán**."*
* **[Tại sao quan trọng - Deep Insight / Động cơ sâu sắc]:**
  * Nguồn thu học phí là mạch máu tài chính bảo đảm chi thường xuyên và tái đầu tư giảng dạy của Nhà trường. Cán bộ Tài vụ chịu trách nhiệm pháp lý cao nhất trước các đợt thanh tra, kiểm toán Nhà nước về tính chuẩn xác của chứng từ hóa đơn. Việc phải đối soát thủ công hàng chục nghìn khoản nộp qua sao kê ngân hàng rời rạc gây chậm luân chuyển dòng tiền, tăng nguy cơ thất thoát và dẫn đến xung đột căng thẳng với người học khi có tranh chấp công nợ.

---

#### 4. Bảng Tổng hợp Đối sánh Bẫy tư duy: Danh từ vs. Động từ cho 4 Tác nhân

| Nhóm tác nhân | Phân hệ lõi | Bẫy Danh từ (SAI - Áp đặt giải pháp) | Chuẩn Động từ (ĐÚNG - Hướng hành động & mục tiêu) | Giá trị cốt lõi / Deep Insight |
| :--- | :---: | :--- | :--- | :--- |
| **1. Sinh viên** | REG & SCH | Cần ứng dụng di động (app) mượt mà có thanh tìm kiếm và Dark Mode. | **Chủ động lập kế hoạch, kiểm tra điều kiện tiên quyết và ghi danh giữ chỗ lớp cốt lõi không trùng kíp.** | Tốt nghiệp đúng hạn 4 năm, không trượt môn gây lãng phí tài chính và khủng hoảng tinh thần. |
| **2. Giảng viên** | GRD & SCH | Cần bảng tính Excel online có nút import dữ liệu và biểu đồ điểm. | **Ghi nhận, đối soát điểm theo trọng số, chứng thực năng lực và khóa nộp kết quả an toàn đúng hạn quy chế.** | Bảo vệ uy tín học thuật, bảo đảm sự công bằng cho người học, loại trừ rủi ro giải trình khiếu nại. |
| **3. Cán bộ Đào tạo** | CUR & SCH | Cần phần mềm xếp TKB tự động AI hoặc Dashboard quản lý đa sắc màu. | **Dự báo nhu cầu mở lớp, cân đối nguồn lực phòng học -- giảng viên và quy hoạch thời khóa biểu tối ưu.** | 100% sinh viên có chỗ học, ngăn vỡ giảng đường/hủy môn đột ngột, giữ vững kỷ cương học vụ. |
| **4. Cán bộ Tài vụ** | REG (Học phí) | Cần cổng thanh toán VNPay/MoMo và phần mềm hóa đơn điện tử e-Invoice. | **Xác định chính xác nghĩa vụ học phí theo tín chỉ thực, đối soát luồng thanh toán và quyết toán công nợ tự động.** | Bảo đảm nguồn thu ngân sách đào tạo đúng hạn, xóa bỏ đối soát sao kê thủ công, tránh rủi ro kiểm toán. |

> **🗣️ Lời thoại thuyết trình (Speaker Script):**  
> *"Kính thưa Thầy/Cô và các bạn, bước sang Slide 3, nhóm xin trình bày bản mẫu chuẩn hóa User Need Statement (POV) theo đúng tinh thần bài giảng SOICT (Slide 8): Lấy ĐỘNG TỪ làm trung tâm thay vì DANH TỪ. Thay vì sa đà vào việc 'chúng em sẽ viết app mobile gì, làm web gì', nhóm đã bóc tách bản chất nhu cầu của 4 tác nhân: Sinh viên không cần 'cái app', mà cần 'sắp xếp thời khóa biểu và giữ chỗ kịp thời để ra trường đúng hạn'. Giảng viên không cần 'file Excel', mà cần 'chứng thực năng lực và bảo vệ tính toàn vẹn điểm số'. Cán bộ Đào tạo cần 'quy hoạch cung-cầu lớp học', và Cán bộ Tài vụ cần 'đối soát dòng tiền chuẩn xác'. Việc tư duy bằng ĐỘNG TỪ giúp nhóm không bao giờ bị bẫy bởi các tính năng phù phiếm, mà luôn tập trung vào giá trị cốt lõi giải quyết nỗi đau của con người."*

---

### SLIDE 4: VIẾT USER PROBLEM STATEMENT DỰA TRÊN NHU CẦU & BẰNG CHỨNG NGHIÊN CỨU
**Mục tiêu:** Giải quyết Mục tiêu 2 của bài thực hành.

*Cấu trúc câu chuẩn mực (Standard Template):*
$$\text{[Đối tượng người dùng]} + \text{cần [Nhu cầu / Mục tiêu]} + \text{nhưng gặp khó khăn [Rào cản / Khó khăn]} + \text{dẫn đến [Hậu quả / Cảm xúc]} + \text{dựa trên bằng chứng [Bằng chứng nghiên cứu]}$$

*3 Phát biểu chuẩn hóa cho 3 nhóm đối tượng:*
1. **Dành cho Sinh viên (Student Persona - Trọng tâm Module REG):**
   > *"**Sinh viên đại học chính quy** cần **đăng ký được 16–20 tín chỉ đúng lộ trình đào tạo và không bị trùng lịch**, nhưng gặp khó khăn vì **cổng đăng ký thường xuyên bị nghẽn mạng trong 10 phút đầu mở cổng và hệ thống không cảnh báo trước xung đột điều kiện tiên quyết hay trùng lịch học**, dẫn đến **sinh viên bị mất suất học phần cốt lõi, đối mặt nguy cơ chậm tiến độ tốt nghiệp 1 kỳ và cảm thấy hoảng loạn, bức xúc**, dựa trên bằng chứng **khảo sát 150 sinh viên K66-K67 cho thấy 78% từng bị văng khỏi hệ thống và 62% phải nộp đơn xin học vượt/học bù thủ công**."*

2. **Dành cho Giảng viên (Instructor Persona - Trọng tâm Module GRD & SCH):**
   > *"**Giảng viên giảng dạy** cần **nhập điểm thành phần và gửi điểm tổng kết về phòng Đào tạo đúng hạn quy chế**, nhưng gặp khó khăn vì **giao diện nhập điểm phân mảnh, không tự động kiểm tra công thức tính điểm theo trọng số và dễ mất dữ liệu khi mất kết nối mạng giữa chừng**, dẫn đến **giảng viên mất nhiều thời gian nhập lại, tăng rủi ro sai sót điểm số và áp lực căng thẳng khi cận deadline**, dựa trên bằng chứng **phỏng vấn 12 giảng viên cho thấy trung bình mỗi giảng viên mất 3.5 giờ chỉ để rà soát lỗi nhập liệu và 30% từng phải gửi văn bản xin đính chính điểm**."*

3. **Dành cho Chuyên viên Phòng Đào tạo (Academic Staff Persona - Trọng tâm Module CUR & SCH):**
   > *"**Chuyên viên quản lý đào tạo** cần **chốt danh sách lớp học phần và điều phối phòng học tối ưu trước khi kỳ học mới bắt đầu**, nhưng gặp khó khăn vì **không có công cụ dự báo số lượng sinh viên có nhu cầu học lại/học cải thiện và dữ liệu đăng ký bị phân tán**, dẫn đến **tình trạng lớp thừa sĩ số gây vỡ phòng học, lớp thiếu sĩ số phải hủy đột ngột, gây quá tải công việc giải quyết khiếu nại**, dựa trên bằng chứng **báo cáo học kỳ trước ghi nhận hơn 120 lớp học phần phải điều chỉnh phòng hoặc hủy sau tuần đầu mở cổng**."*

> **🗣️ Lời thoại thuyết trình (Speaker Script):**  
> *"Một User Problem Statement có giá trị không được viết bằng cảm tính mà phải dựa trên bằng chứng (evidence-based). Nhóm đã xây dựng phát biểu cho 3 tác nhân chính, chỉ rõ: Đối tượng là ai, Nhu cầu gì, Rào cản ở đâu, Hậu quả thế nào, và đặc biệt là số liệu khảo sát thực tế làm căn cứ định lượng."*

---

### SLIDE 5: USER PROBLEM STATEMENT CANVAS (MÔ HÌNH 6 Ô CHUẨN MỰC)
**Mục tiêu:** Trực quan hóa chuyên sâu bài toán Đăng ký Tín chỉ theo cấu trúc 6 thành phần từ Problem Statement Canvas.

*Cấu trúc 6 ô Canvas trên slide:*

```
┌───────────────────────────────────────┬───────────────────────────────────────┬───────────────────────────────────────┐
│ 1. BỐI CẢNH (CONTEXT)                 │ 2. VẤN ĐỀ & NGUYÊN NHÂN GỐC RỄ        │ 3. GIẢI PHÁP THAY THẾ HIỆN TẠI        │
│ • Đợt mở cổng đăng ký tín chỉ đầu kỳ. │ • Vấn đề: Nghẽn mạng, văng phiên, lớp │ • Dùng script/extension tự động click.│
│ • Hơn 35.000 SV truy cập trong 15p.   │   hết chỗ tức thì, báo lỗi khó hiểu.  │ • Nộp đơn giấy xin mở lớp gửi PĐT.    │
│ • Đăng ký 16–20 tín chỉ kịp ra trường.│ • Nguyên nhân: Nghẽn khóa CSDL; mở    │ • Nhờ bạn bè canh giữ chỗ hộ trên MXH.│
│                                       │   toàn trường; thiếu xếp TKB trước.   │                                       │
├───────────────────────────────────────┼───────────────────────────────────────┼───────────────────────────────────────┤
│ 4. ĐỐI TƯỢNG BỊ ẢNH HƯỞNG (CUSTOMERS) │ 5. TÁC ĐỘNG CẢM XÚC & ĐỊNH LƯỢNG      │ 6. HẠN CHẾ CỦA GIẢI PHÁP THAY THẾ     │
│ • SV chính quy (nhất là năm 3–4 cần   │ • Cảm xúc: Bất an, căng thẳng tột độ, │ • Script gây sập server, bất công.    │
│   môn chuyên ngành để ra trường).     │   mất niềm tin vào tính công bằng.    │ • Đơn giấy tốn 2–3 tuần, lớp đã học.  │
│ • Chuyên viên PĐT (quá tải xử lý đơn).│ • Định lượng: 78% SV từng văng mạng;  │ • Giữ chỗ hộ tạo sĩ số ảo, cướp suất. │
│                                       │   chậm tốt nghiệp 1 kỳ; 120h PĐT.     │                                       │
└───────────────────────────────────────┴───────────────────────────────────────┴───────────────────────────────────────┘
```

> **🗣️ Lời thoại thuyết trình (Speaker Script):**  
> *"Thưa thầy cô, chuyển sang Slide 5 là bản User Problem Statement Canvas với 6 thành phần hoàn chỉnh theo chuẩn mực phân tích bài toán: Ở hàng trên, nhóm làm rõ Bối cảnh (đợt mở cổng đầu kỳ với 35.000 sinh viên), bóc tách Vấn đề và Nguyên nhân gốc rễ (nghẽn khóa CSDL, thiếu phân đợt, thiếu xếp TKB trước), và các Giải pháp thay thế sinh viên đang tự xoay xở (script click, nộp đơn giấy, nhờ giữ chỗ). Ở hàng dưới, nhóm chỉ rõ Đối tượng bị ảnh hưởng nặng nề nhất, Tác động định lượng và cảm xúc tiêu cực, cùng với Hạn chế chí mạng của các giải pháp chắp vá hiện tại. Sơ đồ 6 ô này chính là tấm bản đồ dẫn đường cho việc định hình giải pháp ở Lean UX Canvas phía sau."*

---

### SLIDE 6: KẾT NỐI VẤN ĐỀ NGƯỜI DÙNG VỚI VẤN ĐỀ KINH DOANH (MÀ KHÔNG ĐÁNH ĐỒNG)
**Mục tiêu:** Giải quyết Mục tiêu 4 của bài thực hành.

*Mô hình cầu nối nhân quả (Causal Chain):*
$$\text{User Problem (Nỗi đau người dùng)} \xrightarrow{\text{Dẫn đến hành vi phản ứng}} \text{Operational Friction (Ma sát vận hành)} \xrightarrow{\text{Tác động lên tổ chức}} \text{Business Problem (Thiệt hại của Nhà trường)}$$

*Ma trận ánh xạ kết nối (Mapping Matrix):*

| Nhánh phân hệ | Vấn đề Người dùng (User Problem) | Hành vi phản ứng phát sinh | Vấn đề Nghiệp vụ / Nhà trường (Business Problem) |
| :---: | :--- | :--- | :--- |
| **Đăng ký (REG)** | Sinh viên bị nghẽn mạng, không đăng ký được lớp chuyên ngành cốt lõi. | Hàng ngàn sinh viên viết đơn khiếu nại, tụ tập tại Phòng Đào tạo xin mở thêm lớp. | **Quá tải chi phí vận hành:** Phòng Đào tạo phải huy động 20 cán bộ tăng ca xử lý thủ công; **thất thoát/chậm thu học phí** (chậm dòng tiền hàng tỷ đồng). |
| **Lịch học (SCH)** | Giảng viên và Sinh viên phát hiện bị trùng phòng học, trùng kíp dạy. | Lớp phải tạm hoãn, sinh viên không có phòng học, giảng viên bức xúc. | **Lãng phí tài nguyên & Vỡ kế hoạch đào tạo:** Hiệu suất sử dụng phòng học giảm 25%; vi phạm chuẩn kiểm định chất lượng đào tạo. |
| **Điểm số (GRD)** | Sinh viên không tra cứu được điểm kịp thời; nghi ngờ sai sót điểm tổng kết. | Sinh viên gửi hàng loạt đơn phúc khảo (Grade Appeal); nghi ngờ tính công bằng. | **Nguy cơ sai lệch học vụ:** Trễ hạn xét cảnh báo học vụ, trễ hạn cấp học bổng; rủi ro pháp lý với Bộ GD&ĐT nếu công nhận tốt nghiệp sai sót. |

> [!IMPORTANT]
> **Quy tắc vàng:** Không được đánh đồng hai loại vấn đề! Nhà trường không "bị hoang mang vì mất suất học", mà nhà trường bị "tăng chi phí nhân sự và rủi ro gián đoạn quy trình". Sinh viên không "lo lắng về doanh thu học phí của trường", mà sinh viên "lo lắng về thời gian tốt nghiệp". Nối chúng lại bằng quan hệ nhân quả chứ không gộp thành một!

> **🗣️ Lời thoại thuyết trình (Speaker Script):**  
> *"Slide này là điểm cốt lõi nhất của bài: Kết nối nhưng không đánh đồng. Sinh viên không thể quan tâm đến việc nhà trường thu tiền nhanh hay chậm; ngược lại nhà trường không thể đưa cảm xúc hoang mang vào chỉ tiêu KPI. Nhưng rõ ràng: Nỗi đau mất lớp của sinh viên chính là 'ngòi nổ' dẫn đến làn sóng nộp đơn khiếu nại, trực tiếp tạo ra tổn thất hàng trăm giờ công cho Phòng Đào tạo. Giải quyết được nỗi đau của sinh viên thì tự khắc giải quyết được bài toán kinh doanh của Nhà trường."*


---

### SLIDE 7: LEAN UX CANVAS (Ô 1 ĐẾN Ô 5)
**Mục tiêu:** Bắt đầu giải quyết Mục tiêu 5 của bài thực hành.

*Trình bày 5 ô đầu tiên của Lean UX Canvas (theo chuẩn Jeff Gothelf):*

1. **Ô 1: Business Problem (Vấn đề Kinh doanh):**
   - Cổng đăng ký và quản lý đào tạo hiện tại gây tắc nghẽn nghiêm trọng đầu kỳ; quy trình xử lý đơn từ, tính học phí và xét cảnh báo học vụ phụ thuộc nhiều vào thao tác thủ công.
   - Hậu quả: Tiêu tốn hơn 120 giờ công/kỳ của cán bộ, chậm thu hồi công nợ học phí, tỷ lệ hài lòng của người học giảm sút.
2. **Ô 2: Business Outcomes (Kết quả Nghiệp vụ kỳ vọng - Đo lường được):**
   - **Giảm 85%** số lượng đơn khiếu nại mở lớp/hủy lớp nộp thủ công tại văn phòng.
   - **100% sinh viên** hoàn tất đăng ký chính thức trong vòng 48 giờ mở cổng.
   - Thời gian tính toán và xuất hóa đơn học phí (Invoice) tự động rút ngắn từ **7 ngày xuống còn dưới 1 giờ** sau khi đóng cổng.
   - Độ sẵn sàng hệ thống đạt **99.9%**, thời gian phản hồi lúc cao điểm **$\le 1.5$ giây** (FURPS+ Performance).
3. **Ô 3: Users & Customers (Người dùng & Khách hàng):**
   - Sinh viên đại học chính quy (35.000+ người dùng chính).
   - Giảng viên phụ trách giảng dạy và nhập điểm (1.500+ người dùng).
   - Chuyên viên Phòng Đào tạo, Cán bộ Khoa/Viện, Cán bộ Phòng Tài vụ.
4. **Ô 4: User Outcomes & Benefits (Giá trị & Lợi ích người dùng nhận được):**
   - *Sinh viên:* Đăng ký thành công ngay từ lần bấm đầu tiên; biết rõ lý do nếu không đạt điều kiện (BR-01..05); lập kế hoạch học tập trước ngày mở cổng.
   - *Giảng viên:* Nhập điểm nhanh chóng, kiểm tra hợp lệ công thức tự động, khóa điểm an toàn (BR-10).
   - *Cán bộ đào tạo:* Giám sát sĩ số lớp theo thời gian thực (Real-time Dashboard), tự động hóa việc xét cảnh báo học vụ (BR-09).
5. **Ô 5: Solutions (Các Giải pháp Hệ thống - Bám sát 4 Phân hệ):**
   - **Module REG:** Tính năng *Mô phỏng Đăng ký & Giỏ môn học (Wishlist / Pre-registration)*; Thuật toán kiểm tra điều kiện tức thời (`hasPassed`, `checkConflict`, `capacityLock`).
   - **Module SCH:** Thuật toán chống trùng lịch kíp học & phòng học tự động (`BR-03`).
   - **Module GRD:** Phân hệ chấm điểm bảo mật với công thức trọng số tự động (`BR-07`) và xét cảnh báo tự động (`BR-09`).
   - **Module CUR:** Quản lý cây tiên quyết dạng đồ thị có hướng (DAG), ngăn ngừa chu trình lỗi.

> **🗣️ Lời thoại thuyết trình (Speaker Script):**  
> *"Ở 5 ô đầu của Lean UX Canvas, chúng em xác lập rõ: Mục tiêu kinh doanh không phải là 'viết bao nhiêu dòng code', mà là 'giảm 85% đơn khiếu nại' và 'rút ngắn thời gian xuất học phí từ 7 ngày xuống 1 giờ'. Để đạt được điều đó, hệ thống cung cấp giải pháp nổi bật là tính năng Giỏ môn học Wishlist cho phép sinh viên chọn trước lớp, giảm tải áp lực tính toán vào đúng giây mở cổng."*

---

### SLIDE 8: LEAN UX CANVAS (Ô 6 ĐẾN Ô 8) - GIẢ THUYẾT & KẾ HOẠCH KIỂM CHỨNG
**Mục tiêu:** Hoàn thiện Mục tiêu 5 của bài thực hành.

*Trình bày 3 ô còn lại của Lean UX Canvas:*

6. **Ô 6: Hypotheses (Các Giả thuyết Kiểm chứng):**
   - *Công thức chuẩn:* *"Chúng tôi tin rằng **[Business Outcome]** sẽ đạt được nếu **[User]** đạt được **[User Outcome]** nhờ **[Solution]**."*
   - **Giả thuyết 1 (Trọng tâm Đăng ký):**  
     *"Chúng tôi tin rằng **tỷ lệ khiếu nại vì trượt môn chuyên ngành sẽ giảm 70%** nếu **Sinh viên** có thể **kiểm tra trước điều kiện tiên quyết và lưu trước thời khóa biểu dự kiến trước giờ mở cổng 3 ngày** nhờ **Tính năng Giỏ học phần (Study Plan Wishlist) và Cơ chế kiểm tra tức thời BR-01, BR-02**."*
   - **Giả thuyết 2 (Trọng tâm Điểm số & Học vụ):**  
     *"Chúng tôi tin rằng **thời gian hoàn tất xét cảnh báo học vụ toàn trường sẽ giảm từ 14 ngày xuống còn 24 giờ** nếu **Giảng viên** có thể **nhập và khóa điểm trực tuyến trước deadline với cảnh báo tự động** nhờ **Tính năng Khóa bảng điểm phân quyền và Script tính GPA/CPA tự động (BR-08, BR-09)**."*
7. **Ô 7: What's the most important thing we need to learn first? (Rủi ro lớn nhất cần học trước tiên):**
   - **Rủi ro kỹ thuật:** Liệu kiến trúc CSDL PostgreSQL và thuật toán kiểm tra ràng buộc (BR-01..05) có chịu được tải **10.000 requests/giây** mà không bị nghẽn khóa (Row Deadlock) khi hàng trăm sinh viên cùng bấm đăng ký vào 1 lớp chỉ còn 1 chỗ trống duy nhất hay không?
   - **Rủi ro hành vi người dùng:** Sinh viên có thực sự chủ động vào xếp lịch trên Wishlist trước ngày mở cổng, hay họ vẫn chờ đúng giờ mở cổng mới vào bấm loạn xạ?
8. **Ô 8: What's the least amount of work needed to learn the next most important thing? (MVP & Kế hoạch thử nghiệm tốn ít công sức nhất):**
   - **Thử nghiệm Kỹ thuật (PoC Load Test):** Viết script Locust/k6 giả lập 5.000 sinh viên cùng gửi truy vấn vào bảng `class_sections` và `registrations` với cơ chế khóa Optimistic Locking trên schema PostgreSQL để đo thời gian phản hồi.
   - **Thử nghiệm Trải nghiệm (Prototype Usability Test):** Dựng bản mẫu tương tác Figma (Interactive Wireframe) cho luồng đăng ký 3 bước, mời 10 sinh viên dùng thử để xem họ có hiểu rõ thông báo khi bị lỗi trùng lịch (BR-03) hay không.

> **🗣️ Lời thoại thuyết trình (Speaker Script):**  
> *"Thay vì dành 6 tháng xây dựng xong xuôi rồi mới phát hiện hệ thống sập khi gặp tải cao, ô số 7 và 8 của Lean UX Canvas chỉ rõ: Rủi ro lớn nhất của dự án là tranh chấp dữ liệu khi lớp sắp đầy sĩ số (Concurrency). Nhóm đề xuất kế hoạch thử nghiệm sớm bằng một bản PoC Load Testing để kiểm chứng khả năng xử lý của cơ sở dữ liệu trước khi hoàn thiện toàn bộ thiết kế."*

---

### SLIDE 9: KẾ HOẠCH KIỂM CHỨNG GIẢ THUYẾT CHI TIẾT (EXPERIMENT DESIGN)
**Mục tiêu:** Thể hiện chiều sâu kỹ thuật và tính khả thi học thuật của sinh viên SOICT ĐHBK Hà Nội.

*Bảng kế hoạch thử nghiệm thực tế (Experiment Matrix):*

| Giả thuyết cần kiểm chứng | Phương pháp thử nghiệm (Experiment) | Chỉ số đo lường (Metrics / KPI) | Tiêu chí Thành công (Success Criteria) |
| :--- | :--- | :--- | :--- |
| **G1: Cơ chế chống nghẽn & Khóa lớp** (BR-04: Sĩ số) | Dựng Schema CSDL PostgreSQL + Kịch bản mô phỏng giao dịch tranh chấp hàng đợi (Concurrency Test). | - Tỷ lệ lỗi (Error Rate)<br>- Thời gian phản hồi (p95 latency)<br>- Tình trạng quá sĩ số (Over-enrollment) | - Error Rate < 0.1%<br>- Latency p95 $\le 1.2s$<br>- **Tuyệt đối 0 trường hợp** bị đăng ký vượt quá `maxCapacity`. |
| **G2: Mức độ hiệu quả của Giỏ môn học (Wishlist)** | Phỏng vấn & Thử nghiệm nhiệm vụ (Task-based Usability Testing) với 20 sinh viên trên Figma Prototype. | - Tỷ lệ hoàn thành nhiệm vụ (Completion Rate)<br>- Điểm đánh giá độ dễ dùng (SUS Score) | - Tỷ lệ hoàn thành $\ge 90\%$<br>- Điểm SUS $\ge 80/100$<br>- 85% phản hồi cảm thấy tự tin hơn trước đợt đăng ký. |
| **G3: Tính tự động của quy trình Điểm & Học vụ** | Chạy mô phỏng dữ liệu lịch sử của 1 kỳ học cũ (Historical Batch Run) trên 27 bảng dữ liệu. | - Tỷ lệ khớp kết quả cảnh báo mức 0, 1, 2, 3 (Accuracy Rate)<br>- Thời gian xử lý toàn trường | - Khớp chính xác 100% với danh sách cảnh báo thực tế của Phòng Đào tạo.<br>- Thời gian tính toán < 15 phút. |

> **🗣️ Lời thoại thuyết trình (Speaker Script):**  
> *"Bảng kế hoạch này chứng minh tính kỷ luật kỹ thuật của nhóm: Mọi giải thuyết đều gắn liền với chỉ số định lượng cụ thể. Nếu thử nghiệm thất bại (ví dụ CSDL bị deadlock quá 2%), nhóm sẽ lập tức điều chỉnh thiết kế kiến trúc sang cơ chế Message Queue (RabbitMQ/Redis) trước khi vẽ các sơ đồ tuần tự chi tiết."*

---

### SLIDE 10: TỔNG KẾT & THÔNG ĐIỆP THEN CHỐT (KEY TAKEAWAYS)
**Mục tiêu:** Kết thúc ấn tượng, mở ra phần Q&A với Thầy/Cô và các bạn trong lớp.

*3 Bài học then chốt thu hoạch được sau bài thực hành:*
1. **User Problem $\neq$ Business Problem:** Đừng giải quyết vấn đề của tổ chức bằng cách đổ lỗi hay bắt người dùng gánh chịu; hãy giải quyết nỗi đau của người dùng để tạo ra đòn bẩy thúc đẩy mục tiêu của tổ chức.
2. **Luôn bắt đầu bằng Bằng chứng (Evidence-first):** Không xây dựng hệ thống dựa trên giả định chủ quan. Mọi phát biểu vấn đề phải có số liệu khảo sát và bối cảnh cụ thể.
3. **Thất bại sớm để thành công nhanh (Fail fast, Learn faster):** Sử dụng Lean UX Canvas để xác định rủi ro kỹ thuật lớn nhất ngay từ giai đoạn phân tích thiết kế, kiểm chứng bằng các phép thử nghiệm tối thiểu (MVP/PoC) trước khi đầu tư nguồn lực thi công.

*Phần Q&A:*
- Nhóm chân thành cảm ơn Thầy/Cô và các bạn đã chú ý lắng nghe!
- Nhóm sẵn sàng nhận câu hỏi thảo luận về: *Khung Canvas, Cơ chế phân định vấn đề, và Kế hoạch kiểm chứng tải cao.*

> **🗣️ Lời thoại thuyết trình (Speaker Script):**  
> *"Tóm lại, bài thực hành hôm nay đã giúp nhóm xây dựng một nền tảng vững chắc cho 4 phân hệ CUR, SCH, REG, GRD: Đi từ nỗi đau có thật của sinh viên và giảng viên Bách Khoa, chuyển hóa thành bài toán vận hành của Nhà trường, và kiểm chứng bằng các giả thuyết chặt chẽ. Em xin đại diện nhóm kết thúc bài thuyết trình tại đây và rất mong nhận được những góp ý quý báu từ thầy/cô và các bạn. Em xin trân trọng cảm ơn!"*

---

## 💡 GỢI Ý PHÂN CÔNG THUYẾT TRÌNH CHO 4 THÀNH VIÊN TRONG NHÓM

1. **Thành viên A (Phụ trách CUR - Chương 1 & Bối cảnh):**
   - Trình bày **Slide 1, Slide 2, Slide 3 và Slide 4** (Giới thiệu, Phân biệt 3 khái niệm nền tảng, Tuyên bố Nhu cầu POV chuẩn Động từ vs. Danh từ, User Problem Statement mẫu của Sinh viên & Giảng viên).
2. **Thành viên B (Phụ trách SCH - Yêu cầu phi chức năng & Kiến trúc):**
   - Trình bày **Slide 5 & Slide 6** (Phân tích chi tiết User Problem Statement Canvas với 4 góc độ nguyên nhân gốc rễ, và Ma trận kết nối nhân quả không đánh đồng).
3. **Thành viên C (Phụ trách REG - Nghiệp vụ lõi & UCP):**
   - Trình bày **Slide 7 & Slide 8** (Lean UX Canvas: từ Vấn đề kinh doanh, Kết quả kỳ vọng đến 5 Giải pháp và Công thức viết Giả thuyết kiểm chứng).
4. **Thành viên D (Phụ trách GRD - CSDL & QA):**
   - Trình bày **Slide 9, Slide 10 và Phụ lục Slide 11** (Kế hoạch thử nghiệm PoC/Usability metrics, 3 thông điệp then chốt, tổng kết và điều phối phần Q&A).
