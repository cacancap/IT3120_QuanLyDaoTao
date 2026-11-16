# Lab 02 — Thực hành 2: Mô hình hóa yêu cầu

Bước 1 kế thừa nhu cầu **UN-03**, bốn điểm nghẽn `PP-01`–`PP-04` và quy trình đề xuất `TO-01`–`TO-06`. Các bước vận hành và điểm nghẽn lịch sử chưa xác minh vẫn mang nhãn `[Assumption]`. Hướng dẫn HUST năm 2026 là căn cứ cho quy trình đề xuất. [Báo cáo Lab 01](../lab-01/OOAD_BaoCaoVanDe.md) · [Mô hình nghiệp vụ](01-MoHinhNghiepVu.md) · [Hướng dẫn Thực hành 2](../docs/Lab02_OOAD.md#nhiệm-vụ-thực-hành-2-requirement-modeling)

## 1. Phạm vi và ranh giới hệ thống

**Ranh giới hệ thống** xác định phần việc hệ thống hỗ trợ và phần việc do người dùng hoặc quy trình khác đảm nhiệm. Ca nghiên cứu tập trung vào sinh viên chính quy K52 có quyền tham gia đợt điều chỉnh tại HUST giai đoạn 2007–2008. Luồng bắt đầu khi sinh viên tra cứu lớp để ghép vào lịch hiện có và kết thúc khi họ biết lớp đã được xác nhận hoặc dừng khi chưa bổ sung được lớp, kể cả khi dừng trước lúc gửi vì chưa tìm được lớp để chọn.

| Trong phạm vi | Trách nhiệm và bước tương ứng |
| --- | --- |
| Tra cứu lớp mở và lịch học | Hệ thống cung cấp danh sách lớp và lịch. Sinh viên tra cứu để tìm mã lớp phù hợp (`TO-01`). |
| Chọn lớp và kiểm tra lựa chọn | Sinh viên chọn mã lớp. Hệ thống đối chiếu với lịch hiện có và kiểm tra các điều kiện áp dụng cho lựa chọn, chẳng hạn điều kiện tiên quyết hoặc giới hạn tín chỉ (`TO-02`). Nếu phát hiện trùng lịch hoặc chưa đủ điều kiện, hệ thống chỉ thông báo lý do (`TO-06`). |
| Gửi đăng ký | Sinh viên rà soát và gửi đăng ký bổ sung (`TO-03`). |
| Xem kết quả từng lớp | Hệ thống hiển thị kết quả khi sinh viên tra cứu (`TO-04`). Kết quả **Thành công** cho biết lớp đã được xác nhận (`TO-05`). Khi thấy **Hết chỗ**, sinh viên tự quay về `TO-01` nếu đợt còn mở và muốn điều chỉnh. |

**Ngoài phạm vi** gồm đăng ký đợt chính, mở thêm lớp hoặc tăng sức chứa, xử lý công nợ, quản lý quy chế học vụ và gợi ý lớp thay thế.

**Đầu vào và trách nhiệm.** Ca nghiên cứu giả định quyền tham gia đợt điều chỉnh của sinh viên đã được xác lập, bao gồm tình trạng nghĩa vụ học phí theo quy định áp dụng. Ở `TO-02`, hệ thống dùng lịch hiện có, danh sách lớp mở và các quy tắc đã thiết lập để kiểm tra lựa chọn cụ thể. Ví dụ, sinh viên có quyền tham gia đợt vẫn có thể thiếu điều kiện tiên quyết của học phần vừa chọn. Sinh viên K52 trực tiếp tương tác với hệ thống. Phòng Đào tạo là bên liên quan để kiểm chứng tác động vận hành. Danh sách tác nhân ở bước sau chỉ đưa cán bộ vào khi xác định được tương tác cụ thể trong phạm vi trên.

## 2. Danh mục yêu cầu nghiệp vụ

**Business Requirement (BR)** mô tả kết quả nghiệp vụ cần đạt. Ví dụ, giảm tỷ lệ yêu cầu phải sửa do trùng lịch là kết quả của **BR1**. Cảnh báo trùng lịch là hành vi hệ thống hỗ trợ kết quả đó, được đặc tả ở bước yêu cầu chức năng.

| Mã | Kết quả nghiệp vụ mong muốn | Căn cứ từ Thực hành 1 | Chỉ số kiểm chứng đề xuất |
| --- | --- | --- | --- |
| BR1 | Giảm tỷ lệ yêu cầu bổ sung đã gửi phải sửa hoặc gửi lại do trùng lịch. | `PP-01` → `TO-01`, `TO-02`, `TO-06` | Số yêu cầu đã gửi phải sửa hoặc gửi lại do trùng lịch chia cho tổng số yêu cầu bổ sung đã gửi trong đợt. Ghi riêng số lần phát hiện trùng lịch ở bước chọn lớp để đánh giá cảnh báo trước khi gửi. |
| BR2 | Tăng khả năng sinh viên biết kết quả từng lớp để chủ động điều chỉnh trước khi đợt đóng. | `PP-02`, `PP-03` → `TO-03`, `TO-04`, `TO-05` và vòng về `TO-01` | Số lượt đăng ký lớp mà sinh viên xác định đúng trạng thái trước hạn chia cho tổng số lượt đăng ký lớp được theo dõi. Yêu cầu gồm ba lớp đóng góp ba lượt. Với lớp hết chỗ, đo thêm thời gian từ lúc gửi đến lúc sinh viên biết kết quả. |
| BR3 | `[Assumption]` Giảm số lượt cán bộ phải rà soát lại vì lựa chọn trùng lịch hoặc chưa đủ điều kiện. | `PP-04` → `TO-02`, `TO-06` | Xác minh cán bộ có thực hiện lượt rà soát lại vì hai nguyên nhân trên hay không. Nếu có, ghi số lượt và số phút xử lý phát sinh. |
| BR4 | Tăng tỷ lệ sinh viên hoàn tất đăng ký bổ sung trước hạn với lịch không trùng và lớp còn chỗ được xác nhận, khi có phương án phù hợp. | `UN-03`, `PP-01`–`PP-03` → `TO-01`–`TO-05` | Số sinh viên đạt cả hai điều kiện trước hạn chia cho số sinh viên được theo dõi có nhu cầu bổ sung và có phương án phù hợp trong thời gian được đăng ký. Chỉ đưa vào mẫu số khi có căn cứ rằng phương án đúng học phần, đủ điều kiện, không trùng lịch và còn chỗ. Ghi riêng các ca không có phương án và các ca chưa xác định được. |

Với `PP-03`, kết quả **Hết chỗ** cho sinh viên biết tình trạng của lớp đã chọn để tự quyết định tra cứu tiếp hay dừng. Việc tăng sức chứa thuộc quy trình mở lớp. Các số đo hiện trạng **chưa đo được**. Đặt mục tiêu định lượng sau khi có dữ liệu.

### Đối chiếu tình huống trước khi đặc tả yêu cầu chức năng

| Tình huống | Kết quả đối chiếu với mô hình nghiệp vụ |
| --- | --- |
| Chưa tìm được lớp để chọn | Sinh viên dừng ở `TO-01` trước khi gửi yêu cầu. |
| Trùng lịch hoặc thiếu điều kiện trước khi gửi | Sinh viên đã có quyền tham gia đợt. `TO-02` phát hiện lựa chọn trùng lịch hoặc chưa đủ điều kiện cho học phần cụ thể. `TO-06` thông báo lý do. Sinh viên tự quyết định có quay lại tra cứu qua `TO-01` trong thời gian còn mở hay không. |
| Hết chỗ sau khi gửi | `TO-04` hiển thị **Hết chỗ**. Sinh viên có thể tự tra cứu lại nếu đợt còn mở. Nếu chưa tìm được lớp phù hợp, sinh viên vẫn chưa bổ sung được lớp. |
| Đăng ký thành công | `TO-05` cho sinh viên biết lớp đã được xác nhận. Khi đo **BR4**, chỉ tính hoàn thành **UN-03** nếu trước hạn sinh viên có lịch không trùng và lớp còn chỗ đã được xác nhận. |

## 3. Yêu cầu hệ thống

**Yêu cầu chức năng (Functional Requirement, FR)** nêu hành vi hệ thống phải thực hiện. **Yêu cầu phi chức năng (Non-functional Requirement, NFR)** nêu chất lượng cần đạt khi thực hiện hành vi đó. Cột kiểm tra mô tả cách xác định yêu cầu đã được đáp ứng trong một tình huống cụ thể.

### 3.1. Yêu cầu chức năng

| Mã | Hành vi hệ thống | Bước TO-BE | Tiêu chí kiểm tra |
| --- | --- | --- | --- |
| FR01 | Cho sinh viên tra cứu danh sách lớp mở trong đợt và lịch học theo từng mã lớp. | `TO-01` | Với danh mục lớp mở đã biết, sinh viên tìm được mã lớp và đọc đúng lịch của lớp đó. Nếu chưa tìm được lớp phù hợp, sinh viên có thể dừng ở bước tra cứu. |
| FR02 | Cho sinh viên chọn mã lớp và kiểm tra trùng lịch, điều kiện tiên quyết và giới hạn tín chỉ theo quy tắc đã thiết lập. Kiểm tra lịch của lựa chọn với lịch hiện có và các lớp khác trong cùng lựa chọn. | `TO-02` | Kiểm tra riêng phương án hợp lệ, phương án trùng lịch, phương án thiếu điều kiện tiên quyết và phương án vượt giới hạn tín chỉ. Hệ thống xác định đúng trường hợp hợp lệ và điều kiện bị vi phạm trong các trường hợp còn lại. |
| FR03 | Thông báo lý do khi lựa chọn trùng lịch hoặc chưa đủ điều kiện, trước khi sinh viên gửi đăng ký. | `TO-06` | Với mỗi lựa chọn không hợp lệ ở FR02, thông báo nêu đúng lý do. Sinh viên có thể tự quay về tra cứu để chọn lại khi đợt còn mở. |
| FR04 | Cho sinh viên rà soát mã lớp đã chọn và gửi lựa chọn hợp lệ trong thời gian đợt điều chỉnh còn mở. | `TO-03` | Phương án hợp lệ gửi được khi đợt còn mở. Phương án còn vi phạm điều kiện hoặc thao tác gửi sau khi đợt đóng không tạo yêu cầu bổ sung mới. Việc gửi được ghi nhận riêng với kết quả xác nhận lớp. |
| FR05 | Ghi nhận kết quả đăng ký theo từng lớp. Chỉ xác nhận **Thành công** nếu lớp đáp ứng điều kiện đăng ký, lịch không trùng và lớp còn chỗ tại thời điểm xác nhận. Nếu việc xác nhận bị từ chối vì lớp đã đầy, ghi nhận **Hết chỗ** cho lớp đó. | `TO-04`, `TO-05` | Gửi một yêu cầu có hai lớp hợp lệ ở bước chọn. Nếu tại thời điểm xác nhận cả hai lớp vẫn hợp lệ về lịch và điều kiện nhưng chỉ một lớp còn chỗ, lớp còn chỗ có kết quả **Thành công** và lớp đã đầy có kết quả **Hết chỗ**. |
| FR06 | Khi sinh viên tra cứu, hiển thị kết quả của từng lớp theo mã lớp, bao gồm **Thành công** và **Hết chỗ** khi đã có kết quả tương ứng. | `TO-04`, `TO-05` | Sinh viên tra cứu và thấy đúng kết quả của từng lớp trong cùng yêu cầu. Khi yêu cầu mới được gửi và chưa có kết quả xác nhận, thông tin hiển thị thể hiện rõ lớp chưa được xác nhận. |

### 3.2. Yêu cầu phi chức năng

| Mã | Thuộc tính chất lượng | Bước TO-BE | Tiêu chí kiểm tra đề xuất và cơ sở |
| --- | --- | --- | --- |
| NFR01 | **Khả năng sử dụng.** Sinh viên phân biệt được việc yêu cầu đã gửi với việc từng lớp đã được xác nhận. | `TO-03`–`TO-05` | Trong một lượt thử có nhiều lớp với kết quả khác nhau, yêu cầu người tham gia giải thích từng trạng thái. Một lượt đạt khi họ chỉ đúng lớp đã xác nhận, lớp hết chỗ và phân biệt được thông báo đã gửi với xác nhận chỗ. Tiêu chí phục vụ BR2 và kế thừa cách kiểm tra mức độ hiểu kết quả trong Lab 01. |
| NFR02 | **Tính nhất quán.** Kết quả sinh viên nhìn thấy khớp với kết quả đã ghi nhận cho từng lớp tại thời điểm tra cứu. | `TO-04`, `TO-05` | Đối chiếu từng mã lớp và kết quả hiển thị với dữ liệu kết quả của cùng yêu cầu. Mỗi lớp trong bộ tình huống phải khớp. Dùng yêu cầu có cả lớp **Thành công** và lớp **Hết chỗ** để kiểm tra nguy cơ nhầm lẫn giữa các lớp. Tiêu chí phục vụ việc theo dõi kết quả của BR2 và xác định hoàn thành UN-03 của BR4. |

Các tiêu chí trên dùng để kiểm tra bản đặc tả và chuẩn bị thử nghiệm. Ngưỡng hiệu năng cần được xác lập khi có dữ liệu về tải và thời gian xử lý. [Kế hoạch và tiêu chí thử nghiệm Lab 01](../lab-01/OOAD_BaoCaoVanDe.md)

## 4. Bên liên quan, tác nhân và Use Case

**Bên liên quan (Stakeholder)** là người hoặc đơn vị có liên quan hay chịu ảnh hưởng. **Tác nhân (Actor)** là vai trò trực tiếp tương tác với hệ thống. **Use Case** mô tả tương tác để tác nhân đạt một mục tiêu, chẳng hạn gửi được đăng ký bổ sung.

| Bên liên quan | Phân loại | Tác nhân và vai trò trong phạm vi |
| --- | --- | --- |
| Sinh viên K52 | Sử dụng trực tiếp | Tác nhân chính **Sinh viên K52**, thực hiện tra cứu, gửi đăng ký và xem kết quả. |
| Phòng Đào tạo | Hỗ trợ nghiệp vụ và chịu tác động vận hành | Đầu mối xác minh có phát sinh lượt rà soát lại và công sức xử lý hay không. Hồ sơ hiện tại chưa xác định tương tác trực tiếp của Phòng Đào tạo với hệ thống trong luồng đã chọn. |

| Mã | Use Case | Tác nhân | Yêu cầu liên quan |
| --- | --- | --- | --- |
| UC01 | Tra cứu lớp mở | Sinh viên K52 | `FR01` |
| UC02 | Gửi đăng ký bổ sung | Sinh viên K52 | `FR02`, `FR03`, `FR04`, `FR05`, `NFR01`, `NFR02` |
| UC03 | Xem kết quả đăng ký | Sinh viên K52 | `FR05`, `FR06`, `NFR01`, `NFR02` |

### UC01 — Tra cứu lớp mở

- **Bắt đầu** khi sinh viên có quyền tham gia đợt và cần tìm lớp để ghép vào lịch hiện có.
- **Luồng chính.** Sinh viên tra cứu danh mục. Hệ thống hiển thị mã lớp và lịch học. Sinh viên tìm được lớp để cân nhắc chọn.
- **Ngoại lệ.** Nếu chưa tìm được lớp phù hợp, sinh viên có thể dừng ở bước tra cứu, trước khi gửi yêu cầu.

### UC02 — Gửi đăng ký bổ sung

- **Bắt đầu** khi đợt còn mở và sinh viên đã tìm được mã lớp muốn chọn.
- **Luồng chính.** Sinh viên chọn mã lớp. Hệ thống kiểm tra lịch và điều kiện áp dụng. Sinh viên rà soát phương án hợp lệ rồi gửi. Hệ thống ghi nhận việc gửi và ghi kết quả riêng theo từng lớp khi xử lý xác nhận.
- **Ngoại lệ.** Khi phát hiện trùng lịch hoặc thiếu điều kiện, hệ thống chỉ thông báo lý do theo `TO-06`. Sinh viên có thể tự quay về tra cứu để chọn lại khi đợt còn mở. Nếu đợt đóng trước lúc gửi, thao tác không tạo yêu cầu mới.

### UC03 — Xem kết quả đăng ký

- **Bắt đầu** khi sinh viên đã gửi đăng ký và muốn kiểm tra kết quả.
- **Luồng chính.** Sinh viên tra cứu. Hệ thống hiển thị kết quả theo từng lớp. Sinh viên nhận biết lớp đã được xác nhận dựa trên kết quả **Thành công**.
- **Ngoại lệ.** Nếu chưa có kết quả xác nhận, sinh viên biết lớp chưa được xác nhận. Nếu kết quả là **Hết chỗ**, sinh viên có thể tự quay về UC01 khi đợt còn mở và muốn điều chỉnh. Sinh viên có thể dừng khi chưa tìm được lớp phù hợp hoặc khi hết hạn.

Sơ đồ Use Case dùng UML (ngôn ngữ mô hình hóa thống nhất) để thể hiện mục tiêu tương tác của sinh viên với hệ thống. Đường nối giữa tác nhân và Use Case biểu thị sự tham gia của tác nhân. Thứ tự và các nhánh của quy trình được ghi trong mô tả luồng ở trên. [Sơ đồ Use Case PlantUML](../diagrams/03-reg/lab02-dang-ky-bo-sung-use-case.puml)

## 5. Ma trận truy vết

Ma trận nối yêu cầu nghiệp vụ với yêu cầu hệ thống và Use Case. Đọc từ trái sang phải để thấy hệ thống hỗ trợ từng mục tiêu ở đâu. Đọc ngược từ Use Case để kiểm tra mỗi tương tác phục vụ yêu cầu nào.

| Yêu cầu nghiệp vụ | Yêu cầu hệ thống | Use Case | Lý do liên kết |
| --- | --- | --- | --- |
| BR1 | `FR01` | `UC01` | Lịch của lớp mở giúp sinh viên đối chiếu trước khi chọn. |
| BR1 | `FR02`, `FR03`, `FR04` | `UC02` | Kiểm tra, báo trùng lịch và chỉ gửi lựa chọn hợp lệ giúp hạn chế yêu cầu phải sửa. |
| BR2 | `FR05`, `FR06`, `NFR01`, `NFR02` | `UC03` | Sinh viên đọc và hiểu kết quả của từng lớp để cân nhắc điều chỉnh. |
| BR2 | `NFR01`, `NFR02` | `UC02` | Mốc đã gửi được thể hiện riêng với kết quả xác nhận của từng lớp. |
| BR3 | `FR02`, `FR03` | `UC02` | Kiểm tra trước khi gửi hỗ trợ mục tiêu giảm công rà soát. Mức giảm là `[Assumption]` cần xác minh với Phòng Đào tạo. |
| BR4 | `FR01` | `UC01` | Sinh viên có thông tin lớp và lịch để tìm phương án phù hợp. |
| BR4 | `FR02`, `FR03`, `FR04`, `FR05` | `UC02` | Phương án phải hợp lệ về lịch và điều kiện. Việc xác nhận còn phụ thuộc vào chỗ của từng lớp. |
| BR4 | `FR05`, `FR06`, `NFR02` | `UC03` | Kết quả ghi nhận và hiển thị giúp xác định lớp nào đã được xác nhận trước hạn. UN-03 đạt khi lịch không trùng và lớp còn chỗ đã được xác nhận. |
