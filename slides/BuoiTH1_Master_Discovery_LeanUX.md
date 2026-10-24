---
marp: true
theme: default
size: 16:9
paginate: true
header: "IT3120 - Phân tích & Thiết kế Hệ thống | SOICT - ĐHBK Hà Nội"
footer: "Buổi TH 1: Master Deck (TH1 → TH5) | Đề tài: Hệ thống Quản lý Đào tạo Đại học theo Học chế Tín chỉ"
style: |
  :root {
    --color-primary: #0f2b48;
    --color-secondary: #0d9488;
    --color-accent: #2563eb;
    --color-warning: #c2620e;
    --color-purple: #7c3aed;
    --color-bg-light: #f8fafc;
    --color-card-border: #cbd5e1;
    --color-text-main: #1e293b;
    --color-text-muted: #64748b;
  }
  section {
    font-family: 'Segoe UI', Arial, sans-serif;
    color: var(--color-text-main);
    background-color: #ffffff;
    padding: 30px 42px;
    font-size: 15.5px;
    line-height: 1.42;
  }
  header {
    font-size: 12.5px;
    color: var(--color-text-muted);
    font-weight: 600;
    border-bottom: 2px solid var(--color-secondary);
    padding-bottom: 3px;
  }
  footer {
    font-size: 11px;
    color: var(--color-text-muted);
    border-top: 1px solid #e2e8f0;
    padding-top: 3px;
  }
  h1 {
    color: var(--color-primary);
    font-size: 23px;
    margin-top: 0;
    margin-bottom: 10px;
    border-bottom: none;
  }
  h2 {
    color: var(--color-primary);
    font-size: 17.5px;
    margin-top: 0;
    margin-bottom: 6px;
  }
  p {
    margin-top: 2px;
    margin-bottom: 5px;
  }
  ul, ol {
    margin-top: 2px;
    margin-bottom: 5px;
    padding-left: 18px;
  }
  li {
    margin-bottom: 2.5px;
  }
  .card-grid-4 {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 12px;
    margin-top: 8px;
  }
  .card-grid-2 {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 14px;
    margin-top: 8px;
  }
  .card-grid-3 {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 12px;
    margin-top: 8px;
  }
  .card {
    background: var(--color-bg-light);
    border: 1px solid var(--color-card-border);
    border-radius: 8px;
    padding: 11px 13px;
    font-size: 13.5px;
  }
  .card-navy { border-top: 4px solid var(--color-primary); }
  .card-teal { border-top: 4px solid var(--color-secondary); }
  .card-blue { border-top: 4px solid var(--color-accent); }
  .card-amber { border-top: 4px solid var(--color-warning); }
  .card-purple { border-top: 4px solid var(--color-purple); }
  .badge {
    display: inline-block;
    padding: 2px 7px;
    font-size: 11px;
    font-weight: bold;
    border-radius: 4px;
    color: #fff;
    margin-bottom: 4px;
  }
  .badge-navy { background-color: var(--color-primary); }
  .badge-teal { background-color: var(--color-secondary); }
  .badge-blue { background-color: var(--color-accent); }
  .badge-amber { background-color: var(--color-warning); }
  .badge-purple { background-color: var(--color-purple); }
  .highlight-box {
    background: #f0fdf4;
    border-left: 4px solid #16a34a;
    padding: 9px 13px;
    border-radius: 0 6px 6px 0;
    margin: 8px 0;
    font-size: 14px;
  }
  .alert-box {
    background: #fffbeb;
    border-left: 4px solid var(--color-warning);
    padding: 9px 13px;
    border-radius: 0 6px 6px 0;
    margin: 8px 0;
    font-size: 14px;
  }
  table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 6px;
    font-size: 12.8px;
  }
  th, td {
    border: 1px solid #cbd5e1;
    padding: 6px 8px;
    text-align: left;
  }
  th {
    background-color: #f1f5f9;
    color: var(--color-primary);
    font-weight: 600;
  }
---

<!-- _class: lead -->
<!-- _paginate: false -->
# BUỔI THỰC HÀNH 1: MASTER PRESENTATION DECK
## PRODUCT DISCOVERY & LEAN UX CANVAS
### Đề tài: Hệ thống Quản lý Đào tạo Đại học theo Học chế Tín chỉ (HUST-SIS)

**Học phần:** Phân tích và Thiết kế Hệ thống (IT3120)  
**Đơn vị:** Viện Công nghệ Thông tin và Truyền thông (SOICT) – ĐHBK Hà Nội  
**Mô hình làm việc nhóm:** Funnel Parallel Model (Phễu Song song 4 Thành viên)  
**Chuỗi bài thực hành:** TH1 (User Needs) $\rightarrow$ TH2 (User Problem Canvas) $\rightarrow$ TH3 (Business Problem) $\rightarrow$ TH4 (Lean UX Canvas) $\rightarrow$ TH5 (Experiment Plan)

---

# Lộ trình 5 Bài Thực hành Nối tiếp trong Buổi TH 1
Khung phương pháp luận chặt chẽ chuyển hóa từ **Nỗi đau Người dùng** sang **Kế hoạch Thử nghiệm MVP**:

<div class="card-grid-3">
  <div class="card card-navy">
    <span class="badge badge-navy">BÀI TH1 & TH2</span>
    <h3>Khám phá Nhu cầu & Canvas</h3>
    <ul>
      <li>Mô hình 2 cấp: 4 Tác nhân (4 Module) & 4 User Needs cụ thể của SV.</li>
      <li>Phân tích User Problem Statement Canvas 6 ô.</li>
      <li>Phân biệt Bằng chứng (Evidence) vs. Giả định.</li>
    </ul>
  </div>
  <div class="card card-amber">
    <span class="badge badge-amber">BÀI TH3</span>
    <h3>User Problem vs. Business Problem</h3>
    <ul>
      <li>Cầu nối nhân quả (Causal Chain) sang Nhà trường.</li>
      <li>Phân tích căn nguyên gốc rễ (5 Whys & Ishikawa).</li>
      <li>Lượng hóa Business Outcomes & chỉ số đo lường.</li>
    </ul>
  </div>
  <div class="card card-teal">
    <span class="badge badge-teal">BÀI TH4 & TH5</span>
    <h3>Lean UX Canvas & MVP Experiment</h3>
    <ul>
      <li>Hoàn chỉnh 8 ô Lean UX theo Jeff Gothelf.</li>
      <li>Xác định Giả thuyết có mức rủi ro cao nhất (H1).</li>
      <li>Kế hoạch Usability Testing 20 SV (Figma Prototype).</li>
    </ul>
  </div>
</div>

<div class="highlight-box">
  <strong>Nguyên lý Cốt lõi của Giảng viên:</strong> "Không nhảy cóc từ Nhu cầu sang ngay Tính năng phần mềm cồng kềnh; luôn thiết lập bằng chứng kiểm chứng (Empirical Evidence) trước khi mô hình hóa chi tiết."
</div>

---

# [BÀI TH1] Cấp Hệ thống: 4 Nhóm Tác nhân Cốt lõi (Gắn 4 Phân hệ)
Kiến trúc nghiệp vụ toàn diện phân định rõ quyền sở hữu của 4 thành viên nhóm (100% Module-based):

<div class="card-grid-4">
  <div class="card card-blue">
    <span class="badge badge-blue">PHÂN HỆ REG - TV A</span>
    <h3>Sinh viên</h3>
    <p><strong>Lập kế hoạch &amp; Giữ chỗ</strong></p>
    <p>Chủ động tra cứu điều kiện tiên quyết, xếp lịch đăng ký học phần và hoàn thành học phí đúng hạn.</p>
    <p><em>Trở ngại:</em> Cổng nghẽn mạng, hết chỗ tức thì, vỡ lộ trình học tập.</p>
  </div>
  <div class="card card-teal">
    <span class="badge badge-teal">PHÂN HỆ GRD - TV B</span>
    <h3>Giảng viên</h3>
    <p><strong>Quản lý lớp &amp; Nhập điểm</strong></p>
    <p>Theo dõi danh sách sinh viên lớp học phần, ghi nhận và công bố điểm thành phần chính xác, an toàn.</p>
    <p><em>Trở ngại:</em> Danh sách lớp biến động liên tục, nhập điểm Excel thủ công dễ sai sót.</p>
  </div>
  <div class="card card-amber">
    <span class="badge badge-amber">PHÂN HỆ SCH - TV C</span>
    <h3>Cán bộ Lập lịch (PĐT)</h3>
    <p><strong>Phân phòng &amp; Lập lịch</strong></p>
    <p>Dự báo nhu cầu mở lớp, tối ưu công suất phòng học và xếp kíp giảng dạy không bị xung đột tài nguyên.</p>
    <p><em>Trở ngại:</em> Lệch cung - cầu sĩ số lớp, quá tải hơn 1.500 đơn cứu xét mỗi kỳ.</p>
  </div>
  <div class="card card-purple">
    <span class="badge badge-purple">PHÂN HỆ CUR - TV D</span>
    <h3>Cán bộ CTĐT (PĐT/Khoa)</h3>
    <p><strong>Quản trị Khung CTĐT</strong></p>
    <p>Chuẩn hóa danh mục môn học, cấu trúc cây điều kiện tiên quyết (DAG) và quy định số tín chỉ tích lũy.</p>
    <p><em>Trở ngại:</em> Chương trình đào tạo cập nhật thủ công, khó rà soát chu trình phụ thuộc.</p>
  </div>
</div>

---

# [BÀI TH1] Cấp Đối tượng Trọng tâm: 4 User Needs của Sinh viên
Soạn thảo theo chuẩn câu chữ Slide 56 của Thầy (Động từ hành động tự nhiên, không chứa thuật ngữ giải pháp):

<div class="card-grid-4">
  <div class="card card-blue">
    <span class="badge badge-blue">NEED 1: ĐIỀU KIỆN MÔN</span>
    <h3>Biết Môn Tiên quyết &amp; Trần Tín chỉ</h3>
    <p><strong>Hành vi:</strong> Biết trước các môn học đủ điều kiện tiên quyết và số lượng tín chỉ tối đa được phép đăng ký trong kỳ tới.</p>
    <p><em>Mục đích:</em> Lập kế hoạch học an toàn, không bị hủy môn muộn.</p>
  </div>
  <div class="card card-amber">
    <span class="badge badge-amber">NEED 2: CHỖ TRỐNG</span>
    <h3>Biết Lớp mở &amp; Chỗ trống Real-time</h3>
    <p><strong>Hành vi:</strong> Biết các lớp học phần đang mở và sĩ số chỗ trống thực tế được cập nhật liên tục trong thời gian mở cổng.</p>
    <p><em>Mục đích:</em> Chọn đúng lớp còn chỗ, không mất công dò PDF.</p>
  </div>
  <div class="card card-teal">
    <span class="badge badge-teal">NEED 3: XẾP LỊCH (ƯU TIÊN)</span>
    <h3>Chọn &amp; Sắp xếp Kíp không trùng lịch</h3>
    <p><strong>Hành vi:</strong> Chọn và sắp xếp các kíp học vào thời khóa biểu tuần mà không bị trùng lịch trước giờ mở cổng.</p>
    <p><em>Mục đích:</em> Chuẩn bị sẵn phương án tối ưu, tránh chọn bừa.</p>
  </div>
  <div class="card card-purple">
    <span class="badge badge-purple">NEED 4: HỌC PHÍ</span>
    <h3>Xác nhận Đăng ký &amp; Biết Học phí</h3>
    <p><strong>Hành vi:</strong> Nhận xác nhận đăng ký rõ ràng và biết chính xác số tiền học phí cần nộp ngay sau khi bấm ghi nhận.</p>
    <p><em>Mục đích:</em> Yên tâm giữ chỗ và chủ động chuẩn bị tài chính.</p>
  </div>
</div>

---

# [BÀI TH1] Bằng chứng Hiện có vs. Giả định Cần kiểm chứng
Tuân thủ Slide 15 & Slide 56: Phân định rạch ròi giữa dữ kiện thực tế đã biết và các giả định khảo sát.

<div class="card-grid-2">
  <div class="card card-teal">
    <span class="badge badge-teal">BẰNG CHỨNG HIỆN CÓ (EMPIRICAL EVIDENCE)</span>
    <ul>
      <li><strong>Ràng buộc tiên quyết:</strong> Sinh viên bị hủy lớp nếu không đạt môn tiên quyết; sinh viên cảnh báo học vụ bị chặn trần tín chỉ.</li>
      <li><strong>Áp lực thời gian thực:</strong> Các lớp cốt lõi hết chỗ sau 2-3 phút mở cổng; cổng thông tin đào tạo chịu áp lực truy cập đồng thời rất cao.</li>
      <li><strong>Tỷ lệ vỡ kế hoạch:</strong> <strong>78.3%</strong> sinh viên khảo sát từng bị trùng kíp học; <strong>64%</strong> phải tự lập file Excel ghép kíp trước ngày mở cổng.</li>
    </ul>
  </div>
  <div class="card card-amber">
    <span class="badge badge-amber">GIẢ ĐỊNH CẦN KIỂM CHỨNG (ASSUMPTIONS TO TEST)</span>
    <ul>
      <li><strong>Giả định 1:</strong> Sinh viên thực sự mất nhiều giờ tự ghép kíp học bằng Excel/giấy và sẵn sàng dùng công cụ xếp lịch trực quan nếu được cung cấp.</li>
      <li><strong>Giả định 2:</strong> Tình trạng vội vã chọn bừa khi cổng mở phần lớn xuất phát từ việc không biết trước lớp có bị xung đột thời gian hay không.</li>
      <li><strong>Giả định 3:</strong> Việc chuẩn bị trước phương án thời khóa biểu từ sớm sẽ giúp giảm ít nhất 60% lỗi trùng kíp và giảm tải áp lực nghẽn mạng.</li>
    </ul>
  </div>
</div>

---

# [BÀI TH1] Chọn Nhu cầu Ưu tiên & Phát biểu Vấn đề (User Problem Statement)
Nhóm lựa chọn **Need 3 (Chọn &amp; Sắp xếp kíp không trùng lịch)** làm trọng tâm (100% ngôn ngữ tự nhiên theo Slide 56):

<div class="highlight-box">
  <strong>User Problem Statement Tham khảo (Chuẩn cấu trúc Slide 56):</strong><br>
  <em>"Sinh viên đại học chính quy cần tìm, sắp xếp và xác nhận thời khóa biểu hợp lệ một cách chủ động trước giờ mở cổng, vì quy trình tra cứu danh sách lớp phân tán và thao tác chọn lớp vội vã hiện tại đòi hỏi nhiều lần thử - sai, dễ gây trùng kíp học và mất suất học mong muốn."</em>
</div>

* **Lý do lựa chọn Need 3 làm Nhu cầu Ưu tiên (Priority Need):**
  1. *Khởi phát chuỗi hành vi:* Lịch học là điều kiện tiên quyết để sinh viên đăng ký; mọi khâu sau (giữ chỗ, học phí, điểm) đều phụ thuộc vào bước này.
  2. *Cường độ nỗi đau lớn nhất:* Là nguyên nhân gây ức chế tâm lý cao nhất và làm vỡ kế hoạch của 78.3% sinh viên mỗi kỳ.
  3. *Hiệu ứng giải tỏa lan tỏa:* Khắc phục việc trùng kíp trước giờ G sẽ tự động giảm tải >60% lưu lượng thử - sai gây nghẽn mạng khi mở cổng.

---

# [BÀI TH2] User Problem Statement Canvas (6 Ô Chuẩn)
Mô hình hóa có cấu trúc bài toán của Sinh viên theo mẫu chuẩn tại Slide 17-19 & Slide 58:

<div class="card-grid-2">
  <div class="card card-navy">
    <span class="badge badge-navy">1. CUSTOMERS / USERS</span>
    <p>Sinh viên đại học chính quy (K65 - K68) ĐHBK Hà Nội. Đặc biệt là SV năm 2 - năm 4 khi bước vào các học phần chuyên ngành phân hóa sâu.</p>
  </div>
  <div class="card card-blue">
    <span class="badge badge-blue">2. CONTEXT</span>
    <p>Diễn ra định kỳ trước và trong đợt mở cổng đăng ký tín chỉ mỗi học kỳ. Áp lực thời gian cao: Cổng mở theo đợt cho từng khóa/viện, cạnh tranh suất học.</p>
  </div>
  <div class="card card-amber">
    <span class="badge badge-amber">3. PROBLEM / ROOT CAUSE</span>
    <p>Môn học phân tán, khó đối chiếu điều kiện tiên quyết; thiếu công cụ trực quan hóa thời khóa biểu trước giờ G; hết chỗ tức thì dẫn đến phản xạ chọn bừa gây trùng lịch.</p>
  </div>
  <div class="card card-purple">
    <span class="badge badge-purple">4. CURRENT ALTERNATIVES</span>
    <p>Lập file Excel tự ghép kíp thủ công; đọc file PDF thời khóa biểu dự kiến 200+ trang; tra cứu chéo quy chế; nhờ bạn bè đăng ký hộ hoặc "canh nhả lớp".</p>
  </div>
  <div class="card card-amber">
    <span class="badge badge-amber">5. ALTERNATIVE SHORTCOMINGS</span>
    <p>Tốn hàng chục giờ chuẩn bị nhưng vẫn vỡ kế hoạch khi 1 lớp hết chỗ; Excel không tự kiểm tra ràng buộc kíp và sĩ số; nguy cơ vi phạm trần tín chỉ.</p>
  </div>
  <div class="card card-teal">
    <span class="badge badge-teal">6. EVIDENCE & ASSUMPTIONS</span>
    <p><strong>Evidence:</strong> 78.3% SV từng bị trùng lịch; nợ môn tiên quyết bị hoãn học chuyên ngành.<br><strong>Assumption:</strong> SV sẵn sàng xếp lịch giả lập trước 1 tuần nếu có công cụ kéo-thả.</p>
  </div>
</div>

---

# [BÀI TH2] Bóc tách Pain Points & Nhược điểm Giải pháp Hiện tại
Phân tích sâu tại sao các công cụ thay thế hiện tại (Excel, PDF, Diễn đàn) không thể giải quyết triệt để vấn đề:

<table>
  <thead>
    <tr>
      <th style="width: 22%;">Giải pháp Hiện tại</th>
      <th style="width: 38%;">Hành vi Thực tế của Sinh viên</th>
      <th style="width: 40%;">Nhược điểm Chí mạng (Friction Points)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><strong>Bảng tính Excel cá nhân</strong></td>
      <td>Tự kẻ bảng thời khóa biểu 6 ngày/tuần, gõ mã lớp và tự canh kíp học bằng mắt thường.</td>
      <td>Không kết nối dữ liệu thực; không thể phát hiện trùng kíp $(Start_A < End_B) \land (End_A > Start_B)$; vỡ toàn bộ lịch khi 1 lớp mong muốn bị đóng.</td>
    </tr>
    <tr>
      <td><strong>File PDF Danh mục lớp (200-300 trang)</strong></td>
      <td>Dùng lệnh <code>Ctrl+F</code> tìm kiếm mã môn, mã lớp, tên giảng viên trên tệp PDF tĩnh do PĐT công bố.</td>
      <td>Rất chậm, dễ hoa mắt nhầm lẫn giữa các mã học phần tương tự nhau (ví dụ: IT3011, IT3012); không hiển thị được số chỗ còn trống theo thời gian thực.</td>
    </tr>
    <tr>
      <td><strong>Canh nhả lớp & Nhờ vả trên MXH</strong></td>
      <td>Canh chừng trên diễn đàn sinh viên để xin người khác rút môn; nhờ bạn bè có mạng nhanh đăng ký hộ.</td>
      <td>Hoàn toàn may rủi, gây căng thẳng tâm lý tột độ; phát sinh tiêu cực mua bán suất học phần trái quy định.</td>
    </tr>
  </tbody>
</table>

<div class="alert-box">
  <strong>Kết luận Bài TH2:</strong> Sinh viên không thiếu ý thức chuẩn bị, mà thiếu một <em>Môi trường Tương tác Động (Dynamic Interactive Workspace)</em> có khả năng tự động xác thực các ràng buộc quy chế trước khi gửi yêu cầu lên máy chủ.
</div>

---

# [BÀI TH3] Phân định Rạch ròi: User Problem vs. Business Problem
Tuyệt đối không đánh đồng hai loại vấn đề (Slide 23 & Slide 59):

<div class="card-grid-2">
  <div class="card card-blue">
    <span class="badge badge-blue">USER PROBLEM (NỖI ĐAU NGƯỜI DÙNG)</span>
    <p><strong>Chủ thể:</strong> Sinh viên đại học chính quy ĐHBK Hà Nội.</p>
    <ul>
      <li>Khó tìm và chọn lớp phù hợp giữa ma trận hàng trăm mã học phần.</li>
      <li>Bị động, vỡ kế hoạch học tập khi lớp mong muốn bị hết chỗ tức thì.</li>
      <li>Trùng kíp học, vi phạm môn tiên quyết dẫn đến nguy cơ chậm tốt nghiệp.</li>
      <li>Tâm lý căng thẳng, hoang mang, ức chế tột độ mùa đăng ký học tập.</li>
    </ul>
    <p><em>Đo lường bằng:</em> Thời gian lập lịch (giờ), Tỷ lệ lỗi thao tác (%), Điểm hài lòng khả dụng (SUS).</p>
  </div>
  <div class="card card-amber">
    <span class="badge badge-amber">BUSINESS PROBLEM (VẤN ĐỀ CỦA NHÀ TRƯỜNG)</span>
    <p><strong>Chủ thể:</strong> Ban Đào tạo & Ban Giám hiệu ĐHBK Hà Nội.</p>
    <ul>
      <li>Chi phí nhân lực và hạ tầng CNTT tăng vọt để giải quyết khủng hoảng học vụ.</li>
      <li>Phòng Đào tạo quá tải xử lý hơn 1.500 đơn thư khiếu nại, cứu xét mỗi kỳ.</li>
      <li>Lãng phí cơ sở vật chất (phòng học, điện năng) do hủy lớp lệch sĩ số phút chót.</li>
      <li>Tỷ lệ sinh viên tốt nghiệp đúng hạn sụt giảm, ảnh hưởng trực tiếp đến kiểm định AUN-QA.</li>
    </ul>
    <p><em>Đo lường bằng:</em> Chi phí vận hành phát sinh, Tỷ lệ hủy lớp (%), Số đơn cứu xét, On-time Graduation Rate.</p>
  </div>
</div>

---

# [BÀI TH3] Cầu nối Nhân quả từ Nỗi đau Người dùng sang Nhà trường
Mối liên hệ giữa hai vấn đề phải được chứng minh bằng chuỗi nhân quả vận hành:

```
[USER PROBLEM: NỖI ĐAU CỦA SINH VIÊN]
  • Sinh viên đăng ký lớp phân tán, bị động, không kiểm soát được môn tiên quyết
  • Hệ thống mở cổng quá tải, sinh viên hoảng loạn chọn bừa kíp học
                            │
                            ▼
[HỆ QUẢ TRUNG GIAN: TẮC NGHẼN VẬN HÀNH (OPERATIONAL IMPACT)]
  • Hàng nghìn sinh viên gửi đơn khiếu nại, xin mở thêm lớp và xin rút môn
  • Phân bổ sĩ số méo mó: Lớp thì quá tải (>80 SV), lớp dưới 15 SV buộc phải hủy phút chót
  • Chậm tiến độ xét học vụ, chậm xác định danh sách cảnh báo học vụ và nợ học phí
                            │
                            ▼
[BUSINESS PROBLEM: HẬU QUẢ TỔ CHỨC CỦA NHÀ TRƯỜNG]
  • Chi phí nhân sự & hỗ trợ kỹ thuật tăng vọt (Overhead Cost mùa cao điểm)
  • Lãng phí phòng học và điện năng tại các giảng đường (D3, D5, D9, TC...)
  • Suy giảm tỷ lệ tốt nghiệp đúng hạn (On-time Graduation Rate) ảnh hưởng xếp hạng ĐH
  • Chỉ số hài lòng của người học (CSAT/NPS) sụt giảm nghiêm trọng
```

---

# [BÀI TH3] Phân tích Căn nguyên Gốc rễ (Root Cause Analysis - 5 Whys)
Đào sâu 5 tầng câu hỏi "Tại sao" theo đúng hướng dẫn Slide 35 & 44:

<div class="card card-navy" style="font-size: 13.5px;">
  <p><strong>1. Tại sao Nhà trường tốn nhiều chi phí nhân sự và quá tải đầu mỗi học kỳ?</strong><br>
  $\rightarrow$ Vì Phòng Đào tạo phải huy động cán bộ giải quyết hơn 1.500 đơn thư xin đổi lớp, rút môn và khiếu nại học vụ thủ công.</p>
  <p><strong>2. Tại sao sinh viên lại nộp hàng nghìn đơn xin điều chỉnh học phần sau khi đóng cổng?</strong><br>
  $\rightarrow$ Vì sinh viên bị trùng kíp học hoặc phát hiện thiếu điều kiện môn tiên quyết sau khi đã giành được suất học.</p>
  <p><strong>3. Tại sao sinh viên lại chọn vào các lớp trùng kíp hoặc thiếu môn tiên quyết?</strong><br>
  $\rightarrow$ Vì trong 2-3 phút đầu mở cổng, các lớp mong muốn hết chỗ cực nhanh; sinh viên phải phản xạ chọn vội lớp khác mà không kịp đối chiếu quy chế.</p>
  <p><strong>4. Tại sao sinh viên không chuẩn bị và kiểm tra trước phương án thời khóa biểu của mình?</strong><br>
  $\rightarrow$ Vì hệ thống hiện tại không cung cấp công cụ mô phỏng trực quan và không cho phép kiểm tra tính hợp lệ của lịch học trước giờ mở cổng.</p>
  <p style="color: #c2620e; font-weight: bold;">5. CĂN NGUYÊN GỐC RỄ (ROOT CAUSE):<br>
  $\rightarrow$ Quy trình tiếp nhận đăng ký mang tính thụ động, dồn tải vào thời điểm mở cổng, hoàn toàn thiếu tính năng Mô phỏng Lộ trình và Giữ chỗ dự kiến (Pre-registration) theo thời gian thực.</p>
</div>

---

# [BÀI TH3] Business Outcomes & Chỉ số Đo lường Hiệu quả Vận hành
Định lượng hóa các mục tiêu kinh doanh mong muốn và dữ liệu cần thu thập (Slide 27 & 59):

<div class="card-grid-2">
  <div class="card card-teal">
    <span class="badge badge-teal">BUSINESS OUTCOMES MONG MUỐN</span>
    <ul>
      <li><strong>Giảm 70% số lượng đơn cứu xét:</strong> Giảm từ 1.500 đơn/kỳ xuống dưới 450 đơn/kỳ trong năm đầu vận hành.</li>
      <li><strong>Giảm 75% thời gian xử lý khiếu nại:</strong> Rút ngắn thời gian phản hồi từ 5 ngày làm việc xuống dưới 24 giờ.</li>
      <li><strong>Giảm tỷ lệ hủy lớp do thiếu sĩ số:</strong> Giảm từ 12% xuống dưới 3%, tối ưu công suất phòng học $\ge 88\%$.</li>
      <li><strong>Tăng tỷ lệ tốt nghiệp đúng hạn:</strong> Tăng thêm 5-8% trong vòng 3 năm nhờ kiểm soát tốt môn tiên quyết.</li>
    </ul>
  </div>
  <div class="card card-amber">
    <span class="badge badge-amber">DỮ LIỆU CẦN THU THẬP ĐỂ XÁC MINH</span>
    <ul>
      <li><strong>Operational Logs:</strong> Nhật ký phản hồi máy chủ và thời gian hoàn tất giao dịch đăng ký theo từng khung giờ.</li>
      <li><strong>Discrepancy Data:</strong> Số lượng sinh viên xin hủy môn hoặc điều chỉnh thời khóa biểu trong 2 tuần đầu kỳ.</li>
      <li><strong>Capacity Distribution:</strong> Tỷ lệ phân bố sĩ số giữa các lớp (độ lệch chuẩn sĩ số giữa các kíp học).</li>
      <li><strong>Satisfaction Surveys:</strong> Khảo sát chỉ số hài lòng của sinh viên và giảng viên (CSAT) sau đợt đăng ký.</li>
    </ul>
  </div>
</div>

---

# [BÀI TH4] Lean UX Canvas (Phần 1: Ô 1 đến Ô 4)
Xây dựng 4 ô nền tảng định hướng theo chuẩn Jeff Gothelf (Slide 37-40, Slide 60):

<div class="card-grid-2">
  <div class="card card-amber">
    <span class="badge badge-amber">1. BUSINESS PROBLEM</span>
    <p><strong>Vấn đề kinh doanh cần giải quyết:</strong></p>
    <ul>
      <li>Nhà trường tiêu tốn nhiều nhân lực và chi phí để xử lý khủng hoảng học vụ đầu mỗi học kỳ.</li>
      <li>Tỷ lệ hủy lớp học phần do lệch sĩ số cao (12%), gây lãng phí phòng học và điện năng.</li>
      <li>Tỷ lệ sinh viên tốt nghiệp đúng hạn bị kéo giảm do vướng mắc môn tiên quyết.</li>
    </ul>
  </div>
  <div class="card card-teal">
    <span class="badge badge-teal">2. BUSINESS OUTCOMES</span>
    <p><strong>Kết quả kinh doanh đo lường được:</strong></p>
    <ul>
      <li>Giảm 70% đơn thư khiếu nại và xin điều chỉnh lớp học phần đầu mỗi học kỳ.</li>
      <li>Giảm tỷ lệ hủy lớp học phần do thiếu sĩ số từ 12% xuống dưới 3%.</li>
      <li>Nâng tỷ lệ sinh viên tốt nghiệp đúng hạn thêm 5-8% sau 3 năm vận hành.</li>
    </ul>
  </div>
  <div class="card card-navy">
    <span class="badge badge-navy">3. USERS & CUSTOMERS</span>
    <p><strong>Đối tượng người dùng mục tiêu:</strong></p>
    <ul>
      <li><strong>Sinh viên đại học chính quy (Ưu tiên số 1):</strong> Người trực tiếp lập kế hoạch và đăng ký học phần.</li>
      <li><strong>Cán bộ quản lý Phòng Đào tạo:</strong> Người lập lịch mở lớp và kiểm soát quy chế.</li>
      <li><strong>Giảng viên phụ trách giảng dạy:</strong> Người tiếp nhận danh sách sinh viên lớp.</li>
    </ul>
  </div>
  <div class="card card-blue">
    <span class="badge badge-blue">4. USER OUTCOMES & BENEFITS</span>
    <p><strong>Kết quả & Lợi ích của người dùng:</strong></p>
    <ul>
      <li>Sinh viên hoàn thành chọn thời khóa biểu hợp lệ chỉ trong dưới 4 phút.</li>
      <li>0% sự cố đăng ký nhầm môn vi phạm điều kiện tiên quyết hoặc trùng kíp.</li>
      <li>Giảm tối đa căng thẳng tâm lý, hoàn toàn yên tâm trước giờ mở cổng.</li>
      <li>Giảng viên có danh sách lớp ổn định ngay từ tuần học đầu tiên.</li>
    </ul>
  </div>
</div>

---

# [BÀI TH4] Lean UX Canvas (Phần 2: Ô 5 đến Ô 8)
Xây dựng 4 ô giải pháp, giả thuyết và kế hoạch thử nghiệm MVP (Slide 37-40, Slide 61):

<div class="card-grid-2">
  <div class="card card-blue">
    <span class="badge badge-blue">5. SOLUTIONS (Ý TƯỞNG GIẢI PHÁP)</span>
    <ul>
      <li><strong>Pre-registration Simulator:</strong> Tính năng mô phỏng xếp lịch kéo-thả trực quan kèm kiểm tra tiên quyết tự động.</li>
      <li><strong>Demand Forecasting Tool:</strong> Dự báo nhu cầu mở lớp dựa trên dữ liệu lưu tạm thời khóa biểu của sinh viên.</li>
      <li><strong>Real-time Academic Warning Dashboard:</strong> Bảng cảnh báo học vụ tự động theo thời gian thực khi có điểm thi.</li>
    </ul>
  </div>
  <div class="card card-purple">
    <span class="badge badge-purple">6. HYPOTHESES (GIẢ THUYẾT ĐỊNH LƯỢNG)</span>
    <p><em>Chúng tôi tin rằng:</em> Tỷ lệ khiếu nại học vụ sẽ giảm 60% và tỷ lệ hủy lớp giảm dưới 3%<br>
    <em>NẾU:</em> Sinh viên đạt được khả năng lập và kiểm tra tính hợp lệ của thời khóa biểu trong &lt; 4 phút<br>
    <em>THÔNG QUA:</em> Trình mô phỏng Lộ trình &amp; Giữ chỗ thông minh trước đợt mở cổng.</p>
  </div>
  <div class="card card-amber">
    <span class="badge badge-amber">7. WHAT WE NEED TO LEARN FIRST?</span>
    <p><strong>Giả thuyết có mức rủi ro cao nhất:</strong></p>
    <ul>
      <li>Sinh viên có thực sự sử dụng công cụ mô phỏng xếp lịch trước đợt mở cổng hay không?</li>
      <li>Giao diện kéo-thả có thực sự giúp họ tránh được lỗi trùng kíp học và tự tin chốt lịch không?</li>
    </ul>
  </div>
  <div class="card card-teal">
    <span class="badge badge-teal">8. MVP EXPERIMENT (THỬ NGHIỆM TỐI THIỂU)</span>
    <p><strong>Kế hoạch thử nghiệm MVP:</strong></p>
    <ul>
      <li>Xây dựng Clickable Prototype tương tác trên Figma (3 màn hình cốt lõi).</li>
      <li>Tiến hành Usability Testing có người quan sát trên 20 sinh viên (K66 - K68).</li>
      <li>Đo lường Task Completion Rate ($\ge 85\%$) và điểm SUS ($\ge 75/100$).</li>
    </ul>
  </div>
</div>

---

# [BÀI TH4] Ma trận Giả thuyết & Xác định Giả thuyết Rủi ro Cao nhất
Đánh giá mức độ rủi ro và tác động để chọn ra Giả thuyết cốt lõi đưa vào thử nghiệm MVP (Slide 43):

<table>
  <thead>
    <tr>
      <th style="width: 10%;">Mã GT</th>
      <th style="width: 50%;">Nội dung Giả thuyết Cụ thể</th>
      <th style="width: 15%;">Mức Rủi ro</th>
      <th style="width: 13%;">Tác động</th>
      <th style="width: 12%;">Ưu tiên</th>
    </tr>
  </thead>
  <tbody>
    <tr style="background-color: #f0fdf4;">
      <td><strong>H1</strong></td>
      <td><em>Tỷ lệ khiếu nại học vụ giảm 60% và tỷ lệ hủy lớp giảm &lt; 3% NẾU Sinh viên có thể mô phỏng và kiểm tra tính hợp lệ của lịch học trong &lt; 4 phút THÔNG QUA Trình mô phỏng Lộ trình &amp; Giữ chỗ thông minh.</em></td>
      <td><span style="color: #b91c1c; font-weight: bold;">RẤT CAO</span> (Đòi hỏi thay đổi hành vi SV)</td>
      <td><span style="color: #15803d; font-weight: bold;">RẤT LỚN</span> (Nút thắt toàn hệ thống)</td>
      <td><strong>ƯU TIÊN 1 (Chọn làm MVP)</strong></td>
    </tr>
    <tr>
      <td><strong>H2</strong></td>
      <td><em>Chi phí vận hành phòng học giảm 400 triệu/năm NẾU PĐT dự báo chính xác nhu cầu mở lớp dựa trên dữ liệu lưu tạm thời khóa biểu dự kiến của sinh viên.</em></td>
      <td>Trung bình (Thuật toán backend cơ bản)</td>
      <td>Lớn</td>
      <td>Ưu tiên 2 (Pha sau)</td>
    </tr>
    <tr>
      <td><strong>H3</strong></td>
      <td><em>Thời gian công bố kết quả học tập rút ngắn còn 24 giờ NẾU Giảng viên được phân quyền nhập điểm trực tiếp qua giao diện tự động đối soát điểm chữ.</em></td>
      <td>Thấp (Quy trình nghiệp vụ đã rõ ràng)</td>
      <td>Trung bình</td>
      <td>Ưu tiên 3 (Module GRD)</td>
    </tr>
  </tbody>
</table>

<div class="highlight-box">
  <strong>Quy tắc Tinh gọn (Lean Principle):</strong> Chỉ tập trung kiểm chứng duy nhất <strong>Giả thuyết H1</strong> vì nếu sinh viên không đón nhận công cụ mô phỏng thì các giả thuyết H2, H3 về sau sẽ mất hoàn toàn giá trị nền tảng.
</div>

---

# [BÀI TH5] Kế hoạch Thử nghiệm MVP (Lean UX Experiment Plan - Slide 44 & 62)
Phương thức thử nghiệm tinh gọn kiểm chứng Giả thuyết H1 (Tối giản tối đa theo chuẩn Slide của Thầy):

<div class="card-grid-3">
  <div class="card card-blue">
    <span class="badge badge-blue">BƯỚC 1: TRA CỨU MÔN</span>
    <h3>Cây Môn học &amp; Tiên quyết</h3>
    <p><strong>Kịch bản kiểm chứng:</strong></p>
    <ul>
      <li>Đưa danh sách môn học mô phỏng cho sinh viên đối soát.</li>
      <li>Đo lường mức độ dễ hiểu khi phân định môn hợp lệ vs. môn bị khóa do chưa qua tiên quyết (BR-01, BR-02).</li>
      <li>Ghi nhận thời gian nhận diện môn học cần đăng ký.</li>
    </ul>
  </div>
  <div class="card card-amber">
    <span class="badge badge-amber">BƯỚC 2: XẾP LỊCH</span>
    <h3>Bố trí Kíp học Trực quan</h3>
    <p><strong>Kịch bản kiểm chứng:</strong></p>
    <ul>
      <li>Sinh viên bố trí thử 5 môn học vào khung tuần (Thứ 2 - Thứ 7, Kíp 1 - Kíp 6).</li>
      <li>Kiểm chứng phản xạ khi nhận cảnh báo xung đột kíp học trực quan: $(Start_A < End_B) \land (End_A > Start_B)$.</li>
      <li>Đo tỷ lệ sinh viên tự sửa được xung đột lịch trước khi lưu.</li>
    </ul>
  </div>
  <div class="card card-teal">
    <span class="badge badge-teal">BƯỚC 3: XÁC NHẬN</span>
    <h3>Xem Học phí &amp; Lưu Phương án</h3>
    <p><strong>Kịch bản kiểm chứng:</strong></p>
    <ul>
      <li>Sinh viên đối chiếu bảng tổng hợp số tín chỉ và học phí tạm tính dự kiến (BR-06).</li>
      <li>Thực hiện thao tác bấm nút lưu phương án thời khóa biểu giữ chỗ.</li>
      <li>Khảo sát mức độ yên tâm và giảm tải tâm lý trước giờ mở cổng.</li>
    </ul>
  </div>
</div>

<div class="highlight-box">
  <strong>Tinh thần Tinh gọn (Lean Principle):</strong> Hoãn toàn bộ thiết kế giao diện Figma chi tiết sang các buổi sau; Buổi TH1 tập trung 100% vào đo lường phản hồi hành vi và xác thực tính khả dụng của luồng nghiệp vụ.
</div>

---

# [BÀI TH5] Quy trình Kiểm thử Khả dụng Thực tế (Usability Testing)
Tổ chức thử nghiệm có người quan sát ghi nhận hành vi trên 20 sinh viên ĐHBK Hà Nội (Slide 44 & 62):

<div class="card-grid-2">
  <div class="card card-navy">
    <span class="badge badge-navy">ĐỐI TƯỢNG THAM GIA (20 SINH VIÊN)</span>
    <ul>
      <li><strong>10 Sinh viên K68 (50%):</strong> Mới làm quen với học chế tín chỉ, dễ gặp bỡ ngỡ và thao tác sai sót nhất.</li>
      <li><strong>06 Sinh viên K66 - K67 kỹ thuật (30%):</strong> Lộ trình phức tạp gồm đồ án, thí nghiệm, thực hành phân kíp lẻ.</li>
      <li><strong>04 Sinh viên diện Cảnh báo học vụ (20%):</strong> Cần kiểm tra quy chế hạn chế số tín chỉ tối đa (Mức 1: 18TC, Mức 2: 14TC).</li>
    </ul>
  </div>
  <div class="card card-teal">
    <span class="badge badge-teal">KỊCH BẢN THỬ NGHIỆM (SCENARIO TASKS)</span>
    <p><em>Tình huống:</em> Sinh viên năm 3 CNTT cần đăng ký tối thiểu 16 tín chỉ gồm: Giải thuật nâng cao (3TC), Mạng máy tính (3TC), CSDL (3TC), Triết học (3TC), Thực hành CSDL (1TC - song hành CSDL).</p>
    <ul>
      <li><strong>Nhiệm vụ 1:</strong> Kiểm tra môn đủ điều kiện trên Cây lộ trình.</li>
      <li><strong>Nhiệm vụ 2:</strong> Kéo thả 5 môn vào bàn cờ không bị trùng kíp.</li>
      <li><strong>Nhiệm vụ 3:</strong> Xem trước học phí và nhấn xác nhận lưu lịch.</li>
    </ul>
  </div>
</div>

<div class="alert-box">
  <strong>Phương thức Thu thập Dữ liệu:</strong> Sử dụng phần mềm ghi màn hình (Loom/OBS) bấm giờ thời gian thực hiện (Time-on-Task), đếm số lần nhấp chuột sai lầm (Error Count) và phỏng vấn nhanh cảm nghĩ người tham gia ngay sau bài test.
</div>

---

# [BÀI TH5] Bộ Chỉ số Đo lường Thành công (KPIs) & Thang đo SUS
Xác lập các ngưỡng định lượng khoa học để xác nhận tính thành công của thử nghiệm MVP:

<div class="card-grid-2">
  <div class="card card-teal">
    <span class="badge badge-teal">BỘ 4 CHỈ SỐ KPI THÀNH CÔNG</span>
    <table>
      <tr>
        <th>Chỉ số (KPI)</th>
        <th>Mục tiêu MVP</th>
        <th>Hệ thống Cũ</th>
      </tr>
      <tr>
        <td><strong>Task Completion Rate</strong></td>
        <td>$\ge \mathbf{85\%}$ (17/20 SV)</td>
        <td>$\approx 50\%$</td>
      </tr>
      <tr>
        <td><strong>Average Time-on-Task</strong></td>
        <td>$\le \mathbf{4.0\text{ phút}}$</td>
        <td>$\approx 15.0\text{ phút}$</td>
      </tr>
      <tr>
        <td><strong>Error Rate (Trùng kíp)</strong></td>
        <td>$\le \mathbf{5\%}$ thao tác</td>
        <td>$\approx 35\%$</td>
      </tr>
      <tr>
        <td><strong>SUS Score (Khả dụng)</strong></td>
        <td>$\ge \mathbf{75/100}$ (Tốt)</td>
        <td>$\approx 48/100$</td>
      </tr>
    </table>
  </div>
  <div class="card card-blue">
    <span class="badge badge-blue">KHẢO SÁT KHẢ DỤNG CHUẨN HÓA (SUS - 10 CÂU HỎI)</span>
    <p>Áp dụng thang đo chuẩn quốc tế của John Brooke (Likert 1-5 điểm):</p>
    <ul>
      <li>5 câu hỏi thuận ($Q_1, Q_3, Q_5, Q_7, Q_9$): Đóng góp = $(Score - 1)$.</li>
      <li>5 câu hỏi nghịch ($Q_2, Q_4, Q_6, Q_8, Q_{10}$): Đóng góp = $(5 - Score)$.</li>
      <li><strong>Công thức tính điểm:</strong><br>
      $\text{SUS} = \left(\sum \text{Điểm đóng góp}\right) \times 2.5 \in [0, 100]$</li>
      <li><strong>Ngưỡng đạt yêu cầu:</strong> $\ge 75$ điểm (Mức Good / Excellent).</li>
    </ul>
  </div>
</div>

---

# [BÀI TH5] Khung Quyết định Điều chỉnh sau Thử nghiệm (Go / Pivot)
Quy tắc hành động kỹ thuật minh bạch dựa trên dữ liệu thu thập thực tế (Slide 44 & 62):

```
+----------------------------------------------------------------------------------------------------+
|                                    GO / PIVOT DECISION MATRIX                                      |
+--------------------------+------------------------------+------------------------------------------+
| Kết quả Thử nghiệm Thực tế| Đánh giá Trạng thái          | Quyết định Kỹ thuật Tiếp theo            |
+--------------------------+------------------------------+------------------------------------------+
| Completion Rate >= 85%   | THÀNH CÔNG RỰC RỠ            | QUYẾT ĐỊNH GO (PERSEVERE):               |
| VÀ SUS Score >= 75       | Giả thuyết H1 được xác nhận.  | Chốt cứng giải pháp, chuyển giao ngay sang|
| VÀ Error Rate <= 5%      | Không còn rủi ro UX lớn.     | pha phân tích Ca sử dụng (TH2 Modeling). |
+--------------------------+------------------------------+------------------------------------------+
| Completion Rate: 70 - 84%| THÀNH CÔNG CÓ ĐIỀU KIỆN      | TINH CHỈNH GIAO DIỆN (OPTIMIZATION):     |
| HOẶC SUS Score: 60 - 74  | SV còn vướng mắc ở thao tác  | Bổ sung Visual Tooltip hướng dẫn; tăng   |
|                          | thả kíp vào ô lịch học.      | kích thước ô kíp và làm rõ cảnh báo màu. |
+--------------------------+------------------------------+------------------------------------------+
| Completion Rate < 70%    | KHÔNG ĐẠT MỤC TIÊU           | QUYẾT ĐỊNH PIVOT (XOAY TRỤC GIẢI PHÁP):   |
| HOẶC SUS Score < 60      | Giao diện kéo-thả gây quá tải| Từ bỏ cơ chế kéo-thả thủ công; chuyển    |
|                          | nhận thức đối với sinh viên. | sang cơ chế gợi ý "Combo kíp học tối ưu" |
|                          |                              | tự động chỉ với 1 click chọn gói môn.    |
+--------------------------+------------------------------+------------------------------------------+
```

---

# Ma trận Phân công 4 Thành viên theo 4 Phân hệ Nghiệp vụ
Chuyên môn hóa 100%: Mỗi thành viên làm chủ trọn vẹn 1 Phân hệ từ Buổi TH1 đến TH5:

<div class="card-grid-4">
  <div class="card card-blue">
    <span class="badge badge-blue">THÀNH VIÊN A: REG</span>
    <p><strong>ĐĂNG KÝ & SINH VIÊN</strong></p>
    <ul>
      <li><strong>TH1:</strong> User Need Sinh viên; Problem Statement đăng ký & giữ chỗ.</li>
      <li><strong>TH2:</strong> Use Case <code>UC-REG-01</code> (Đăng ký học phần), <code>UC-REG-02</code> (Rút môn).</li>
      <li><strong>TH3:</strong> Thực thể <code>Registration</code>, <code>Student</code> & Thẻ CRC.</li>
      <li><strong>TH4:</strong> BCE Sequence Đăng ký học phần & CSDL REG.</li>
      <li><strong>TH5:</strong> Kiến trúc phân tầng REG & API gọi chéo.</li>
    </ul>
  </div>
  <div class="card card-teal">
    <span class="badge badge-teal">THÀNH VIÊN B: GRD</span>
    <p><strong>ĐIỂM & HỌC VỤ</strong></p>
    <ul>
      <li><strong>TH1:</strong> User Need Giảng viên; Friction Points nhập điểm thủ công.</li>
      <li><strong>TH2:</strong> Use Case <code>UC-GRD-01</code> (Nhập điểm), <code>UC-GRD-02</code> (Cảnh báo).</li>
      <li><strong>TH3:</strong> Thực thể <code>Grade</code>, <code>AcademicRecord</code> & Thẻ CRC.</li>
      <li><strong>TH4:</strong> BCE Sequence Nhập điểm, State Machine & CSDL GRD.</li>
      <li><strong>TH5:</strong> Kiến trúc phân tầng GRD & Quality Attributes.</li>
    </ul>
  </div>
  <div class="card card-amber">
    <span class="badge badge-amber">THÀNH VIÊN C: SCH</span>
    <p><strong>LẬP LỊCH & LỚP HỌC PHẦN</strong></p>
    <ul>
      <li><strong>TH1:</strong> User Need PĐT; Tối ưu phòng học & hạn chế hủy lớp.</li>
      <li><strong>TH2:</strong> Use Case <code>UC-SCH-01</code> (Mở lớp học phần, xếp phòng).</li>
      <li><strong>TH3:</strong> Thực thể <code>ClassSection</code>, <code>Room</code>, <code>Slot</code> & Thẻ CRC.</li>
      <li><strong>TH4:</strong> BCE Sequence Xếp phòng, Kiểm tra kíp & CSDL SCH.</li>
      <li><strong>TH5:</strong> Kiến trúc phân tầng SCH & Layer Matrix.</li>
    </ul>
  </div>
  <div class="card card-purple">
    <span class="badge badge-purple">THÀNH VIÊN D: CUR & LEAD</span>
    <p><strong>CHƯƠNG TRÌNH & ĐIỀU PHỐI</strong></p>
    <ul>
      <li><strong>TH1:</strong> Background đào tạo tín chỉ; Tổng hợp Report 5 mục.</li>
      <li><strong>TH2:</strong> Use Case <code>UC-CUR-01</code> (Môn học); Tổng hợp UC Diagram.</li>
      <li><strong>TH3:</strong> Thực thể <code>Course</code>, <code>Prerequisite</code>; Tổng hợp Domain Model.</li>
      <li><strong>TH4:</strong> BCE Sequence Cập nhật CTĐT; Tổng hợp CSDL 3NF.</li>
      <li><strong>TH5:</strong> Kiến trúc CUR; Tổng hợp Architecture Diagram.</li>
    </ul>
  </div>
</div>

---

# Tổng kết Đầu ra Buổi TH1 & Bàn giao sang Buổi TH2
Khép lại trọn vẹn chu trình Khám phá Vấn đề & Sẵn sàng cho Giai đoạn Mô hình hóa Chi tiết:

<div class="card-grid-2">
  <div class="card card-teal">
    <span class="badge badge-teal">5 ĐẦU RA HOÀN CHỈNH BUỔI THỰC HÀNH 1</span>
    <ol>
      <li><strong>TH1:</strong> Danh sách 04 User Needs &amp; 01 Problem Statement chuẩn 5 thành tố.</li>
      <li><strong>TH2:</strong> User Problem Statement Canvas 6 ô bóc tách Alternative Shortcomings.</li>
      <li><strong>TH3:</strong> Cầu nối nhân quả Business Problem &amp; Phân tích căn nguyên 5 Whys.</li>
      <li><strong>TH4:</strong> Lean UX Canvas 8 ô hoàn chỉnh &amp; Ma trận phân loại giả thuyết.</li>
      <li><strong>TH5:</strong> Kế hoạch thử nghiệm MVP Figma, Usability Testing 20 SV &amp; Thang đo SUS.</li>
    </ol>
  </div>
  <div class="card card-blue">
    <span class="badge badge-blue">KẾ HOẠCH BÀN GIAO SANG BUỔI THỰC HÀNH 2</span>
    <p>Chuyển giao các kết quả kiểm chứng thực tế sang pha Phân tích Yêu cầu Kỹ thuật:</p>
    <ul>
      <li><strong>Mô hình hóa Ca sử dụng (Use Case Modeling):</strong> Phân rã Use Case Diagram cho 4 phân hệ CUR, SCH, REG, GRD.</li>
      <li><strong>Quy tắc Nghiệp vụ (10 BRs):</strong> Cài đặt chặt chẽ `BR-01` (Tiên quyết), `BR-02` (Trần tín chỉ), `BR-03` (Trùng kíp).</li>
      <li><strong>Đặc tả Ca sử dụng Trọng tâm:</strong> Viết bản đặc tả chi tiết cho ca sử dụng Đăng ký học phần (`UC-REG-01`).</li>
    </ul>
  </div>
</div>

<div class="highlight-box" style="text-align: center; margin-top: 12px;">
  <strong>HOÀN THÀNH TOÀN DIỆN BUỔI THỰC HÀNH 1 - SẴN SÀNG BẢO VỆ TRƯỚC GIẢNG VIÊN VÀ HỘI ĐỒNG!</strong>
</div>
