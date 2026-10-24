# PHIẾU BÀI LÀM BÀI TẬP 1 — THÀNH VIÊN 3
## TÁC NHÂN: CÁN BỘ TÀI CHÍNH (CBTC) & HỒ SƠ ĐỀ XUẤT HỆ THỐNG (SYSTEM REQUEST)

> **Thông tin thành viên:**
> - Họ và tên: `[Điền họ và tên]`
> - Mã số sinh viên: `[Điền MSSV]`
> - Tác nhân phụ trách chính: **Cán bộ Tài chính (Phòng Tài chính - Kế toán)**
> - Hạng mục bài tập đảm nhận: **TH1 (User Needs của CBTC) + TH2 (Problem Canvas của CBTC) + Hồ sơ System Request chuẩn 11 mục (Planning Phase)**
> - Tài liệu slide tham chiếu: Slide 7–19, 45–51 trong `docs/OOAD_Lab_B1-5.md`

---

## PHẦN A: THỰC HÀNH 1 — USER NEEDS CỦA CÁN BỘ TÀI CHÍNH (SLIDE 7–15)

### A.1. Bảng xác định Nhu cầu Người dùng (User Needs) của Cán bộ Tài chính
*Lưu ý: Bắt đầu bằng động từ hành động, phản ánh công tác quản lý tài chính - kế toán học phí.*

| Mã | Nhu cầu người dùng (Bắt đầu bằng động từ) | Bối cảnh xảy ra | Rào cản hiện tại | Hệ quả thực tế | Phân loại |
|---|---|---|---|---|---|
| **UN-CBTC-01** | **Tính toán và cập nhật** tổng số tiền học phí phải nộp cho từng sinh viên theo số tín chỉ đăng ký thực tế | Ngay sau khi đợt đăng ký học phần chính thức kết thúc | Đơn giá tín chỉ thay đổi theo chương trình đào tạo (chuẩn, tiên tiến, chất lượng cao) và diện chính sách; phải xuất file dữ liệu từ Đào tạo để tính thủ công trên Excel | Tốn nhiều ngày xử lý; dễ nhầm lẫn đơn giá giữa các hệ đào tạo; phát sinh khiếu nại về tiền học | `[Evidence]` |
| **UN-CBTC-02** | **Đối soát tự động** các giao dịch nộp tiền học phí từ ngân hàng theo thời gian thực | Suốt thời gian mở cổng thanh toán học phí (khoảng 2–3 tuần) | Sinh viên nộp tiền chuyển khoản ghi sai cú pháp nội dung (viết tắt tên, thiếu MSSV); dữ liệu sao kê ngân hàng phải tải về nhập tay | Tốn hàng tuần đối soát thủ công từng dòng sao kê; sinh viên đã nộp tiền nhưng vẫn bị treo nợ | `[Evidence]` |
| **UN-CBTC-03** | **Quản lý và đồng bộ** danh sách sinh viên nợ học phí để khóa/mở quyền đăng ký hoặc dự thi | Trước các đợt đăng ký học phần mới hoặc trước kỳ thi học kỳ | Dữ liệu công nợ không được đồng bộ tức thời sang phân hệ đăng ký học phần của Phòng Đào tạo; phải gửi file Excel danh sách nợ qua email nội bộ | Sinh viên đã nộp tiền vẫn bị khóa quyền đăng ký oan; ngược lại sinh viên còn nợ tiền vẫn lọt vào danh sách thi | `[Evidence]` |
| **UN-CBTC-04** | **Xét duyệt và khấu trừ** các diện miễn giảm học phí, học bổng khuyến khích học tập | Đầu mỗi học kỳ khi có quyết định cấp học bổng hoặc miễn giảm | Dữ liệu đối tượng chính sách và học bổng được quản lý phân tán ở Phòng Công tác Sinh viên | Phải bù trừ tiền thừa/thiếu thủ công; chậm trễ giải ngân tiền học bổng cho sinh viên | `[Assumption]` |
| **UN-CBTC-05** | **Xuất và gửi** hóa đơn điện tử / biên lai thu học phí hợp lệ cho sinh viên và phụ huynh | Sau khi sinh viên hoàn thành nghĩa vụ tài chính | Hệ thống xuất hóa đơn điện tử chưa tích hợp API tự động với hệ thống quản lý học phí | Cán bộ phải xuất lẻ từng hóa đơn hoặc sinh viên phải đến tận phòng tài vụ xin giấy xác nhận | `[Assumption]` |

---

### A.2. Phát biểu Vấn đề của Cán bộ Tài chính (User Problem Statement)
> **Phát biểu vấn đề lựa chọn:**
> 
> "Cán bộ Phòng Tài chính - Kế toán gặp áp lực và rủi ro sai sót rất lớn khi thực hiện tính toán học phí và đối soát sao kê ngân hàng đầu mỗi học kỳ, vì phương thức thanh toán phân tán và việc đối soát cú pháp chuyển khoản hiện vẫn làm thủ công trên file bảng tính, dẫn đến thời gian đối soát công nợ kéo dài từ 5 đến 7 ngày, tỷ lệ cập nhật trạng thái nợ chậm trễ gây khóa nhầm quyền đăng ký của sinh viên và làm tăng khối lượng giải trình khiếu nại tài chính."

---

## PHẦN B: THỰC HÀNH 2 — USER PROBLEM STATEMENT CANVAS CHO CÁN BỘ TÀI CHÍNH (SLIDE 16–21)

| STT | Thành phần Canvas | Phân tích chi tiết đối với Cán bộ Tài chính |
|---|---|---|
| **1** | **Who** (Ai chịu nỗi đau?) | Chuyên viên kế toán thanh toán, cán bộ theo dõi công nợ học phí tại Phòng Tài chính - Kế toán của trường đại học. |
| **2** | **Context** (Xảy ra khi nào, ở đâu?) | Giai đoạn thu học phí đầu kỳ và trước kỳ thi cuối kỳ (khoảng 3–4 tuần cao điểm mỗi học kỳ) tại Văn phòng Kế toán. |
| **3** | **Goal & Root Problem** (Mục tiêu & Bản chất vấn đề) | - **Mục tiêu:** Thu đúng, thu đủ học phí theo quy định; đối soát chính xác 100% giao dịch ngân hàng trong ngày; tự động cập nhật trạng thái hoàn thành học phí để sinh viên yên tâm học tập.<br>- **Bản chất vấn đề:** Thiếu cổng kết nối tự động (Payment Gateway / Open Banking API) liên thông giữa hệ thống ngân hàng và cơ sở dữ liệu đào tạo. |
| **4** | **Current Alternatives** (Cách đang tự giải quyết) | - Tải sao kê tài khoản ngân hàng dạng Excel về máy vào cuối mỗi ngày.<br>- Dùng hàm `VLOOKUP` trên Excel để dò tìm MSSV trong chuỗi nội dung chuyển khoản.<br>- Với các giao dịch sai cú pháp, phải đăng thông báo tìm chủ nhân khoản tiền hoặc chờ sinh viên mang giấy nộp tiền đến đối chất. |
| **5** | **Alternative Shortcomings** (Nhược điểm của cách hiện tại) | - Cực kỳ mất thời gian và dễ nhầm lẫn khi có hàng chục nghìn giao dịch đổ về đồng thời.<br>- Không xử lý được các trường hợp sinh viên nhờ người thân nộp hộ với tên người chuyển khác hoàn toàn.<br>- Dữ liệu cập nhật gạch nợ bị trễ từ 24h đến 72h. |
| **6** | **Emotional Impact** (Tác động cảm xúc) | - Áp lực căng thẳng vì liên quan trực tiếp đến số liệu tiền bạc và kiểm toán tài chính.<br>- Mệt mỏi khi phải liên tục giải thích và giải quyết khiếu nại bức xúc của sinh viên bị khóa môn oan. |
| **7** | **Quantifiable Impact** (Tác động định lượng - Kèm đơn vị) | - **Thời gian đối soát:** Mất từ 5 đến 7 ngày làm việc toàn thời gian của 4 cán bộ kế toán.<br>- **Tỷ lệ sai lệch cú pháp:** Khoảng 8–12% tổng số giao dịch chuyển khoản bị lỗi cú pháp cần xử lý thủ công.<br>- **Thời gian sinh viên chờ gạch nợ:** Trung bình 24–48 giờ sau khi đã chuyển tiền thành công. |
| **8** | **Evidence vs. Assumptions** (Bằng chứng và Giả định) | - `[Evidence]`: Quy định về việc đóng học phí đúng hạn để đủ điều kiện thi được nêu rõ trong Sổ tay sinh viên; các bài đăng phản ánh việc đã chuyển tiền nhưng tài khoản vẫn báo nợ xuất hiện mỗi kỳ.<br>- `[Assumption]`: Giả định rằng nếu áp dụng mã thanh toán định danh động (VietQR chuyên dụng có gắn sẵn mã hóa đơn), 99% lỗi sai cú pháp sẽ được loại bỏ hoàn toàn. |

---

## PHẦN C: HỒ SƠ ĐỀ XUẤT HỆ THỐNG — SYSTEM REQUEST (PLANNING PHASE) (SLIDE 45–51)

Văn bản chính thức khởi động dự án theo chuẩn 11 mục hướng dẫn của HUST:

```
========================================================================================
                      CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM
                         Độc lập - Tự do - Hạnh phúc
                                   -----***-----
                 VĂN BẢN ĐỀ XUẤT HỆ THỐNG (SYSTEM REQUEST)
                      Giai đoạn: Khởi tạo & Lập kế hoạch
========================================================================================
```

### 1. Project Title (Tên Dự án)
* **Tên tiếng Việt:** Hệ thống Quản trị Đào tạo Đại học và Thanh toán Học phí Trực tuyến Tích hợp.
* **Tên tiếng Anh:** Next-Generation University Student Information and Smart Tuition System (**HUST SIS-Pay**).
* **Mã dự án:** `PRJ-IT3120-SIS`.

---

### 2. Project Sponsor / Requestor (Đơn vị Đề xuất & Tài trợ)
* **Đơn vị phê duyệt & tài trợ:** Ban Giám hiệu Đại học Bách Khoa Hà Nội.
* **Đơn vị chủ trì nghiệp vụ (Co-Sponsors):**
  - Phòng Đào tạo (Chịu trách nhiệm về Quy chế & Quản lý Học vụ).
  - Phòng Tài chính - Kế toán (Chịu trách nhiệm về Quản lý Tài chính & Đối soát Học phí).
* **Đơn vị phối hợp kỹ thuật:** Ban Công nghệ Thông tin & Chuyển đổi số.

---

### 3. Business Need / Problem Statement (Nhu cầu Nghiệp vụ)
Hệ thống quản lý đào tạo và đối soát học phí hiện tại của Nhà trường được xây dựng từ nhiều năm trước trên kiến trúc rời rạc, không còn đáp ứng được quy mô đào tạo trên 35.000 sinh viên. Mỗi kỳ học, quy trình kiểm tra điều kiện tiên quyết và tính toán học phí thủ công gây ra tình trạng nghẽn mạng nghiêm trọng, kéo dài thời gian đối soát ngân hàng từ 5–7 ngày, và phát sinh hàng nghìn đơn khiếu nại học vụ. 

Để hiện thực hóa chiến lược Đại học Số, Nhà trường cấp thiết cần một hệ thống quản lý đào tạo hợp nhất có khả năng tự động hóa kiểm tra ràng buộc quy chế, xếp lịch chống trùng, và tích hợp thanh toán tức thời qua ngân hàng số.

---

### 4. Project Vision / Goals (Tầm nhìn & Mục tiêu Dự án)
* **Tầm nhìn:** Xây dựng một nền tảng quản trị học tập số thông minh, minh bạch, lấy người học làm trung tâm, kết nối liên thông dữ liệu Đào tạo - Tài chính - Giảng viên.
* **Mục tiêu định lượng (SMART Goals):**
  1. Tự động hóa **100%** việc kiểm tra điều kiện tiên quyết và kiểm tra trùng lịch học phần khi sinh viên thao tác.
  2. Rút ngắn thời gian hoàn tất đăng ký học phần của sinh viên từ **4 giờ** xuống dưới **5 phút**.
  3. Tự động hóa **95%** khâu đối soát học phí và gạch nợ tức thời qua cổng thanh toán liên ngân hàng trong vòng **dưới 5 giây** sau khi giao dịch thành công.
  4. Giảm **80%** số lượng đơn thư khiếu nại học vụ và công nợ gửi về các phòng ban chức năng.

---

### 5. Business Benefits (Phân tích Lợi ích Kinh doanh Đa Chiều)

| Nhóm lợi ích | Chỉ số hiện tại (Current State) | Mục tiêu đạt được (Desired State) | Giá trị mang lại |
|---|---|---|---|
| **Lợi ích Vận hành** | - Mất 5–7 ngày đối soát sao kê thủ công.<br>- Mất 15–20 phút/đơn xử lý ngoại lệ.<br>- Gạch nợ trễ 24–48h. | - Đối soát tự động trong $\le 5\text{ giây}$.<br>- 90% đơn duyệt tự động qua cổng số.<br>- Gạch nợ tức thời (real-time). | Tiết kiệm hơn **2.000 giờ làm việc** của cán bộ hành chính mỗi năm học; xóa bỏ tình trạng sinh viên xếp hàng. |
| **Lợi ích Kinh tế / Tài chính** | - Tỷ lệ nợ đọng học phí kéo dài chiếm ~5% tổng thu.<br>- Chi phí in ấn biểu mẫu, sao kê ~150 triệu VNĐ/năm.<br>- Chi phí làm thêm giờ mùa cao điểm ~200 triệu VNĐ/kỳ. | - Thu hồi 99% học phí đúng hạn trước kỳ thi.<br>- Cắt giảm 90% chi phí giấy tờ (100% hóa đơn điện tử).<br>- Giảm 75% chi phí làm thêm giờ của nhân sự. | Thu hồi dòng tiền học phí nhanh chóng; tiết kiệm trực tiếp ước tính **500–700 triệu VNĐ/năm** chi phí vận hành. |
| **Lợi ích Chiến lược** | - Dữ liệu phân tán, báo cáo chậm trễ.<br>- Chỉ số hài lòng sinh viên (NPS) về dịch vụ đào tạo thấp (~50%). | - Dữ liệu tập trung, phân tích theo thời gian thực.<br>- Nâng chỉ số hài lòng của người học lên trên 85%. | Nâng cao vị thế trường đại học công nghệ tiên phong chuyển đổi số; hỗ trợ Ban Giám hiệu ra quyết định dựa trên dữ liệu. |

---

### 6. High-level Requirements (Yêu cầu Cấp cao)

#### Yêu cầu Chức năng (Functional Requirements)
1. **Quản lý Chương trình & Tiên quyết:** Cho phép cấu hình cây tiên quyết, học phần tương đương và tự động kiểm tra điều kiện khi sinh viên đăng ký.
2. **Đăng ký Học phần Thông minh:** Hỗ trợ sinh viên lọc lớp, hiển thị lưới thời khóa biểu trực quan, phát hiện trùng kíp và ghi nhận lớp tức thời.
3. **Cổng Xử lý Đơn Học vụ Số:** Cho phép sinh viên nộp đơn xin học vượt, xin mở lớp trực tuyến; cán bộ phê duyệt phân cấp trên giao diện web.
4. **Tính Học phí & Quản lý Công nợ:** Tự động tính học phí theo số tín chỉ đăng ký và đơn giá của từng chương trình đào tạo; quản lý trạng thái nợ/dư tiền.
5. **Cổng Thanh toán Tích hợp (Payment Gateway):** Sinh mã VietQR động theo từng hóa đơn; tự động tiếp nhận webhook ngân hàng và gạch nợ tức thời.
6. **Không gian Làm việc Giảng viên:** Cung cấp danh sách lớp tự động cập nhật thời gian thực, quản lý điểm danh và xuất sổ điểm.

#### Yêu cầu Phi chức năng (Non-Functional Requirements)
7. **Hiệu năng & Khả năng chịu tải (Performance/Scalability):** Chịu tải đồng thời tối thiểu **15.000 người dùng trực tuyến** trong giờ cao điểm mở cổng; thời gian phản hồi giao dịch đăng ký $< 1.5\text{ giây}$.
8. **An toàn & Bảo mật (Security):** Xác thực người dùng qua SSO (Single Sign-On); mã hóa dữ liệu giao dịch tài chính theo chuẩn PCI-DSS; sao lưu dữ liệu tự động hàng ngày.

---

### 7. Constraints / Assumptions (Ràng buộc & Giả định)
* **Ngân sách dự kiến:** Ước tính từ 1.2 đến 1.5 tỷ VNĐ cho toàn bộ vòng đời phân tích, phát triển và triển khai thử nghiệm.
* **Thời gian thực hiện:** 6 tháng (từ tháng 11/2026 đến tháng 04/2027), sẵn sàng nghiệm thu trước đợt đăng ký học kỳ hè.
* **Giả định hạ tầng:** Nhà trường đã có hạ tầng máy chủ nội bộ hoặc Cloud đủ mạnh; các ngân hàng liên kết cung cấp API webhook đạt chuẩn.
* **Ràng buộc quy chế:** Mọi quy tắc đăng ký phải tuân thủ nghiêm ngặt Quy chế Đào tạo đại học hiện hành của Bộ GD&ĐT và ĐHBK Hà Nội.

---

### 8. Feasibility Assessment (Đánh Giá Tính Khả Thi 4 Chiều)

| Chiều khả thi | Kết quả đánh giá | Phân tích chi tiết |
|---|:---:|---|
| **Technical Feasibility** *(Tính khả thi Kỹ thuật)* | **CAO (Cao)** | Công nghệ web hiện đại (Microservices/RESTful API, cơ sở dữ liệu quan hệ PostgreSQL kết hợp Redis Caching) hoàn toàn đủ năng lực xử lý tải 15.000 người dùng; các ngân hàng lớn (Vietcombank, BIDV) đều có sẵn cổng kết nối VietQR công khai. |
| **Economic Feasibility** *(Tính khả thi Kinh tế)* | **CAO (Cao)** | Phân tích Cost-Benefit cho thấy: Dự án thu hồi vốn (Payback period) trong khoảng **1.8 đến 2.2 năm** nhờ tiết kiệm chi phí làm thêm giờ của cán bộ, giảm thiểu thất thoát học phí và cắt giảm chi phí văn phòng phẩm. |
| **Operational Feasibility** *(Tính khả thi Vận hành)* | **CAO (Cao)** | Giao diện thân thiện, dễ sử dụng cho cả sinh viên và cán bộ; chuyển đổi từ giấy tờ sang quy trình số giúp giảm tải rõ rệt cho nhân viên nên nhận được sự ủng hộ tuyệt đối từ các phòng ban. |
| **Schedule Feasibility** *(Tính khả thi Lịch trình)* | **TRUNG BÌNH (Khả thi nếu kiểm soát tốt)** | Thời gian 6 tháng là vừa đủ cho một dự án quy mô vừa nếu chia làm 2 giai đoạn: Giai đoạn 1 (MVP luồng ĐKHP + Học phí) bàn giao sau 3 tháng; Giai đoạn 2 (các tính năng nâng cao) hoàn tất trong 3 tháng tiếp theo. |

---

### 9. Expected Deliverables (Sản Phẩm Bàn Giao Dự Kiến)
1. **Bộ Hồ sơ Phân tích & Thiết kế Phần mềm (SRS & SDD):** Đặc tả ca sử dụng (Use Case Specs), Biểu đồ BCE/Sequence, Mô hình dữ liệu quan hệ (ERD).
2. **Bộ mã nguồn và Cơ sở dữ liệu:** CSDL chuẩn hóa 3NF và hệ thống dịch vụ backend/frontend.
3. **Cổng Cán bộ Đào tạo & Cán bộ Tài chính:** Phân hệ quản trị danh mục, duyệt đơn và đối soát công nợ tự động.
4. **Cổng Sinh viên (Web/Mobile App):** Phân hệ đăng ký học phần và thanh toán VietQR.
5. **Bộ Tài liệu Hướng dẫn Vận hành & Kịch bản Kiểm thử:** User Manual, Test Cases, và Kế hoạch chuyển đổi dữ liệu (Data Migration Plan).

---

### 10. Risks & Mitigation Strategies (Rủi Ro & Phương Án Giảm Thiểu)

| STT | Rủi ro nhận diện | Mức độ | Phương án giảm thiểu (Mitigation Strategy) |
|:---:|---|:---:|---|
| **R-01** | **Rủi ro sập tải hệ thống (Traffic Spike):** Hàng chục nghìn sinh viên cùng lúc truy cập cổng đăng ký vào giây mở cổng đầu tiên. | **Cao** | Triển khai cơ chế hàng đợi ảo (Virtual Waiting Room/Queueing System) và phân bổ khung giờ đăng ký theo khóa học/chương trình đào tạo. |
| **R-02** | **Rủi ro sai lệch dữ liệu tài chính:** Ngân hàng trả webhook chậm hoặc bị gián đoạn mạng dẫn đến việc sinh viên chuyển khoản nhưng hệ thống chưa ghi nhận. | **Trung bình** | Xây dựng tiến trình đối soát chạy ngầm (Reconciliation Worker) tự động quét lại sao kê API ngân hàng định kỳ mỗi 5 phút; cơ chế hoàn tiền tự động khi lỗi. |
| **R-03** | **Rủi ro kháng cự thay đổi quy trình:** Một số cán bộ lớn tuổi ngại sử dụng giao diện duyệt đơn điện tử, vẫn quen nhận đơn giấy. | **Trung bình** | Tổ chức các buổi tập huấn chuyên sâu (Training workshops); ban hành quy định hành chính bắt buộc 100% thủ tục giải quyết qua cổng dịch vụ số. |
| **R-04** | **Rủi ro dữ liệu lịch sử không sạch:** Dữ liệu điểm và học phần của các khóa cũ có nhiều định dạng không nhất quán. | **Trung bình** | Thiết kế module làm sạch dữ liệu (Data Cleansing Script) trước khi nhập vào cơ sở dữ liệu mới; có giai đoạn chạy song song hai hệ thống để đối soát. |

---

### 11. Approval & Sign-off (Phê Duyệt Khởi Động)

| ĐẠI DIỆN ĐƠN VỊ TÀI TRỢ<br>*(Ban Giám hiệu)* | ĐẠI DIỆN PHÒNG ĐÀO TẠO<br>*(Trưởng phòng Đào tạo)* | ĐẠI DIỆN PHÒNG TÀI CHÍNH<br>*(Trưởng phòng Tài vụ)* |
|:---:|:---:|:---:|
| <br><br>*(Ký, ghi rõ họ tên)* | <br><br>*(Ký, ghi rõ họ tên)* | <br><br>*(Ký, ghi rõ họ tên)* |
| **Ngày:** ...... / ...... / 2026 | **Ngày:** ...... / ...... / 2026 | **Ngày:** ...... / ...... / 2026 |
