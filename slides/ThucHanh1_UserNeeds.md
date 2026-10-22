---
marp: true
theme: default
size: 16:9
paginate: true
header: "IT3120 - Phân tích & Thiết kế Hệ thống | SOICT - ĐHBK Hà Nội"
footer: "Thực hành 1: Problem Statement → User Needs | Đề tài: Hệ thống Quản lý Đào tạo Đại học"
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
    padding: 34px 44px;
    font-size: 16px;
    line-height: 1.45;
  }
  header {
    font-size: 13px;
    color: var(--color-text-muted);
    font-weight: 600;
    border-bottom: 2px solid var(--color-secondary);
    padding-bottom: 4px;
  }
  footer {
    font-size: 11.5px;
    color: var(--color-text-muted);
    border-top: 1px solid #e2e8f0;
    padding-top: 4px;
  }
  h1 {
    color: var(--color-primary);
    font-size: 25px;
    margin-top: 0;
    margin-bottom: 12px;
    border-bottom: none;
  }
  h2 {
    color: var(--color-primary);
    font-size: 19px;
    margin-top: 0;
    margin-bottom: 8px;
  }
  p {
    margin-top: 3px;
    margin-bottom: 6px;
  }
  ul, ol {
    margin-top: 3px;
    margin-bottom: 6px;
    padding-left: 20px;
  }
  li {
    margin-bottom: 3px;
  }
  .card-grid-4 {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 12px;
    margin-top: 8px;
  }
  .card-grid-3 {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 14px;
    margin-top: 8px;
  }
  .card-grid-2 {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 16px;
    margin-top: 8px;
  }
  .card {
    background-color: var(--color-bg-light);
    border: 1px solid var(--color-card-border);
    border-radius: 7px;
    padding: 11px 13px;
    font-size: 14px;
  }
  .card-primary { border-left: 4px solid var(--color-accent); }
  .card-secondary { border-left: 4px solid var(--color-secondary); }
  .card-warning { border-left: 4px solid var(--color-warning); }
  .card-purple { border-left: 4px solid var(--color-purple); }
  .card-title {
    font-weight: 700;
    font-size: 15px;
    color: var(--color-primary);
    margin-bottom: 5px;
  }
  .highlight-box {
    background-color: #f0fdf4;
    border: 1.5px solid #86efac;
    border-radius: 7px;
    padding: 10px 14px;
    margin-top: 8px;
    font-size: 14.5px;
  }
  .hero-box {
    background: linear-gradient(135deg, #f0f9ff 0%, #e0f2fe 100%);
    border: 2px solid #7dd3fc;
    border-radius: 8px;
    padding: 14px 18px;
    margin-top: 10px;
    font-size: 15.5px;
    line-height: 1.55;
    box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05);
  }
  .tag {
    display: inline-block;
    padding: 2px 7px;
    border-radius: 4px;
    font-size: 11.5px;
    font-weight: 700;
    text-transform: uppercase;
  }
  .tag-blue { background-color: #dbeafe; color: #1e40af; }
  .tag-teal { background-color: #ccfbf1; color: #0f766e; }
  .tag-amber { background-color: #fef3c7; color: #92400e; }
  .tag-purple { background-color: #ede9fe; color: #6d28d9; }
  table {
    width: 100%;
    border-collapse: collapse;
    font-size: 13.5px;
    margin-top: 6px;
  }
  th {
    background-color: #0f2b48;
    color: #ffffff;
    padding: 7px 10px;
    text-align: left;
    font-weight: 600;
  }
  td {
    border: 1px solid #cbd5e1;
    padding: 7px 10px;
    vertical-align: top;
  }
  tr:nth-child(even) td {
    background-color: #f8fafc;
  }
---

<!-- _class: lead -->
<!-- _header: "" -->
<!-- _footer: "" -->
<!-- _paginate: false -->

<div style="text-align: center; margin-top: 35px;">
  <span class="tag tag-teal" style="font-size: 12.5px; padding: 4px 12px; letter-spacing: 0.5px;">BÁO CÁO THỰC HÀNH MÔN HỌC IT3120</span>
  <h1 style="font-size: 32px; margin-top: 18px; color: #0f2b48; font-weight: 800; line-height: 1.25;">
    THỰC HÀNH 1: PROBLEM STATEMENT → USER NEEDS
  </h1>
  <p style="font-size: 19px; color: #0d9488; font-weight: 600; margin-top: 8px;">
    Đề tài: Hệ thống Quản lý Đào tạo Đại học theo Học chế Tín chỉ
  </p>
  <div style="width: 80px; height: 3px; background-color: #0d9488; margin: 20px auto;"></div>
  <p style="font-size: 14.5px; color: #475569; max-width: 850px; margin: 0 auto; font-style: italic;">
    "Xác định 04 User Needs cốt lõi đại diện 4 tác nhân, đào sâu 01 Nhu cầu ưu tiên và phát biểu bài toán tổng quát làm kim chỉ nam xuyên suốt dự án."
  </p>
  <div style="margin-top: 35px; font-size: 13.5px; color: #64748b; display: flex; justify-content: center; gap: 35px;">
    <div><strong>Môn học:</strong> Phân tích & Thiết kế Hệ thống (IT3120)</div>
    <div><strong>Đơn vị:</strong> SOICT — ĐHBK Hà Nội</div>
    <div><strong>Quy mô nhóm:</strong> 04 Thành viên (4 Phân hệ)</div>
  </div>
</div>

---

# 1. Bối cảnh Chung & Các Vấn đề Bề mặt (Situation & Problems)

<div class="card" style="margin-bottom: 10px; border-left: 5px solid #0f2b48; font-size: 13.5px;">
  <strong>Bối cảnh thực tế:</strong> Mô hình đào tạo theo <strong>học chế tín chỉ</strong> trao quyền tự chủ lộ trình cho sinh viên. Với quy mô 35.000+ người học và hàng trăm học phần mở đồng thời, việc cá nhân hóa kế hoạch học tập tạo ra áp lực tương tác và đồng bộ dữ liệu khổng lồ giữa 4 chủ thể liên quan.
</div>

<div class="card-grid-4">
  <div class="card card-primary">
    <div class="card-title" style="font-size: 14px;">1. Sinh viên (REG/SCH)</div>
    <ul style="padding-left: 14px; font-size: 12.5px; margin-bottom: 0;">
      <li>Lúng túng lập kế hoạch học tập dài hạn.</li>
      <li>Nghẽn mạng khi mở cổng, lỡ môn tiên quyết.</li>
      <li>Bị động theo dõi tích lũy và học phí.</li>
    </ul>
  </div>
  <div class="card card-warning">
    <div class="card-title" style="font-size: 14px;">2. Giảng viên (GRD/SCH)</div>
    <ul style="padding-left: 14px; font-size: 12.5px; margin-bottom: 0;">
      <li>Quản lý danh sách lớp đa ngành/khóa rời rạc.</li>
      <li>Tính toán điểm thành phần bằng Excel thủ công.</li>
      <li>Áp lực nộp sổ điểm đúng hạn và an toàn.</li>
    </ul>
  </div>
  <div class="card card-secondary">
    <div class="card-title" style="font-size: 14px;">3. Phòng Đào tạo (CUR/SCH)</div>
    <ul style="padding-left: 14px; font-size: 12.5px; margin-bottom: 0;">
      <li>Khối lượng mở lớp biến động liên tục.</li>
      <li>Quá tải tiếp nhận đơn xin mở lớp, hủy lớp.</li>
      <li>Nguy cơ vỡ kế hoạch giảng đường và TKB.</li>
    </ul>
  </div>
  <div class="card card-purple">
    <div class="card-title" style="font-size: 14px;">4. Phòng Tài vụ (REG/FIN)</div>
    <ul style="padding-left: 14px; font-size: 12.5px; margin-bottom: 0;">
      <li>Xác định công nợ học phí theo tín chỉ thực chậm.</li>
      <li>Đối soát sao kê ngân hàng thủ công tốn công.</li>
      <li>Chậm thu hồi ngân sách đào tạo đầu kỳ.</li>
    </ul>
  </div>
</div>

<div class="highlight-box">
  🎯 <strong>Điểm giao thoa cốt lõi (Core Problem):</strong> Các vấn đề rời rạc đều bắt nguồn từ <strong>sự phân tán thông tin và thiếu tính liên thông dữ liệu học vụ theo thời gian thực</strong> giữa 4 chủ thể trong chu trình đào tạo tín chỉ.
</div>

---

# 2. Nhiệm vụ 1 & 2: 04 User Needs, Bối cảnh & Trở ngại

*Phân công 4 thành viên đại diện 4 góc nhìn nghiệp vụ cốt lõi (Chuẩn ĐỘNG TỪ hành động - Slide 8 & 15):*

<table>
  <thead>
    <tr>
      <th style="width: 18%;">Chủ thể & Phân hệ</th>
      <th style="width: 44%;">User Need (Nhu cầu theo ĐỘNG TỪ hành động)</th>
      <th style="width: 38%;">Bối cảnh & Trở ngại thực tế</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><strong>1. Sinh viên</strong><br><span class="tag tag-blue">Thành viên A (REG)</span></td>
      <td><strong>Chủ động lập kế hoạch học tập, chọn lớp và giữ chỗ kịp thời các học phần cốt lõi</strong> theo đúng tiến độ đào tạo mà không bị xung đột lịch học.</td>
      <td>Cổng mở định kỳ với 35.000 SV truy cập cùng lúc; lớp hết chỗ tức thì; hệ thống thiếu cảnh báo tiên quyết và không cho giữ chỗ tạm.</td>
    </tr>
    <tr>
      <td><strong>2. Giảng viên</strong><br><span class="tag tag-amber">Thành viên B (GRD)</span></td>
      <td><strong>Nắm bắt thông tin lớp giảng dạy, ghi nhận và công bố kết quả đánh giá sinh viên</strong> một cách tập trung, tự động hóa tính điểm theo đề cương.</td>
      <td>Sĩ số lớp đông từ nhiều khóa/ngành; công cụ quản lý điểm rời rạc; nhập thủ công dễ sai lệch công thức trọng số hoặc mất kết nối mạng.</td>
    </tr>
    <tr>
      <td><strong>3. Cán bộ Đào tạo</strong><br><span class="tag tag-teal">Thành viên C (CUR/SCH)</span></td>
      <td><strong>Quy hoạch kế hoạch mở lớp, điều phối phòng học và kiểm soát tiến độ học vụ toàn trường</strong> trên một nguồn dữ liệu thống nhất.</td>
      <td>Khối lượng mở lớp biến động lớn; dữ liệu phân tán khiến việc rà soát điều kiện mở lớp và xử lý đơn thư khiếu nại thủ công gây quá tải.</td>
    </tr>
    <tr>
      <td><strong>4. Cán bộ Tài vụ</strong><br><span class="tag tag-purple">Thành viên D (REG/FIN)</span></td>
      <td><strong>Xác định chính xác nghĩa vụ học phí theo số tín chỉ thực và đối soát quyết toán tự động</strong> ngay sau khi đóng cổng đăng ký.</td>
      <td>Biến động rút/hủy môn liên tục đầu kỳ; đối soát sao kê thủ công tốn thời gian; chậm dòng tiền thu hồi kinh phí tái đầu tư đào tạo.</td>
    </tr>
  </tbody>
</table>

<p style="font-size: 13px; color: var(--color-text-muted); margin-top: 6px; font-style: italic;">
  📌 <strong>Quy chuẩn SOICT:</strong> Mỗi thành viên phụ trách 1 User Need mức cao độc lập, tập trung vào mục tiêu con người thay vì tên tính năng phần mềm.
</p>

---

# 3. Nhiệm vụ 3: Bằng chứng Hiện có vs. Giả định Cần kiểm chứng

*Dữ kiện tình huống khách quan phục vụ kiểm chứng thực tế (Slide 15 & 57):*

<div class="card-grid-2">
  <div class="card card-secondary">
    <div class="card-title">📁 Bằng chứng Hiện có (Factual Evidence)</div>
    <p style="font-size: 13px; color: var(--color-text-muted); margin-bottom: 6px;">Dữ kiện xác thực từ quy chế đào tạo tín chỉ:</p>
    <ul>
      <li><strong>Quản lý theo học phần:</strong> Mọi hoạt động đào tạo đều gắn với học phần (tiên quyết, sĩ số trần, số tín chỉ quy định).</li>
      <li><strong>Mối quan hệ nhân quả khép kín:</strong> Kế hoạch mở lớp (PĐT) $\rightarrow$ Đăng ký lớp (SV) $\rightarrow$ Nhập điểm (GV) $\rightarrow$ Thu học phí & xét học vụ (Tài vụ/PĐT).</li>
      <li><strong>Tính pháp lý bắt buộc:</strong> Mọi hoạt động đều phải tuân thủ nghiêm ngặt Quy chế đào tạo đại học chính thức của Nhà trường.</li>
    </ul>
  </div>

  <div class="card card-warning">
    <div class="card-title">❓ Giả định Cần kiểm chứng (Assumptions to Validate)</div>
    <p style="font-size: 13px; color: var(--color-text-muted); margin-bottom: 6px;">Các giả thuyết cần khảo sát người dùng thực tế:</p>
    <ul>
      <li><strong>Giả định 1 (Rào cản SV):</strong> Khó khăn lớn nhất của SV là do <em>"chưa nắm rõ quy chế tiên quyết"</em> hay do <em>"hệ thống mạng nghẽn tắc khi tranh suất"</em>?</li>
      <li><strong>Giả định 2 (Điểm nghẽn GV/PĐT):</strong> Cán bộ tốn nhiều thời gian nhất ở khâu <em>nhập điểm định kỳ</em> hay khâu <em>xử lý đơn từ ngoại lệ/phúc khảo</em>?</li>
      <li><strong>Giả định 3 (Tài chính học vụ):</strong> Sinh viên có nhu cầu biết số học phí tạm tính trước khi đăng ký môn hay chỉ quan tâm sau khi chốt đợt?</li>
    </ul>
  </div>
</div>

---

# 4. Nhiệm vụ 4: Chọn Nhu cầu Ưu tiên để Làm Sâu

*Quyết định chiến lược của nhóm: Chọn 01 Nhu cầu cốt lõi nhất làm tâm điểm xuyên suốt chuỗi TH2 $\to$ TH5:*

<div class="hero-box" style="text-align: center; border-color: #0d9488;">
  <span class="tag tag-blue" style="font-size: 12px; margin-bottom: 6px;">NHU CẦU ƯU TIÊN ĐƯỢC CHỌN ĐÀO SÂU (PRIORITY USER NEED)</span>
  <h2 style="color: #0f2b48; font-size: 20px; margin-top: 6px; margin-bottom: 6px; line-height: 1.35;">
    "Nhu cầu của Sinh viên: Chủ động lập kế hoạch học tập, chọn lớp và giữ chỗ kịp thời các học phần cốt lõi theo đúng tiến độ ra trường."
  </h2>
  <span style="font-size: 13.5px; color: #475569;">(Phân hệ Đăng ký học phần & Thời khóa biểu — Trách nhiệm chính: Thành viên A & Nhóm)</span>
</div>

<div class="card-grid-3" style="margin-top: 10px;">
  <div class="card card-primary">
    <div class="card-title">1. "Tử huyệt" của toàn chuỗi</div>
    <p style="font-size: 13px; margin-bottom: 0;">
      Nếu sinh viên không đăng ký được môn, GV không có lớp dạy, PĐT vỡ kế hoạch phòng, Tài vụ không có nguồn thu học phí.
    </p>
  </div>
  <div class="card card-secondary">
    <div class="card-title">2. Nỗi đau gay gắt nhất</div>
    <p style="font-size: 13px; margin-bottom: 0;">
      Gây ảnh hưởng trực tiếp đến thời gian tốt nghiệp (nguy cơ chậm 1 kỳ), phát sinh chi phí lớn và tâm lý căng thẳng tột độ.
    </p>
  </div>
  <div class="card card-warning">
    <div class="card-title">3. Khả thi để làm MVP Test</div>
    <p style="font-size: 13px; margin-bottom: 0;">
      Rất phù hợp để dựng bản mẫu tương tác Figma (Giỏ môn học Wishlist) làm bài thử nghiệm Usability Test tương tự case của thầy.
    </p>
  </div>
</div>

---

# 5. Nhiệm vụ 5: Phát biểu Bài toán Chung nhất (Problem Statement)

<div class="card" style="margin-bottom: 10px; background-color: #f1f5f9; font-size: 13.5px;">
  <strong>Công thức phát biểu chuẩn hóa (Slide 11):</strong><br>
  <code>[Trong bối cảnh nào]</code> + <code>[Nhóm người dùng nào]</code> + <code>[Cần nhu cầu chung gì]</code> + <code>[Gặp trở ngại gốc rễ nào]</code> + <code>[Hướng tới mục tiêu giá trị gì]</code>
</div>

<div class="hero-box" style="margin-top: 6px;">
  <p style="font-size: 15.5px; line-height: 1.6; margin: 0; color: #0f2b48;">
    "Trong môi trường giáo dục đại học vận hành theo học chế tín chỉ <strong style="color: #0d9488;">(Bối cảnh)</strong>, <strong>sinh viên chính quy</strong> cùng với <strong>giảng viên và cán bộ quản lý</strong> <strong style="color: #2563eb;">(Đối tượng)</strong> cần một phương thức quản lý kế hoạch học tập và đăng ký giữ chỗ học phần xuyên suốt, minh bạch và tức thời <strong style="color: #0d9488;">(Nhu cầu cốt lõi)</strong>, bởi vì đặc thù số lượng sinh viên truy cập cao điểm lớn trong khi thông tin lớp học và điều kiện ràng buộc bị phân tán, gây nghẽn tắc hệ thống và làm quá tải việc xử lý đơn thư thủ công <strong style="color: #c2620e;">(Trở ngại)</strong>, nhằm bảo đảm sinh viên tích lũy đủ học phần đúng hạn ra trường và nâng cao hiệu quả vận hành của Nhà trường <strong style="color: #16a34a;">(Mục tiêu giá trị)</strong>."
  </p>
</div>

<div class="highlight-box" style="margin-top: 10px; font-size: 13.5px; padding: 8px 12px;">
  💡 <strong>Nhận định phương pháp luận:</strong> Phát biểu neo chặt vào nỗi đau của Sinh viên (đăng ký môn), nhưng vẫn giữ độ mở liên thông với công tác quản lý của Nhà trường.
</div>

---

# 6. Phân công Trách nhiệm Song song theo Mô hình Phễu Hội tụ

*Cơ chế làm việc song song 100% giữa 4 thành viên (Không bị nghẽn tiến độ - Zero Waiting):*

<div class="card-grid-2">
  <div class="card card-secondary">
    <div class="card-title">Pha 1: Phân kỳ Song song (TH1 $\to$ TH3)</div>
    <p style="font-size: 13px; color: var(--color-text-muted); margin-bottom: 4px;">4 bạn điền dữ liệu cùng lúc trên 1 tài liệu:</p>
    <ul style="font-size: 12.5px; padding-left: 16px;">
      <li><strong>Thành viên A:</strong> Đảm nhận lát cắt <strong>Sinh viên</strong> (REG/SCH).</li>
      <li><strong>Thành viên B:</strong> Đảm nhận lát cắt <strong>Giảng viên</strong> (GRD/SCH).</li>
      <li><strong>Thành viên C:</strong> Đảm nhận lát cắt <strong>Phòng Đào tạo</strong> (CUR/SCH).</li>
      <li><strong>Thành viên D:</strong> Đảm nhận lát cắt <strong>Phòng Tài vụ</strong> (REG/FIN).</li>
    </ul>
    <p style="font-size: 12px; color: #0d9488; font-weight: 600; margin-top: 4px;">$\to$ Hoàn thành đồng bộ User Needs & Problem Canvas.</p>
  </div>

  <div class="card card-primary">
    <div class="card-title">Pha 2: Hội tụ Chuyên môn cho 01 MVP (TH4 $\to$ TH5)</div>
    <p style="font-size: 13px; color: var(--color-text-muted); margin-bottom: 4px;">Cùng làm sâu duy nhất MVP Đăng ký học phần:</p>
    <ul style="font-size: 12.5px; padding-left: 16px;">
      <li><strong>Thành viên A (UX/UI):</strong> Vẽ 3 màn hình Figma (Wishlist/TKB).</li>
      <li><strong>Thành viên B (User Research):</strong> Soạn kịch bản Usability Test.</li>
      <li><strong>Thành viên C (Data/QA):</strong> Xây dựng bộ chỉ số KPI (Time, SUS).</li>
      <li><strong>Thành viên D (Documenter):</strong> Đóng gói Slide & System Request.</li>
    </ul>
    <p style="font-size: 12px; color: #2563eb; font-weight: 600; margin-top: 4px;">$\to$ Đúng 100% yêu cầu 01 MVP Experiment của thầy.</p>
  </div>
</div>

---

# 7. Tổng kết Đầu ra Bài tập 1 & Lộ trình Tiếp theo

<div class="card-grid-2">
  <div class="card card-secondary">
    <div class="card-title">✅ Các Đầu ra Đạt được trong Bài tập 1</div>
    <ol style="padding-left: 16px; font-size: 13px; margin-bottom: 0;">
      <li><strong>Danh sách 04 User Needs cốt lõi:</strong> Bao quát 4 chủ thể (SV, GV, PĐT, Tài vụ) khớp với 4 thành viên.</li>
      <li><strong>01 Nhu cầu Ưu tiên & Problem Statement:</strong> Đào sâu bài toán đăng ký học phần của sinh viên.</li>
      <li><strong>Bảng Giả định Kiểm chứng & Ma trận phân công:</strong> Phân chia công việc song song rõ ràng.</li>
    </ol>
  </div>

  <div class="card card-primary">
    <div class="card-title">🚀 Lộ trình Triển khai Chuỗi Thực hành tiếp theo</div>
    <ul style="padding-left: 16px; font-size: 13px; margin-bottom: 0;">
      <li><strong>Thực hành 2:</strong> Hoàn thiện 6 ô User Problem Statement Canvas cho nhánh Sinh viên.</li>
      <li><strong>Thực hành 3:</strong> Xây dựng chuỗi nhân quả Business Problem & Operational Impact.</li>
      <li><strong>Thực hành 4 & 5:</strong> Điền 8 ô Lean UX Canvas và lập kế hoạch thử nghiệm MVP trên Figma.</li>
    </ul>
  </div>
</div>

<div style="margin-top: 20px; text-align: center; font-size: 15.5px; color: #0f2b48; font-weight: 700;">
  Cảm ơn Thầy/Cô và các bạn đã chú ý lắng nghe!
</div>
