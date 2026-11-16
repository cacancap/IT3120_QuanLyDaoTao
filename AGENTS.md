# Quy tắc làm việc cho agent — IT3120

## 1. Phạm vi đề tài và nguồn tham chiếu

- **Đối tượng chính** là sinh viên chính quy K52 đủ điều kiện đăng ký bổ sung trong đợt điều chỉnh tại Trường Đại học Bách khoa Hà Nội (HUST), giai đoạn 2007–2008. Quy trình bắt đầu khi sinh viên tra cứu lớp để bổ sung vào lịch hiện có và kết thúc khi biết kết quả hoặc lý do yêu cầu chưa được chấp nhận. Chỉ phân tích một đợt cụ thể khi xác định được học kỳ và mốc thời gian từ nguồn.
- **UN-03** là một nhu cầu duy nhất. Sinh viên hoàn thành nhu cầu khi vừa ghép được lớp bổ sung vào thời khóa biểu hiện có mà không trùng giờ, vừa nhận xác nhận vào lớp còn chỗ. Điều kiện tiên quyết, giới hạn tín chỉ và nghĩa vụ học phí là điều kiện đầu vào.
- Dùng Phòng Đào tạo làm đầu mối kiểm chứng tác động vận hành. Mô tả các vai trò khác tại điểm tiếp xúc có căn cứ hoặc nêu rõ giả định cần xác minh. Phân công bốn thành viên theo đầu ra của nhóm. [Báo cáo vấn đề](bai-tap-1/OOAD_BaoCaoVanDe.md) · [Kế hoạch và phân công](docs/huong-dan-ke-hoach-bai-tap-1.md)
- Đối chiếu yêu cầu của thầy với hướng dẫn của từng Lab. Dùng báo cáo vấn đề và kế hoạch nhóm để xác định phạm vi, thuật ngữ và quy ước của đề tài. Ghi rõ căn cứ khi một tiêu chí do nhóm chọn, chẳng hạn Problem Canvas tám ô và các ngưỡng thử nghiệm MVP. [Lab 01](docs/Lab01_OOAD.md) · [Lab 02](docs/Lab02_OOAD.md) · [Lab 03](docs/Lab03_OOAD.md)

## 2. Giải thích khái niệm môn học

Áp dụng khi hướng dẫn, trả lời câu hỏi hoặc nhận xét tài liệu. Nhóm gồm sinh viên mới học phân tích và thiết kế hướng đối tượng (OOAD).

- Khi giới thiệu thuật ngữ hoặc chữ viết tắt lần đầu, nêu tên chuẩn, giải thích ngắn bằng tiếng Việt dễ hiểu và nói rõ khái niệm trả lời câu hỏi gì, dùng ở đầu ra nào.
- Khi cần minh họa, dùng một tình huống ngắn từ UN-03. Trong Lab 02, **AS-IS** là mô hình quy trình đang được nghiên cứu, chẳng hạn cách sinh viên K52 tra cứu lớp, gửi yêu cầu và biết kết quả. **TO-BE** là mô hình quy trình đề xuất, chẳng hạn cho sinh viên kiểm tra phương án thay thế trước khi gửi lại yêu cầu. Đánh dấu ví dụ minh họa và gắn `[Assumption]` cho bước lịch sử chưa xác minh.
- Giải thích các khái niệm dễ nhầm qua cùng một tình huống. Ví dụ minh họa cho Lab 02 gồm **Business Requirement (BR)** là kết quả nghiệp vụ cần đạt, như giảm lượt đăng ký phải làm lại do trùng lịch. **Functional Requirement (FR)** nêu hành vi hệ thống phải đáp ứng, như cảnh báo khi lớp chọn trùng lịch. **Use Case** mô tả cách sinh viên tương tác với hệ thống để hoàn thành mục tiêu gửi yêu cầu bổ sung. **System Function** mô tả phần việc hệ thống thực hiện trong luồng đó, như kiểm tra xung đột thời khóa biểu.
- Khi hướng dẫn lập bảng hoặc sơ đồ, chỉ rõ **đầu vào cần đọc, việc cần làm và cách tự kiểm tra kết quả**. Giữ thuật ngữ và mã truy vết trong hồ sơ nộp để nhóm đối chiếu với slide. Điều chỉnh độ sâu theo câu hỏi và kiến thức đã giới thiệu.

## 3. Quy tắc phân tích và bằng chứng

- Phát biểu vấn đề theo mục tiêu người dùng, rào cản và tác động có thể đo. Trình bày phương án giải quyết trong Lean UX hoặc TO-BE.
- Gắn `[Evidence]` trong đúng phạm vi nguồn chứng minh, kèm thời điểm và điều khoản hoặc đoạn liên quan. Phân biệt quy chế ban hành năm 2007, bản bổ sung tháng 7/2008, hồ sơ vận hành cùng đợt, lời kể hồi cứu và tư liệu năm 2026. Với đợt trước bản bổ sung, xác minh văn bản áp dụng tại thời điểm đó.
- Gắn `[Assumption]` cho từng bước hoặc mắt xích lịch sử chưa xác minh, kể cả trong chuỗi *hết chỗ → chọn lại → rà soát lại → chậm chốt danh sách*. Ghi **chưa đo được** cho chỉ số thiếu dữ liệu và **không xác định** cho ca thiếu căn cứ phân loại.
- Trình bày hồ sơ bằng Markdown, bảng và sơ đồ. Lab 01 có thể dùng nguyên mẫu tương tác để thử nghiệm. Lab 02–03 dùng UML (ngôn ngữ mô hình hóa thống nhất) và đặc tả theo đề bài. Lab 03 mô tả kiểu dữ liệu và chữ ký phương thức ở mức thiết kế. Giữ sản phẩm ở mức mô hình, đặc tả và nguyên mẫu phục vụ thử nghiệm.

## 4. Đầu ra và kiểm tra theo Lab

### Lab 01 — Khám phá vấn đề

- Bám UN-03 trong User Problem Statement và Problem Canvas tám ô theo quy ước nhóm.
- Viết Business Problem đủ năm phần gồm bối cảnh, hiện trạng, vấn đề, tác động và trạng thái mong muốn. Kiểm tra chuỗi bốn cấp từ vấn đề của sinh viên, tác động vận hành, vấn đề của Phòng Đào tạo đến kết quả mong muốn.
- Hoàn thiện Lean UX Canvas tám ô. Viết giả thuyết H1 theo mẫu *“Chúng tôi tin rằng [Business Outcome] sẽ đạt được nếu [đối tượng người dùng] đạt được [User Outcome] nhờ vào [phương án giải quyết].”*
- Kiểm tra nguyên mẫu khả thi tối thiểu (MVP) và kế hoạch thử nghiệm. Với tình huống còn lớp thay thế, chấm hoàn thành UN-03 khi đạt đồng thời hai điều kiện. Với tình huống không còn lớp phù hợp, chấm khả năng hiểu trạng thái và xác định bước tiếp theo. Ghi rõ ngưỡng đề xuất và kết quả mô phỏng.
- Kiểm tra System Request theo mẫu 11 mục và Problem Discovery Report năm phần kèm câu hỏi phản biện.

### Lab 02 — Quy trình, yêu cầu và chức năng

- Kế thừa phạm vi, UN-03, Business Problem và bảng nguồn. Mô tả việc người dùng cần hoàn thành (Jobs-to-be-Done, JTBD), các bên liên quan và tác nhân tương tác với hệ thống.
- Gắn từng điểm nghẽn (Pain Point) với bước AS-IS và giải thích thay đổi tương ứng trong TO-BE. Kiểm tra ranh giới hệ thống, danh mục BR, yêu cầu chức năng và phi chức năng (FR/NFR), danh sách Use Case và sơ đồ Use Case UML.
- Kiểm tra cây phân rã có tối thiểu 10 System Functions và danh mục chức năng có mã, mục đích. Đối chiếu các mã trong ma trận truy vết từ BR qua yêu cầu hệ thống, Use Case đến chức năng.

### Lab 03 — Phân tích miền và thiết kế lớp

- Kế thừa BR, System Functions và luồng chọn để thiết kế. Đối chiếu khái niệm miền, lớp phân tích (Analysis Class) và sơ đồ đối tượng (Object Diagram) với chức năng.
- Kiểm tra sáu tài liệu nộp gồm danh sách lớp thiết kế và lý do chuyển đổi, bảng lớp–trách nhiệm–cộng tác (CRC), đặc tả thuộc tính và phương thức, sơ đồ lớp thiết kế UML, bảng cộng tác lớp, bảng tự đánh giá thiết kế.
- Bảng cộng tác cần có luồng chính và tối thiểu hai luồng ngoại lệ. Bảng tự đánh giá cần ít nhất ba vấn đề, cách điều chỉnh và lý do kỹ thuật. Đối chiếu trách nhiệm lớp và thông điệp cộng tác với luồng và phương thức tương ứng.

## 5. Phối hợp giữa các Lab

- Bắt đầu AS-IS nháp khi phạm vi và vấn đề đã rõ, kể cả khi MVP đang hoàn thiện. Gắn nhãn cho những bước còn chờ bằng chứng.
- Phác từ điển miền khi thuật ngữ và phạm vi ổn định. Chốt Lab 02 sau khi đối chiếu yêu cầu, Use Case và chức năng. Chốt thiết kế lớp của Lab 03 sau khi đối chiếu BR, chức năng và luồng tương ứng.
