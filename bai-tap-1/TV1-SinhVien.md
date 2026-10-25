# **Sinh Viên**

**1. Tình huống**

- **Bối cảnh:**   
  - Học viện Bách Nghệ Hà Nội (HBA) — cơ sở giáo dục đại học kỹ thuật ứng dụng quy mô lớn (~35.000 sinh viên, ~1.500 giảng viên) — vừa chính thức chuyển đổi mô hình đào tạo từ Niên chế sang Học chế Tín chỉ.   
  - Sinh viên buộc phải thay đổi hoàn toàn thói quen học tập: từ thế bị động (cố định lớp sinh hoạt, nhà trường xếp sẵn 100% thời khóa biểu, đóng học phí trọn gói cố định) sang thế chủ động hoàn toàn (tự chọn môn theo cây tiên quyết, tự xếp lịch cá nhân, học phí tính theo số tín chỉ thực học).   
  - Đặc thù đào tạo kỹ thuật ứng dụng đòi hỏi sinh viên không chỉ học lý thuyết trên giảng đường lớn mà còn phải ghép lịch thực hành xưởng, thí nghiệm (chia ca nhỏ) không bị trùng lặp.   
  - Trong giai đoạn đầu chuyển đổi, dữ liệu chương trình đào tạo, trạng thái chỉ tiêu lớp học phần và định mức học phí từng tín chỉ chưa được cung cấp trực quan, khiến hàng chục nghìn sinh viên lúng túng mỗi đợt đầu và cuối học kỳ. 

**2. User Need**

| User Need | Mức độ xác minh |
| ----- | ----- |
| Xác định chính xác các học phần được phép học trong kỳ tới dựa trên kết quả tích lũy và điều kiện ràng buộc của cây tiên quyết (môn tiên quyết, môn học trước, môn song hành). | **Đã có bằng chứng nghiên cứu** *(HBA vừa chuyển từ Niên chế sang Tín chỉ phụ thuộc cây tiên quyết; khảo sát cho thấy 78.3% sinh viên từng nhầm lẫn điều kiện môn học khi phải tự đọc quy chế PDF dài hàng trăm trang).* |
| Lựa chọn và sắp xếp đồng bộ lịch học Lý thuyết kèm ca Thực hành xưởng/Thí nghiệm có khung giờ phù hợp, không bị trùng lặp hoặc lệch cơ sở học tập. | **Có dấu hiệu hỗ trợ** *(Đặc thù trường kỹ thuật ứng dụng có tỷ lệ giờ xưởng cao chia theo nhóm nhỏ 15–20 SV; ghi nhận nhiều phản ánh của sinh viên về việc chọn được lớp lý thuyết nhưng hết ca thực hành phù hợp).* |
| Nắm bắt tình trạng chỗ trống của các lớp học phần và hoàn tất xác nhận đăng ký nhanh chóng trong đợt mở cổng tập trung mà không phải thao tác lặp lại nhiều lần. | **Đã có bằng chứng nghiên cứu** *(Khoảng 35.000 sinh viên cùng tự xếp lịch đầu kỳ gây cạnh tranh chỉ tiêu cục bộ; hơn 1.500 đơn thư hỗ trợ học vụ gửi về trong 10 ngày đầu kỳ do sinh viên bị vỡ kế hoạch đăng ký).* |
| Theo dõi thời khóa biểu cá nhân biến động theo từng tuần học (lịch lý thuyết, lịch xưởng, lịch thi) và nắm bắt kịp thời các thông báo thay đổi phòng học hoặc lịch học bù. | **Có dấu hiệu hỗ trợ** *(Khi bỏ lớp sinh hoạt cố định của Niên chế, sinh viên học ghép từ nhiều khóa khác nhau và không còn Ban cán sự lớp đứng ra thông báo lịch học thay đổi tập trung như trước).* |
| Biết chính xác số tiền học phí phải đóng tương ứng với tổng số tín chỉ lý thuyết, thực hành đã đăng ký và xác nhận hoàn tất nghĩa vụ tài chính đúng hạn. | **Đã có bằng chứng nghiên cứu** *(Bối cảnh chuyển từ thu trọn gói sang tính theo tín chỉ; ghi nhận 35% thắc mắc tại bộ phận Tài vụ xuất phát từ việc chậm cập nhật số tiền học phí sau khi sinh viên điều chỉnh thêm/rút lớp).* |
| Tra cứu điểm thành phần, đối chiếu tiến độ tích lũy tín chỉ (GPA/CPA, giới hạn cảnh báo học vụ) và rà soát các điều kiện còn thiếu để xét tốt nghiệp. | **Chưa xác minh – giả định ban đầu (cần khảo sát thêm nhóm SV khóa giao thời)** *(Đã ghi nhận việc công bố kết quả học vụ trễ 2 tuần vào cuối kỳ; cần phỏng vấn thêm sinh viên các khóa chuyển tiếp từ Niên chế sang Tín chỉ về mức độ khó khăn khi tự quy đổi học phần tương đương).* |

## **3. User Problem Statement**

**3.1. User Need 1**

- **User Need***:* Xác định chính xác các học phần được phép học trong kỳ tới dựa trên kết quả tích lũy và điều kiện ràng buộc của cây tiên quyết (môn tiên quyết, môn học trước, môn song hành).  
- **Context***:* Khi sinh viên lập kế hoạch học tập cá nhân trước mỗi đợt đăng ký học phần đầu kỳ trong bối cảnh trường vừa chuyển từ Niên chế sang Tín chỉ.  
- **Barrier***:* Sinh viên quen với việc được nhà trường xếp sẵn lịch trong mô hình Niên chế cũ, trong khi thông tin về cây tiên quyết và điều kiện ràng buộc môn học hiện chỉ được mô tả trên các văn bản quy chế tĩnh dài hàng trăm trang, rất khó tra cứu và đối chiếu với lịch sử điểm cá nhân.  
- **Consequence***:* 78.3% sinh viên từng nhầm lẫn điều kiện môn học, dẫn đến việc chọn sai học phần, bị hủy kết quả đăng ký hoặc chậm tiến độ ra trường do vướng môn tiên quyết.  
- **User problem statement**:  
  "Sinh viên tại Học viện Bách Nghệ Hà Nội (HBA) gặp khó khăn khi tự xác định các học phần đủ điều kiện đăng ký cho học kỳ tiếp theo, vì sau khi chuyển từ niên chế sang tín chỉ, thông tin về cây tiên quyết đang nằm rời rạc trên các văn bản quy chế dài và không gắn kết với lịch sử điểm cá nhân, dẫn đến việc 78.3% sinh viên từng nhầm lẫn điều kiện môn học và có nguy cơ chậm tiến độ tốt nghiệp." 

**3.2. User Need 2**

- **User Need***:* Lựa chọn và sắp xếp đồng bộ lịch học Lý thuyết kèm ca Thực hành xưởng/Thí nghiệm có khung giờ phù hợp, không bị trùng lặp hoặc lệch cơ sở học tập.  
- **Context***:* Giai đoạn sinh viên tự thiết lập thời khóa biểu cá nhân cho các môn kỹ thuật ứng dụng vào đầu mỗi học kỳ.  
- **Barrier***:* Một học phần kỹ thuật thường tách rời giữa lớp lý thuyết quy mô lớn và nhiều tổ thực hành xưởng/phòng thí nghiệm quy mô nhỏ với khung giờ và tuần học khác nhau, buộc sinh viên phải tự rà soát thủ công để ghép cặp không trùng giờ.  
- **Consequence***:* Sinh viên mất nhiều giờ đồng hồ để tự đối chiếu lịch trống, dễ xảy ra tình trạng đăng ký được lớp lý thuyết nhưng thiếu ca thực hành hoặc bị xung đột thời gian di chuyển giữa các xưởng.  
- **User problem statement:**  
  "Sinh viên kỹ thuật tại Học viện Bách Nghệ Hà Nội (HBA) gặp khó khăn khi tự sắp xếp thời khóa biểu đồng bộ giữa giờ học lý thuyết và ca thực hành xưởng vào đầu mỗi học kỳ, vì lịch mở lớp của các tổ thực hành chia nhỏ theo ca kíp phức tạp và đòi hỏi người học phải tự đối chiếu chéo thủ công, dẫn đến việc tốn nhiều thời gian ghép lịch và dễ bị nợ phần thực hành do trùng khung giờ học." 

**3.3. User Need 3**

- **User Need**: Nắm bắt tình trạng chỗ trống của các lớp học phần và hoàn tất xác nhận đăng ký nhanh chóng trong đợt mở cổng tập trung mà không phải thao tác lặp lại nhiều lần.  
- **Context**: Trong khung giờ cao điểm mở đăng ký học phần tập trung cho khoảng 35.000 sinh viên toàn Học viện.  
- **Barrier**: Lượng sinh viên truy cập chọn lớp cùng lúc rất lớn trong khi số lượng lớp mở ở một số môn chưa sát nhu cầu thực tế, làm thông tin chỉ tiêu lớp biến động liên tục và phản hồi trạng thái đăng ký bị chậm trễ.  
- **Consequence**: Sinh viên bị lỡ các lớp học phần bắt buộc trong kế hoạch, gây tâm lý hoang mang và phát sinh hơn 1.500 đơn thư xin hỗ trợ đăng ký bổ sung hoặc mở thêm lớp trong 10 ngày đầu kỳ.  
- **User problem statement:**  
  "Sinh viên tại Học viện Bách Nghệ Hà Nội (HBA) gặp khó khăn khi cạnh tranh chỉ tiêu và xác nhận kết quả đăng ký lớp học phần trong các đợt mở cổng tập trung cho 35.000 người học, vì thông tin chỗ trống của lớp học thay đổi quá nhanh và thiếu phản hồi tức thời khi quá tải cục bộ, dẫn đến việc bị vỡ kế hoạch học tập dự kiến và phải làm đơn xin điều chỉnh thủ công mất trung bình 5 ngày chờ đợi." 

### **3.4. User Need 4**

- **User Need**: Theo dõi thời khóa biểu cá nhân biến động theo từng tuần học (lịch lý thuyết, lịch xưởng, lịch thi) và nắm bắt kịp thời các thông báo thay đổi phòng học hoặc lịch học bù.  
- **Context**: Trong suốt quá trình học tập hàng tuần tại các tòa giảng đường và xưởng thực hành của Học viện.  
- **Barrier**: Khi xóa bỏ lớp sinh hoạt cố định của Niên chế, mỗi sinh viên có một lịch trình riêng biệt phân mảnh theo từng tuần (tuần học lý thuyết, tuần xuống xưởng) và không còn kênh thông báo tập trung qua lớp trưởng như trước.  
- **Consequence**: Sinh viên dễ bị nhầm phòng học, quên ca thực hành xưởng hoặc bỏ lỡ các buổi học bù/lịch thi do không cập nhật kịp thời thông tin điều chỉnh từ giảng viên và Phòng Đào tạo.  
- **User problem statement:**  
  "Sinh viên tại Học viện Bách Nghệ Hà Nội (HBA) gặp khó khăn khi theo dõi lịch trình học tập cá nhân và cập nhật các thông báo thay đổi phòng học hoặc lịch học bù trong suốt học kỳ, vì thời khóa biểu tín chỉ ngành kỹ thuật biến động liên tục theo từng tuần thực hành xưởng và không còn đầu mối lớp niên chế cố định để nhắc nhở, dẫn đến nguy cơ đi nhầm ca học và ảnh hưởng trực tiếp đến điểm chuyên cần." 

### **3.5. User need 5**

- **User Need***:* Biết chính xác số tiền học phí phải đóng tương ứng với tổng số tín chỉ lý thuyết, thực hành đã đăng ký và xác nhận hoàn tất nghĩa vụ tài chính đúng hạn.  
- **Context***:* Ngay khi lựa chọn thêm/bớt môn học ở đầu kỳ và trong đợt thu nộp học phí chính thức của Học viện.  
- **Barrier***:* Cách tính học phí mới phụ thuộc vào số tín chỉ thực tế đăng ký kèm hệ số chênh lệch giữa giờ lý thuyết và thực hành xưởng, nhưng dữ liệu biến động học phần chưa được quy đổi thành số tiền tức thời khi sinh viên điều chỉnh lịch học.  
- **Consequence***:* Sinh viên bị động trong việc chuẩn bị tài chính, dẫn tới 35% thắc mắc tại bộ phận Tài vụ liên quan đến sai lệch thông tin công nợ và lo ngại bị hủy môn học hoặc cấm thi.  
- **User problem statement**:  
  "Sinh viên tại Học viện Bách Nghệ Hà Nội (HBA) gặp khó khăn khi tự ước tính mức học phí phải nộp và đối chiếu trạng thái công nợ sau khi chuyển sang học chế tín chỉ, vì đơn giá tín chỉ khác nhau giữa lý thuyết với thực hành và thông tin học phí chưa được cập nhật tức thời sau các lần thêm hoặc rút môn, dẫn đến sự bị động về tài chính gia đình và làm phát sinh 35% lượng thắc mắc về công nợ mỗi kỳ." 

### **3.6. User need 6**

- **User Need***:* Tra cứu điểm thành phần, đối chiếu tiến độ tích lũy tín chỉ (GPA/CPA, giới hạn cảnh báo học vụ) và rà soát các điều kiện còn thiếu để xét tốt nghiệp.  
- **Context***:* Giai đoạn cuối mỗi học kỳ khi cần đánh giá kết quả học tập để quyết định học cải thiện điểm hoặc chuẩn bị hồ sơ xét tốt nghiệp.  
- **Barrier***:* Quá trình nộp điểm và tổng hợp kết quả học vụ cuối kỳ hiện còn chậm trễ (kéo dài tới 2 tuần), đồng thời sinh viên thiếu công cụ đối chiếu tự động giữa các môn đã tích lũy với khung chương trình đào tạo mới quy đổi.  
- **Consequence***:* Sinh viên biết điểm và mức cảnh báo học vụ muộn ngay sát kỳ đăng ký tiếp theo, gây khó khăn cho việc điều chỉnh số tín chỉ được phép học và dễ bỏ sót các điều kiện bắt buộc để ra trường đúng hạn.  
- **User problem statement:**  
  "Sinh viên tại Học viện Bách Nghệ Hà Nội (HBA) gặp khó khăn khi theo dõi tiến độ tích lũy tín chỉ, kiểm tra mức cảnh báo học vụ và rà soát điều kiện tốt nghiệp vào cuối mỗi học kỳ, vì dữ liệu điểm tổng kết thường công bố chậm tới 2 tuần và việc tự đối chiếu các học phần đã học với chuẩn đầu ra khá phức tạp, dẫn đến việc chậm trễ điều chỉnh kế hoạch học cải thiện và bị động khi xét tốt nghiệp."

## **4. Giả định cần kiểm chứng (Assumptions to Validate)**

- **Về mặt nhận thức lộ trình:** Sinh viên chuyển từ Niên chế sang thực sự gặp khó khăn khi tự đọc văn bản quy chế và thường xuyên xác định sai các môn đủ điều kiện học (tiên quyết, học trước, song hành).
- **Về mặt thao tác xếp lịch:** Việc tự đối chiếu và ghép lịch giữa lớp lý thuyết tập trung với các ca thực hành xưởng/phòng thí nghiệm chia nhóm nhỏ tiêu tốn nhiều thời gian và dễ dẫn đến xung đột giờ học.
- **Về mặt mong muốn tự chủ:** Đa số sinh viên thực sự muốn tự mình lựa chọn môn học, giảng viên và khung giờ cá nhân hóa thay vì để nhà trường xếp lịch cố định hoặc nhờ Cố vấn học tập quyết định hộ.
- **Về mặt rào cản tài chính:** Sự thay đổi từ thu học phí trọn gói sang tính tiền theo từng tín chỉ (kèm hệ số khác nhau giữa lý thuyết và thực hành) gây tâm lý bối rối và ảnh hưởng trực tiếp đến quyết định chọn hay rút môn của sinh viên.

## **5. User problem statement canvas**

### **5.1. User problem statement canvas 1**

| CONTEXT | PROBLEM | ALTERNATIVES |
|---|---|---|
| *Khi sinh viên lập kế hoạch học tập cá nhân trước mỗi đợt đăng ký học phần đầu kỳ, trong bối cảnh trường chuyển từ niên chế sang tín chỉ.* | *Không nắm rõ và khó tra cứu mối quan hệ ràng buộc giữa các môn học (tiên quyết, học trước, song hành), do thông tin hiện nằm rải rác trên các văn bản/sổ tay PDF tĩnh dài hàng trăm trang và mã môn học giữa 2 chế độ bị thay đổi* | *Tự tải file PDF quy chế về, dùng lệnh Ctrl+F để tra từng mã môn thủ công hoặc Đi hỏi anh/chị khóa trên hoặc nhờ cậy bạn bè trong nhóm chat.* |
| **CUSTOMERS** | **EMOTIONAL IMPACT** | **ALTERNATIVE SHORTCOMINGS** |
| *Sinh viên năm 2–4, những người không còn được nhà trường sắp xếp thời khóa biểu như năm nhất.* | *Cảm thấy hoang mang và mông lung vì có nguy cơ bỏ lỡ các học phần tiên quyết, dẫn đến chậm tiến độ tốt nghiệp.* | *File PDF quá dài, dễ bỏ sót môn tiên quyết ẩn hoặc môn đã đổi mã tương đương, Lời khuyên từ khóa trên mang tính chủ quan, không khớp với quy chế chuyển đổi mới của trường.* |

### **5.2. User problem statement canvas 2**

| CONTEXT (Bối cảnh xảy ra) | PROBLEM / ROOT CAUSE (Vấn đề cốt lõi) | ALTERNATIVES (Cách SV tự xoay sở hiện tại) |
| :--- | :--- | :--- |
| Giai đoạn sinh viên tự lập thời khóa biểu cá nhân trước và trong đợt mở đăng ký học phần đầu mỗi kỳ học kỹ thuật. | Lịch học lý thuyết tập trung và các ca thực hành xưởng/phòng thí nghiệm bị tách rời, chia thành nhiều kíp nhỏ (15–20 SV/nhóm) với lịch học so le theo tuần, đòi hỏi phải tự đối chiếu chéo thủ công. | • Tự lập bảng Excel hoặc vẽ ma trận lịch học ra giấy để thử ghép từng ca thực hành với lớp lý thuyết.<br>• Chấp nhận đăng ký lớp lý thuyết trước, rồi "canh me" tìm ca xưởng còn trống sau.<br>• Nhờ bạn bè cùng ngành tìm và đăng ký chung cùng một ca xưởng. |
| **CUSTOMERS (Đối tượng chịu tác động)** | **EMOTIONAL IMPACT (Tác động cảm xúc)** | **ALTERNATIVE SHORTCOMINGS (Hạn chế của cách cũ)** |
| Sinh viên các ngành kỹ thuật ứng dụng tại HBA (Cơ khí, Điện - Điện tử, CNTT, Hóa học, Công nghệ Vật liệu...). | Ức chế, mệt mỏi và kiệt sức vì mất nhiều công sức ghép lịch nhưng vẫn bị xung đột; lo lắng bị nợ phần xưởng khiến không hoàn thành được môn học. | • Mất hàng giờ thử - sai trên giấy/Excel nhưng khi vào đăng ký thật thì ca xưởng dự kiến đã bị người khác chọn mất.<br>• Dễ bị lệch ca hoặc không đủ thời gian di chuyển giữa các tòa giảng đường và xưởng thực hành.<br>• Có nguy cơ đăng ký được lý thuyết nhưng không vào được ca xưởng nào, dẫn đến việc bị hủy cả học phần. |

### **5.3. User problem statement canvas 3**

| CONTEXT (Bối cảnh xảy ra) | PROBLEM / ROOT CAUSE (Vấn đề cốt lõi) | ALTERNATIVES (Cách SV tự xoay sở hiện tại) |
| :--- | :--- | :--- |
| Khung giờ cao điểm mở cổng đăng ký học phần trực tuyến tập trung cho toàn bộ ~35.000 sinh viên HBA vào đầu học kỳ. | Số lượng sinh viên truy cập đồng thời quá lớn trong khi chỉ tiêu một số lớp học phần mở chưa sát nhu cầu thực tế; trạng thái chỗ trống biến động từng giây và thiếu cơ chế phản hồi hàng đợi minh bạch. | • Tụ tập tại các quán net có đường truyền mạng tốc độ cao để "săn slot".<br>• Mở nhiều tab trình duyệt, liên tục bấm phím F5 / tải lại trang để giành chỗ.<br>• Viết đơn giấy gửi lên Văn phòng Khoa/Phòng Đào tạo xin mở thêm lớp hoặc xin nhập học phần sau khi cổng đóng. |
| **CUSTOMERS (Đối tượng chịu tác động)** | **EMOTIONAL IMPACT (Tác động cảm xúc)** | **ALTERNATIVE SHORTCOMINGS (Hạn chế của cách cũ)** |
| Toàn bộ sinh viên hệ chính quy tại HBA, đặc biệt là sinh viên năm 3, năm 4 cần hoàn thành các môn học phần bắt buộc để kịp tiến độ tốt nghiệp. | Cực kỳ hoang mang, hoảng loạn và ức chế tột độ khi màn hình bị đơ/trắng; cảm thấy bất công khi bản thân chuẩn bị kỹ nhưng vẫn bị trượt lớp do yếu tố hạ tầng mạng. | • Việc F5 liên tục càng làm nghẽn băng thông hệ thống, dẫn đến sập phiên đăng ký.<br>• Phải viết đơn xin mở lớp thủ công mất nhiều thời gian đi lại, xếp hàng nộp đơn và tỷ lệ được chấp thuận phụ thuộc vào may rủi.<br>• Bị động trong việc sắp xếp công việc làm thêm hoặc kế hoạch sinh hoạt cá nhân. |

### **5.4. User problem canvas 4**

| CONTEXT (Bối cảnh xảy ra) | PROBLEM / ROOT CAUSE (Vấn đề cốt lõi) | ALTERNATIVES (Cách SV tự xoay sở hiện tại) |
| :--- | :--- | :--- |
| Diễn ra xuyên suốt học kỳ (15–20 tuần học) tại các giảng đường, phòng thí nghiệm và xưởng kỹ thuật của HBA. | Xóa bỏ lớp sinh hoạt cố định của Niên chế khiến các lớp học phần gồm sinh viên ghép từ nhiều ngành/khóa; lịch xưởng biến động theo tuần; thông tin đổi phòng/báo nghỉ từ giảng viên thiếu kênh truyền tải tức thời và tập trung. | • Tự chụp ảnh màn hình lịch học lưu vào thư viện ảnh điện thoại hoặc chép tay ra sổ.<br>• Lập các nhóm Zalo/Messenger tự phát cho từng lớp môn học để sinh viên tự hỏi han, nhắc nhở nhau.<br>• Phải đến tận cửa phòng học hoặc bảng tin Khoa để xem thông báo dán giấy khi thấy phòng học đóng cửa. |
| **CUSTOMERS (Đối tượng chịu tác động)** | **EMOTIONAL IMPACT (Tác động cảm xúc)** | **ALTERNATIVE SHORTCOMINGS (Hạn chế của cách cũ)** |
| Sinh viên toàn trường, đặc biệt là sinh viên năm nhất và năm hai mới chuyển đổi sang môi trường học tín chỉ chưa quen việc tự quản lý lịch trình cá nhân. | Hoang mang, bực bội vì mất công di chuyển xa đến trường nhưng giảng viên báo nghỉ; xấu hổ và lo sợ bị trừ điểm chuyên cần do đi nhầm kíp/phòng học. | • Ảnh chụp màn hình chỉ là dữ liệu tĩnh, không tự cập nhật khi giảng viên đổi phòng hoặc đổi lịch học bù.<br>• Nhóm chat tự phát thường xuyên bị trôi tin nhắn quan trọng bởi các tin trò chuyện rác.<br>• Thông báo dán tại cửa phòng thường quá muộn, khiến sinh viên mất thời gian và công sức đi lại. |

### **5.5. User problem statement canvas 5**

| CONTEXT (Bối cảnh xảy ra) | PROBLEM / ROOT CAUSE (Vấn đề cốt lõi) | ALTERNATIVES (Cách SV tự xoay sở hiện tại) |
| :--- | :--- | :--- |
| Thời điểm sinh viên cân nhắc số môn đăng ký ở đầu kỳ và giai đoạn cao điểm thu nộp học phí trước các đợt thi giữa kỳ/cuối kỳ. | Chuyển từ mức đóng trọn gói cố định sang tính tiền theo từng tín chỉ (với hệ số chênh lệch giữa tín chỉ lý thuyết và thực hành/thí nghiệm kỹ thuật); học phí biến động sau mỗi lần thêm/rút môn nhưng thông tin nợ phí không được cập nhật tức thời. | • Tự lấy sổ tay tra đơn giá từng loại tín chỉ rồi bấm máy tính cầm tay để nhẩm tính tổng số tiền.<br>• Đợi nhà trường ra thông báo công nợ chính thức trên cổng thông tin rồi mới đi vay mượn hoặc xin gia đình.<br>• Trực tiếp lên Phòng Tài vụ xếp hàng để hỏi rõ lý do tại sao số tiền học phí khác với dự tính ban đầu. |
| **CUSTOMERS (Đối tượng chịu tác động)** | **EMOTIONAL IMPACT (Tác động cảm xúc)** | **ALTERNATIVE SHORTCOMINGS (Hạn chế của cách cũ)** |
| Toàn bộ sinh viên HBA và gia đình của họ (đặc biệt là các bạn sinh viên có hoàn cảnh kinh tế khó khăn, phải tự đi làm thêm trang trải học phí). | Bất an, lo lắng vì số tiền học phí thực tế vượt quá ngân sách dự kiến của gia đình; bức xúc và căng thẳng tột độ khi bị thông báo cấm thi hoặc khóa tài khoản do nợ học phí phát sinh ngoài ý muốn. | • Tự tính bằng tay rất dễ sai sót do không nắm rõ hệ số học phần (ví dụ: xưởng thực hành nhân hệ số 1.2 – 1.5).<br>• Biết số tiền quá muộn khiến sinh viên không kịp xoay xở tài chính trong thời hạn quy định.<br>• Phòng Tài vụ luôn trong tình trạng quá tải người xếp hàng hỏi đáp, giải quyết chậm trễ. |

### **5.6. User problem canvas 6**

| CONTEXT (Bối cảnh xảy ra) | PROBLEM / ROOT CAUSE (Vấn đề cốt lõi) | ALTERNATIVES (Cách SV tự xoay sở hiện tại) |
| :--- | :--- | :--- |
| Giai đoạn cuối mỗi học kỳ (khi chuẩn bị đăng ký môn cho kỳ tiếp theo) và các đợt rà soát hồ sơ tốt nghiệp hàng năm. | Dữ liệu điểm tổng kết (GPA/CPA) công bố chậm (thường trễ 2 tuần); việc quy đổi học phần giữa Niên chế cũ và Tín chỉ mới phức tạp; thiếu công cụ tự động đối soát các điều kiện tích lũy so với chuẩn đầu ra của ngành. | • Tự lập file Excel cá nhân, gõ từng đầu điểm và tự viết công thức tính điểm trung bình tích lũy hệ 4.<br>• In bảng điểm giấy đem đến nhờ Cố vấn học tập hoặc Văn phòng Viện/Khoa rà soát hộ xem còn thiếu môn gì.<br>• Đợi danh sách cảnh báo học vụ được dán công khai trên bảng tin của trường. |
| **CUSTOMERS (Đối tượng chịu tác động)** | **EMOTIONAL IMPACT (Tác động cảm xúc)** | **ALTERNATIVE SHORTCOMINGS (Hạn chế của cách cũ)** |
| Sinh viên từ năm 2 trở đi, đặc biệt là nhóm sinh viên các khóa chuyển tiếp (giao thời giữa 2 mô hình đào tạo) và sinh viên năm cuối chuẩn bị ra trường. | Hoang mang vì không biết chính xác mình đang ở mức cảnh báo học vụ nào; thất vọng và suy sụp khi phát hiện bị thiếu 1–2 tín chỉ tự chọn hoặc chứng chỉ điều kiện ngay sát ngày xét tốt nghiệp. | • Tự tính Excel dễ sai lệch so với công thức làm tròn và cách tính điểm trọng số của Phòng Đào tạo.<br>• Phải xếp hàng xin gặp cán bộ Khoa/Viện trong giờ hành chính, gây mất thời gian cho cả hai bên.<br>• Nhận thông báo cảnh báo học vụ quá trễ khiến sinh viên không kịp điều chỉnh số lượng tín chỉ tối đa được phép học ở kỳ kế tiếp. |

## **6. Business problem**

### **Đăng ký sai môn tiên quyết**
* **User Problem:** Sinh viên gặp khó khăn khi tra cứu môn tiên quyết trên tài liệu PDF tĩnh, dẫn đến chọn sai môn học
* **Operational Impact:** Cán bộ Phòng Đào tạo mất nhiều thời gian rà soát hồ sơ thủ công và xử lý các đơn xin đổi/hủy môn
* **Business Problem:** Quy trình kiểm soát điều kiện học phần thủ công gây quá tải bộ máy vận hành đầu kỳ.
* **Desired Outcome:** Giảm thời gian rà soát học vụ và giảm tỷ lệ sinh viên đăng ký sai môn.

---

### **Trùng lịch thực hành và lệch pha mở lớp**
* **User Problem:** Sinh viên mất nhiều thời gian tự ghép lịch lý thuyết và thực hành xưởng, dễ bị trùng ca hoặc thiếu chỗ.
* **Operational Impact:** Nhà trường mở lớp dựa trên ước tính chủ quan; nhiều lớp quá tải trong khi lớp khác phải hủy sát giờ
* **Business Problem:** Kế hoạch phân bổ phòng học và xưởng thực hành thiếu dữ liệu dự báo, gây lãng phí cơ sở vật chất.
* **Desired Outcome:** Giảm tỷ lệ lớp bị hủy vì thiếu sĩ số và nâng cao tỷ lệ lấp đầy phòng học/xưởng.

---

### **Chậm cập nhật học phí tín chỉ**
* **User Problem:** Sinh viên không nắm rõ số tiền học phí theo từng tín chỉ đã đăng ký và gặp phiền hà khi tra cứu công nợ.
* **Operational Impact:** Phòng Tài vụ và Phòng Đào tạo phải đối soát thủ công giữa số tín chỉ thực học với số tiền nộp qua ngân hàng
* **Business Problem:** Quy trình đối soát học phí chậm trễ làm ách tắc việc xác nhận điều kiện thi cuối kỳ.
* **Desired Outcome:** Rút ngắn thời gian đối soát công nợ và giảm các thắc mắc về học phí.


## **7. LeanUX canvas**

| **1. Business Problem (Vấn đề kinh doanh & vận hành)** | **5. Solution ideas (Ý tưởng giải pháp)** | **2. Business Outcomes (Kết quả kinh doanh/vận hành mong muốn)** |
| :--- | :--- | :--- |
| Khi chuyển từ Niên chế sang Tín chỉ tại HBA (~35.000 SV, ~1.500 GV):<br>• **Vấn đề 1:** Quy trình kiểm soát điều kiện học phần (tiên quyết, song hành) và xử lý ngoại lệ thủ công gây quá tải bộ máy vận hành đầu kỳ (hơn 1.500 đơn thư xử lý mất trung bình 5 ngày).<br>• **Vấn đề 2:** Kế hoạch phân bổ phòng học và xưởng thực hành thiếu dữ liệu dự báo sớm, dẫn đến lệch pha cung - cầu (12% lớp hủy vì thiếu sĩ số, trong khi nhiều lớp kỹ thuật quá tải).<br>• **Vấn đề 3:** Quy trình đối soát học phí tín chỉ thủ công giữa Phòng Đào tạo và Phòng Tài vụ chậm trễ, phát sinh nhiều thắc mắc và ách tắc điều kiện thi cuối kỳ. | • **Giải pháp 1:** Hiển thị trực quan trạng thái môn học (Đủ điều kiện / Chưa đủ điều kiện) và tự động chặn đăng ký nếu vi phạm quy tắc tiên quyết/song hành.<br>• **Giải pháp 2:** Công cụ gợi ý và kiểm tra xung đột thời khóa biểu đồng bộ giữa lớp Lý thuyết và ca Thực hành xưởng theo thời gian thực.<br>• **Giải pháp 3:** Tính năng khảo sát/đăng ký nguyện vọng học phần sớm trước kỳ học để hỗ trợ Phòng Đào tạo lập kế hoạch mở lớp sát nhu cầu.<br>• **Giải pháp 4:** Tích hợp hiển thị học phí tạm tính theo số tín chỉ đã chọn kèm cổng đối soát gạch nợ tự động qua mã VietQR. | • Giảm hơn **70%** số lượng đơn thư hỗ trợ học vụ phát sinh trong 10 ngày đầu kỳ.<br>• Rút ngắn thời gian xử lý các trường hợp ngoại lệ từ **5 ngày xuống dưới 24 giờ**.<br>• Giảm tỷ lệ lớp học phần bị hủy phút chót do thiếu sĩ số từ **12% xuống dưới 3%**.<br>• Nâng tỷ lệ sử dụng công suất phòng học/xưởng thực hành đạt **trên 85%**.<br>• Giảm **trên 80%** khiếu nại liên quan đến sai lệch công nợ học phí; gạch nợ học phí tự động tức thời. |
| **3. Users and customers (Người dùng & Các bên liên quan)** | *(Tiếp nối ô 5. Solution ideas)* | **4. User Benefits (Kết quả & Lợi ích của người dùng)** |
| • **Sinh viên HBA:** Toàn bộ ~35.000 sinh viên cần tra cứu lộ trình, tự xếp thời khóa biểu (lý thuyết & xưởng), đăng ký lớp và theo dõi học phí.<br>• **Cán bộ Phòng Đào tạo:** Tiếp nhận, rà soát quy chế, điều phối lịch giảng đường/xưởng và xử lý ngoại lệ.<br>• **Cán bộ Phòng Tài vụ:** Quản lý định mức thu, theo dõi công nợ học phí theo tín chỉ và xác nhận quyền thi.<br>• **Giáo viên:** Điểm danh, quản lý điểm thi của lớp. | *(Các giải pháp ở ô số 5 phía trên kết nối trực tiếp với nhóm người dùng ở ô số 3 và lợi ích ở ô số 4)* | • **Đối với Sinh viên:**<br>  - Dễ dàng biết chính xác các môn mình đủ điều kiện học mà không sợ nhầm điều kiện tiên quyết.<br>  - Tự xếp được lịch học lý thuyết và ca xưởng thực hành không bị trùng giờ một cách thuận tiện.<br>  - Nhận kết quả xác nhận đăng ký và mức học phí phải nộp rõ ràng, tức thời.<br>• **Đối với Cán bộ:**<br>  - Giảm thao tác tra cứu, rà soát hồ sơ và bảng điểm thủ công.<br>  - Giảm áp lực trực tiếp tiếp nhận và giải quyết khiếu nại sự vụ đầu và cuối kỳ.<br>• **Đối với Giáo viên:**<br>  - Giảm áp lực tính điểm thi bằng tay cho từng em sinh viên trên từng đầu điểm.<br>  - Dễ dàng nhập điểm vào hệ thống sau khi tính toán xong điểm. |
| **6. Hypotheses (Giả thuyết kiểm chứng)** | **7. What's the most important things we need to learn first? (Điều quan trọng nhất cần học trước)** | **8. What's the least amount of work we need to do to learn the next most important thing? (MVP & Experiments)** |
| • **Giả thuyết 1 (Kiểm soát tiên quyết):** *Chúng tôi tin rằng* việc giảm 70% đơn thư học vụ và giảm tỷ lệ đăng ký sai môn *sẽ đạt được* nếu *sinh viên HBA* có thể dễ dàng nhận biết các môn đủ điều kiện học *với* tính năng trực quan hóa cây tiên quyết và tự động kiểm tra ràng buộc khi chọn môn.<br>• **Giả thuyết 2 (Cân bằng mở lớp & ghép xưởng):** *Chúng tôi tin rằng* tỷ lệ hủy lớp giảm xuống dưới 3% và giảm xung đột lịch học *sẽ đạt được* nếu *sinh viên kỹ thuật* ghép được ca xưởng phù hợp và *nhà trường* biết trước nhu cầu *với* tính năng đăng ký nguyện vọng sớm kèm bộ lọc ghép cặp Lý thuyết - Thực hành.<br>• **Giả thuyết 3 (Đối soát học phí):** *Chúng tôi tin rằng* việc giảm 80% khiếu nại tài vụ và rút ngắn thời gian quyết toán công nợ *sẽ đạt được* nếu *sinh viên* nắm rõ nghĩa vụ tài chính tức thời *với* tính năng hiển thị học phí tự động theo tín chỉ tích hợp cổng gạch nợ số. | • Sinh viên có thực sự hiểu và tin tưởng vào các cảnh báo điều kiện tiên quyết tự động không?<br>• Việc mở đăng ký nguyện vọng sớm có thực sự thu hút sinh viên tham gia đủ đông để làm dữ liệu dự báo mở lớp chuẩn xác không?<br>• Sinh viên có gặp khó khăn khi thao tác ghép lớp lý thuyết với ca xưởng thực hành trên một giao diện thống nhất không?<br>• Cán bộ Phòng Đào tạo có sẵn sàng phân quyền cho hệ thống tự động từ chối các vi phạm thay vì duyệt tay từng đơn không? | • **Mục tiêu thử nghiệm:** Kiểm chứng liệu giải pháp trực quan hóa điều kiện môn học và hỗ trợ tự ghép lịch lý thuyết - xưởng có giúp sinh viên đăng ký thuận tiện, không bị sai sót và giảm đơn thư khiếu nại hay không.<br>• **MVP đề xuất:** Một nguyên mẫu tương tác (Interactive Clickable Prototype) mô phỏng luồng:<br>  1. Xem danh sách môn học đề xuất (có gắn nhãn Đủ/Chưa đủ điều kiện tiên quyết).<br>  2. Chọn thử 1 lớp lý thuyết và hệ thống tự động lọc ra các ca xưởng không trùng lịch.<br>  3. Màn hình giỏ môn học hiển thị tạm tính học phí và bấm xác nhận đăng ký thử nghiệm.<br>• **Cách thức thử nghiệm:**<br>  - Mời một nhóm 20–30 sinh viên từ các ngành kỹ thuật (Cơ khí, Điện, CNTT) tham gia bài kiểm thử định hướng (Usability Testing).<br>  - Giao nhiệm vụ lập thời khóa biểu cho 5 môn học (gồm 3 môn có ca thực hành xưởng).<br>  - Quan sát và đo lường: Tỷ lệ hoàn thành nhiệm vụ đăng ký đúng quy chế; Thời gian thực hiện tác vụ (mục tiêu: < 10 phút); Số lần phát sinh nhầm lẫn hoặc cần trợ giúp. |

## **8. MVP và Experiment Plan (Kế hoạch Thử nghiệm & Kiểm chứng)**

*(Được xây dựng bám sát cấu trúc Thực hành 5 và Đáp án bài 5 trong slide bài giảng: kiểm chứng giả định rủi ro nhất thông qua nguyên mẫu tối thiểu trước khi quyết định đầu tư xây dựng hệ thống phần mềm hoàn chỉnh).*

---

### **8.1. Mục tiêu thử nghiệm (Experiment Objective)**

* **Mục tiêu cốt lõi:** Kiểm tra xem liệu việc hiển thị trực quan điều kiện tiên quyết và cơ chế tự động ràng buộc ca thực hành xưởng theo lớp lý thuyết có thực sự giúp sinh viên Học viện Bách Nghệ Hà Nội (HBA) tự xếp lịch thuận tiện, không chọn sai môn và giảm thiểu xung đột thời khóa biểu hay không.
* **Câu hỏi cần trả lời (What We Need to Learn):**
  1. Sinh viên có dễ dàng nhận biết và hiểu lý do một môn học bị khóa điều kiện tiên quyết trên giao diện không?
  2. Sinh viên có thể tự ghép cặp giữa lớp lý thuyết và ca xưởng thực hành mà không bị trùng lịch trong thời gian ngắn không?
  3. Mức độ tự tin và tỷ lệ hoàn thành nhiệm vụ của sinh viên khi tự lập lịch học cá nhân trên nguyên mẫu đạt bao nhiêu?

---

### **8.2. Giả thuyết rủi ro cao nhất cần kiểm chứng (Riskiest Hypothesis)**

> **Giả thuyết H1:**  
> *"Chúng tôi tin rằng việc giảm 70% đơn thư học vụ và giảm tỷ lệ đăng ký sai môn sẽ đạt được nếu sinh viên HBA có thể dễ dàng nhận biết các môn đủ điều kiện học và tự ghép ca xưởng phù hợp với tính năng trực quan hóa cây tiên quyết kèm bộ lọc ràng buộc Lý thuyết – Thực hành."*

* **Rủi ro lớn nhất nếu giả định này sai:** Nếu sinh viên vẫn không hiểu quy tắc hiển thị hoặc thấy cơ chế gợi ý ca xưởng quá phức tạp, họ vẫn sẽ chọn sai môn, tiếp tục nộp hàng nghìn đơn thư khiếu nại lên Phòng Đào tạo, khiến việc xây dựng phần mềm tốn kém nhưng không giải quyết được vấn đề quá tải vận hành.

---

### **8.3. Mô tả MVP (Minimum Viable Product)**

* **Định dạng MVP:** Nguyên mẫu tương tác có thể bấm được (Interactive Clickable Prototype) trên công cụ thiết kế (Figma), mô phỏng luồng đăng ký học phần trên giao diện máy tính để bàn (Desktop Web) — nơi sinh viên thường thao tác đăng ký chính thức.
* **Phạm vi tính năng tối thiểu trong nguyên mẫu:**
  1. **Màn hình Tra cứu môn học & Cây tiên quyết:** Hiển thị danh sách môn học của ngành Kỹ thuật Cơ khí / Điện tử; gắn nhãn trạng thái trực quan: *Đã học (Xanh lá)*, *Đủ điều kiện đăng ký (Trắng/Xanh dương)*, *Chưa đủ điều kiện (Xám kèm lý do thiếu môn tiên quyết nào)*.
  2. **Luồng Chọn lớp Lý thuyết & Ca Xưởng:** Khi sinh viên chọn 1 lớp Lý thuyết, hệ thống tự động lọc và chỉ hiển thị các ca thực hành xưởng còn trống và không trùng giờ với các môn đã chọn trước đó.
  3. **Màn hình Thời khóa biểu tạm tính & Học phí:** Hiển thị ma trận lịch học theo tuần và tổng số tiền học phí tạm tính theo số tín chỉ đã chọn.
  4. **Màn hình Xác nhận đăng ký:** Nút bấm xác nhận và hiển thị thông báo hoàn tất đăng ký thành công kèm bảng tóm tắt kết quả.

---

### **8.4. Thiết kế phương pháp thử nghiệm (Experiment Design)**

| Thành phần | Chi tiết triển khai |
| :--- | :--- |
| **Phương pháp thử nghiệm** | Kiểm thử khả năng sử dụng có giám sát (Moderated Usability Testing) kết hợp Phỏng vấn bán cấu trúc (Semi-structured Interview). |
| **Đối tượng tham gia (Participants)** | **20 sinh viên HBA**, gồm:<br>• 10 sinh viên năm 2 (vừa chuyển đổi từ Niên chế sang, chưa từng tự xếp lịch).<br>• 10 sinh viên năm 3–4 thuộc các ngành kỹ thuật nặng về thực hành xưởng (Cơ khí, Điện tử, Hóa học). |
| **Thời lượng & Địa điểm** | 30 phút / sinh viên; thực hiện tại phòng Lab máy tính của trường hoặc qua Google Meet chia sẻ màn hình. |
| **Kịch bản nhiệm vụ (Scenario Tasks)** | Người tham gia được giao kịch bản: *"Em hãy lập thời khóa biểu học kỳ mới với 4 môn học (gồm 2 môn lý thuyết thuần túy và 2 môn kỹ thuật có ca thực hành xưởng kèm theo), sau đó kiểm tra học phí và xác nhận hoàn tất."* |

---

### **8.5. Chỉ số đo lường hiệu quả (Metrics & Indicators)**

| Nhóm chỉ số | Chỉ số cụ thể (Metrics) | Cách thức thu thập dữ liệu |
| :--- | :--- | :--- |
| **Độ hiệu quả (Effectiveness)** | • Tỷ lệ hoàn thành nhiệm vụ (Task Completion Rate)<br>• Tỷ lệ chọn sai môn tiên quyết (Error Rate)<br>• Tỷ lệ bị trùng lịch Lý thuyết – Xưởng | Quan sát trực tiếp người dùng thao tác trên Figma Prototype và ghi nhận log kết quả. |
| **Độ hiệu quả vận hành (Efficiency)** | • Thời gian hoàn thành tác vụ (Time on Task)<br>• Số lần sinh viên phải dừng lại hỏi người hướng dẫn | Bấm giờ từ lúc bắt đầu đọc đề bài đến khi bấm nút "Xác nhận đăng ký". Đếm số câu hỏi phát sinh. |
| **Mức độ hài lòng (Satisfaction)** | • Điểm SUS (System Usability Scale)<br>• Mức độ tự tin khi bấm xác nhận (thang điểm 1–5) | Bảng khảo sát ngắn 5 câu hỏi sau buổi thử nghiệm và phỏng vấn nhanh cảm nhận. |

---

### **8.6. Tiêu chí đánh giá thành công (Success Criteria)**

* **Ủng hộ giả thuyết (Pass / Success):**
  * Tỷ lệ hoàn thành trọn vẹn nhiệm vụ đạt **$\ge 85\%$** (ít nhất 17/20 sinh viên hoàn thành).
  * **$0\%$** sinh viên vi phạm quy tắc môn tiên quyết (nguyên mẫu chặn thành công hoặc sinh viên tự nhận biết đúng).
  * Thời gian hoàn tất việc chọn 4 môn và ghép ca xưởng trung bình **dưới 8 phút**.
  * Điểm đánh giá mức độ rõ ràng, tự tin đạt trung bình **$\ge 4.0 / 5.0$**.
* **Bác bỏ giả thuyết (Fail / Inconclusive):**
  * Tỷ lệ hoàn thành nhiệm vụ dưới $70\%$, hoặc thời gian thao tác kéo dài trên 15 phút.
  * Xuất hiện trên $20\%$ người tham gia phản ánh không hiểu cách ghép ca xưởng hoặc không biết tại sao một môn bị khóa.

---

### **8.7. Kế hoạch điều chỉnh sau thử nghiệm (Next Steps / Action Plan)**

```
                                  [KẾT QUẢ THỬ NGHIỆM MVP]
                                             |
             +-------------------------------+-------------------------------+
             |                                                               |
    [ĐẠT TIÊU CHÍ (> 85%)]                                          [CHƯA ĐẠT TIÊU CHÍ]
             |                                                               |
             v                                                               v
• Giữ nguyên luồng tương tác cốt lõi.                        • Phân tích điểm nghẽn (Friction Points)
• Chuyển giao đặc tả luồng cho đội                           dựa trên bản ghi màn hình & phỏng vấn.
  kỹ thuật để lập trình phiên bản Web thật.                  • Tinh chỉnh giao diện: làm rõ nhãn cảnh báo,
• Mở rộng thử nghiệm tiếp theo:                              đơn giản hóa bảng chọn ca xưởng.
  Thử nghiệm với nhóm Cán bộ Đào tạo                        • Tiến hành vòng thử nghiệm Prototype thứ 2
  về tính năng phê duyệt ngoại lệ tự động.                    với 10 sinh viên mới trước khi code.
```