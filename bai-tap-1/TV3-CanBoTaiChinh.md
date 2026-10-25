# **Cán Bộ Tài Chính**

# **1\. Tình huống**

**Bối cảnh:**

* **Học viện Bách Nghệ Hà Nội (HBA)** – cơ sở giáo dục đại học kỹ thuật ứng dụng quy mô lớn (\~35.000 sinh viên, \~1.500 giảng viên) – vừa chính thức chuyển đổi mô hình đào tạo từ **Niên chế** sang **Học chế Tín chỉ**.  
* Cán bộ Phòng Tài chính \- Kế toán (Cán bộ Tài chính – CBTC) buộc phải thay đổi hoàn toàn phương thức quản lý thu học phí: từ mô hình thu một mức trọn gói cố định theo từng lớp hành chính niên chế sang mô hình tính toán học phí động, thu tiền lẻ biến đổi theo đúng số lượng tín chỉ thực tế mà từng sinh viên đăng ký ở mỗi học kỳ.  
* Đặc thù đào tạo kỹ thuật ứng dụng tại HBA đòi hỏi cách tính học phí phải phân tách định mức đơn giá và nhân hệ số chênh lệch (từ 1.2 đến 1.5) giữa giờ học lý thuyết trên giảng đường lớn với các ca thực hành xưởng, phòng thí nghiệm và đồ án theo từng chương trình đào tạo khác nhau.  
* Trong giai đoạn đầu chuyển đổi, dữ liệu biến động đăng ký học phần từ Phòng Đào tạo chưa được liên thông tự động theo thời gian thực với phân hệ kế toán và ngân hàng; hàng chục nghìn giao dịch chuyển khoản tiền lẻ bị ghi sai cú pháp khiến khâu đối soát sao kê thủ công trên Excel bị "vỡ trận", làm chậm trễ việc gạch nợ và gây ách tắc quá trình xét điều kiện dự thi cũng như đăng ký môn học của sinh viên.

# **2\. User Need**

| User Need | Mức độ xác minh |
| :---- | :---- |
| Tính toán và cập nhật chính xác tổng số tiền học phí phải nộp cho từng sinh viên dựa trên số tín chỉ lý thuyết, tính toán số lượng đăng ký thực tế và hệ số đơn giá riêng của từng chương trình đào tạo. | Đã có bằng chứng nghiên cứu (HBA vừa chuyển từ thu trọn gói niên chế sang tính động theo từng tín chỉ kèm hệ số xưởng thực hành 1.2–1.5; cán bộ phải xuất file từ Phòng Đào tạo để tính thủ công trên Excel, dẫn đến 35% thắc mắc tại bộ phận Tài vụ xuất phát từ việc chậm cập nhật học phí sau khi sinh viên thêm/rút lớp). |
| Kiểm tra và tự động hoàn thành các giao dịch nộp tiền học phí từ ngân hàng theo thời gian thực cho khoảng 35.000 sinh viên mà không phải rà soát thủ công từng dòng sao kê. | Đã có bằng chứng nghiên cứu (Trong đợt thu học phí đầu kỳ khoảng 2–3 tuần, có khoảng 8–12% giao dịch chuyển khoản tiền lẻ bị lỗi cú pháp do sinh viên viết tắt tên, thiếu MSSV hoặc phụ huynh nộp hộ, khiến 4 cán bộ kế toán mất từ 5 đến 7 ngày làm việc toàn thời gian để đối soát bằng Excel). |
| Quản lý và đồng bộ tức thời danh sách trạng thái công nợ học phí của sinh viên sang phân hệ của Phòng Đào tạo để mở/khóa quyền đăng ký học phần hoặc xét tư cách dự thi cuối kỳ. | Đã có bằng chứng nghiên cứu (Dữ liệu công nợ hiện phải xuất thành file Excel gửi qua email nội bộ làm độ trễ gạch nợ kéo dài từ 24h đến 72h; thực tế đã xảy ra tình trạng sinh viên nộp tiền rồi vẫn bị khóa quyền đăng ký/cấm thi oan, hoặc sinh viên còn nợ phí vẫn lọt vào danh sách dự thi). |
| Xử lý hoàn trả hoặc bảo lưu chính xác khoản tiền học phí chênh lệch khi sinh viên rút bớt môn học trong giai đoạn điều chỉnh hoặc khi lớp học phần bị hủy do không đủ sĩ số. | Có dấu hiệu hỗ trợ (Thống kê đầu kỳ có khoảng 12% lớp học phần bị hủy phút chót vì thiếu sĩ số và hàng nghìn lượt điều chỉnh môn học trong 3 tuần đầu; quy trình lập danh sách và hoàn tiền thủ công hiện kéo dài hàng tháng, gây bức xúc cho sinh viên và phụ huynh). |
| Xuất và gửi tự động hóa đơn điện tử hoặc biên lai thu học phí hợp lệ kèm bảng kê chi tiết từng môn học cho sinh viên và phụ huynh ngay sau khi hoàn tất nghĩa vụ tài chính. | Có dấu hiệu hỗ trợ (Hệ thống hóa đơn điện tử hiện chưa tích hợp API tự động với dữ liệu đăng ký tín chỉ; cán bộ kế toán phải xuất lẻ từng hóa đơn và nhiều sinh viên phải trực tiếp xếp hàng tại Phòng Tài vụ để xin giấy xác nhận phục vụ vay vốn hoặc xét học bổng). |
| Theo dõi, khấu trừ tự động định mức miễn giảm học phí cho sinh viên diện chính sách và tổng hợp báo cáo quyết toán thu học phí tín chỉ theo từng Khoa/Viện để phục vụ kiểm toán định kỳ. | Chưa xác minh – giả định ban đầu (cần khảo sát thêm bộ phận Kế toán tổng hợp) (Khi bỏ mức thu trần cố định của Niên chế, việc tính tỷ lệ miễn giảm trên số tín chỉ thực học và tách doanh thu học phần dùng chung giữa các Khoa trở nên phức tạp hơn; cần phỏng vấn sâu thêm về quy trình quyết toán cuối kỳ). |

# **3\. User Problem Statement**

## **3.1. User Need 1**

* **User Need:** Tính toán và cập nhật chính xác tổng số tiền học phí phải nộp cho từng sinh viên dựa trên số tín chỉ lý thuyết, tính toán số lượng đăng ký thực tế và hệ số đơn giá riêng của từng chương trình đào tạo.  
* **Context:** Ngay sau khi đợt đăng ký học phần chính thức kết thúc và sau giai đoạn sinh viên điều chỉnh thêm/rút môn vào đầu mỗi học kỳ.  
* **Barrier:** Trước đây chỉ thu một mức cố định theo kỳ cho cả lớp niên chế; nay đơn giá tín chỉ thay đổi theo từng môn, từng hệ đào tạo kèm hệ số chênh lệch giữa lý thuyết với thực hành xưởng (1.2–1.5), nhưng dữ liệu từ Phòng Đào tạo phải xuất ra thủ công để kế toán áp công thức tính lại trên bảng tính Excel.  
* **Consequence:** Tốn nhiều ngày làm việc để tính toán công nợ cho 35.000 sinh viên, dễ xảy ra nhầm lẫn hệ số đơn giá giữa các ngành kỹ thuật, khiến thông tin học phí cập nhật chậm trễ và làm phát sinh 35% lượng thắc mắc, khiếu nại tại Phòng Tài vụ.  
* **User problem statement:**  
  "Cán bộ Phòng Tài chính \- Kế toán tại Học viện Bách Nghệ Hà Nội (HBA) gặp khó khăn khi tính toán và cập nhật số tiền học phí phải thu cho 35.000 sinh viên vào đầu mỗi học kỳ, vì sau khi chuyển từ niên chế sang tín chỉ, đơn giá từng môn biến động theo hệ số thực hành xưởng và dữ liệu đăng ký học phần phải xuất thủ công sang Excel để áp công thức, dẫn đến việc mất nhiều ngày xử lý, dễ sai lệch công nợ và làm phát sinh 35% lượng khiếu nại tài vụ đầu kỳ."

## **3.2. User Need 2**

* **User Need:** Đối soát và gạch nợ tự động các giao dịch nộp tiền học phí từ ngân hàng theo thời gian thực cho khoảng 35.000 sinh viên mà không phải rà soát thủ công từng dòng sao kê.  
* **Context:** Trong suốt thời gian cao điểm mở đợt thu nộp học phí đầu kỳ và trước kỳ thi học kỳ (kéo dài khoảng 2–4 tuần) tại Phòng Tài chính \- Kế toán HBA.  
* **Barrier:** Sinh viên nộp các khoản tiền lẻ khác nhau theo số tín chỉ đăng ký thông qua chuyển khoản ngân hàng thông thường nhưng thường xuyên ghi sai cú pháp nội dung (viết tắt tên, thiếu hoặc sai MSSV, phụ huynh chuyển khoản hộ), trong khi dữ liệu sao kê ngân hàng chưa liên thông tự động mà phải tải file về dò tay.  
* **Consequence:** Có tới 8–12% tổng số giao dịch bị lỗi cú pháp cần tra cứu thủ công, khiến 4 cán bộ kế toán mất từ 5 đến 7 ngày làm việc toàn thời gian để đối soát sao kê và làm sinh viên đã nộp tiền vẫn bị treo nợ từ 24–48 giờ.  
* **User problem statement:**  
  "Cán bộ Phòng Tài chính \- Kế toán Học viện Bách Nghệ Hà Nội gặp áp lực và rủi ro sai sót rất lớn khi lần đầu chuyển sang tính toán học phí động theo tín chỉ và đối soát sao kê ngân hàng, vì các khoản thu tiền lẻ theo từng môn học phát sinh hàng nghìn giao dịch sai cú pháp (chiếm 8–12%) và hiện vẫn làm thủ công trên file bảng tính, dẫn đến thời gian đối soát công nợ kéo dài từ 5 đến 7 ngày, tỷ lệ cập nhật trạng thái nợ chậm trễ gây khóa nhầm quyền đăng ký của sinh viên và làm tăng khối lượng giải trình khiếu nại tài chính."

## **3.3. User Need 3**

* **User Need:** Quản lý và đồng bộ tức thời danh sách trạng thái công nợ học phí của sinh viên sang phân hệ của Phòng Đào tạo để mở/khóa quyền đăng ký học phần hoặc xét tư cách dự thi cuối kỳ.  
* **Context:** Trước các đợt mở cổng đăng ký học phần kỳ mới và giai đoạn chốt danh sách sinh viên đủ điều kiện dự thi kết thúc học phần.  
* **Barrier:** Dữ liệu gạch nợ tại Phòng Tài chính \- Kế toán không được đồng bộ theo thời gian thực sang cơ sở dữ liệu học vụ của Phòng Đào tạo; cán bộ hai phòng ban vẫn phải kết xuất và gửi file Excel danh sách nợ học phí qua email nội bộ theo từng đợt.  
* **Consequence:** Độ trễ cập nhật trạng thái hoàn thành học phí kéo dài từ 24 đến 72 giờ, dẫn đến việc sinh viên vừa nộp tiền xong vẫn bị khóa tài khoản đăng ký môn hoặc bị cấm thi oan, trong khi một số trường hợp nợ đọng lại chưa kịp khóa quyền dự thi.  
* **User problem statement:**  
  "Cán bộ Phòng Tài chính \- Kế toán tại Học viện Bách Nghệ Hà Nội (HBA) gặp khó khăn khi đồng bộ trạng thái hoàn thành học phí của sinh viên sang bộ phận học vụ trước các kỳ thi và đợt đăng ký môn mới, vì dữ liệu công nợ giữa hai phòng ban đang trao đổi thủ công qua các file Excel rời rạc với độ trễ từ 24 đến 72 giờ, dẫn đến tình trạng khóa nhầm quyền đăng ký hoặc cấm thi oan đối với sinh viên đã nộp tiền và gây ùn ứ người học đến khiếu nại trực tiếp."

## **3.4. User Need 4**

* **User Need:** Xử lý hoàn trả hoặc bảo lưu chính xác khoản tiền học phí chênh lệch khi sinh viên rút bớt môn học trong giai đoạn điều chỉnh hoặc khi lớp học phần bị hủy do không đủ sĩ số sàn.  
* **Context:** Sau khi Phòng Đào tạo công bố danh sách hủy các lớp học phần không đạt sĩ số tối thiểu và kết thúc tuần lễ điều chỉnh đăng ký môn học đầu kỳ.  
* **Barrier:** Khác với mô hình niên chế cố định, mô hình tín chỉ phát sinh biến động lớn (khoảng 12% lớp bị hủy do thiếu sĩ số và hàng nghìn lượt rút môn), nhưng quy trình kế toán hiện tại chưa có cơ chế ví điện tử bảo lưu tự động mà phải lập chứng từ trình duyệt và hoàn tiền thủ công cho từng cá nhân.  
* **Consequence:** Thủ tục đối chiếu và hoàn trả hoặc cấn trừ tiền học phí kéo dài hàng tháng trời, làm tăng khối lượng bút toán điều chỉnh của kế toán viên và gây tâm lý bức xúc cho sinh viên cùng gia đình.  
* **User problem statement:**  
  "Cán bộ Phòng Tài chính \- Kế toán tại Học viện Bách Nghệ Hà Nội (HBA) gặp khó khăn khi xử lý hoàn trả hoặc bảo lưu tiền học phí chênh lệch vào đầu mỗi học kỳ tín chỉ, vì có tới 12% lớp học phần bị hủy do thiếu sĩ số kèm hàng nghìn lượt sinh viên rút môn nhưng quy trình quyết toán hoàn tiền vẫn phải lập danh sách và hạch toán thủ công từng trường hợp, dẫn đến thời gian giải quyết kéo dài hàng tháng và gây áp lực giải trình nặng nề với phụ huynh."

## **3.5. User Need 5**

* **User Need:** Xuất và gửi tự động hóa đơn điện tử hoặc biên lai thu học phí hợp lệ kèm bảng kê chi tiết từng môn học cho sinh viên và phụ huynh ngay sau khi hoàn tất nghĩa vụ tài chính.  
* **Context:** Ngay sau khi giao dịch nộp học phí của sinh viên được xác nhận thành công trong đợt thu học phí chính thức của Học viện.  
* **Barrier:** Phân hệ phát hành hóa đơn điện tử của Phòng Tài chính chưa được kết nối tự động với dữ liệu chi tiết các học phần tín chỉ mà sinh viên đã đăng ký cũng như kết quả gạch nợ từ ngân hàng.  
* **Consequence:** Cán bộ tài vụ phải nhập liệu và xuất lẻ từng hóa đơn hoặc biên lai giấy khi có yêu cầu, khiến sinh viên cần chứng từ gấp (để làm hồ sơ vay vốn tín dụng sinh viên, nhận học bổng doanh nghiệp hoặc báo cáo gia đình) phải xếp hàng chờ đợi tại văn phòng.  
* **User problem statement:**  
  "Cán bộ Phòng Tài chính \- Kế toán tại Học viện Bách Nghệ Hà Nội (HBA) gặp khó khăn khi phát hành hóa đơn điện tử và cấp biên lai xác nhận thu học phí chi tiết theo từng học phần cho 35.000 sinh viên, vì phần mềm xuất hóa đơn hiện tại chưa liên thông tự động với dữ liệu đăng ký tín chỉ và kết quả đối soát ngân hàng, dẫn đến việc phải thao tác xuất chứng từ thủ công và gây quá tải khu vực tiếp sinh viên tại văn phòng Tài vụ."

## **3.6. User Need 6**

* **User Need:** Theo dõi, khấu trừ tự động định mức miễn giảm học phí cho sinh viên diện chính sách và tổng hợp báo cáo quyết toán thu học phí tín chỉ theo từng Khoa/Viện để phục vụ kiểm toán định kỳ.  
* **Context:** Giai đoạn khóa sổ kế toán cuối mỗi học kỳ và lập báo cáo quyết toán tài chính năm học trình Ban Giám đốc Học viện.  
* **Barrier:** Khi chuyển sang học chế tín chỉ, sinh viên các khóa học ghép lẫn nhau và mức miễn giảm chỉ áp dụng trong phạm vi số tín chỉ chuẩn (không bao gồm các môn học lại, học cải thiện), buộc kế toán phải bóc tách thủ công từng loại tín chỉ của từng sinh viên trên bảng tính lớn.  
* **Consequence:** Quá trình tổng hợp số liệu quyết toán và kiểm toán ngân sách nhà nước cuối kỳ mất nhiều tuần rà soát chéo, tiềm ẩn rủi ro tính sai định mức miễn giảm hoặc phân bổ lệch kinh phí đào tạo giữa các Khoa/Viện.  
* **User problem statement:**  
  "Cán bộ Phòng Tài chính \- Kế toán tại Học viện Bách Nghệ Hà Nội (HBA) gặp khó khăn khi rà soát chế độ miễn giảm học phí và lập báo cáo quyết toán tài chính theo từng Khoa/Viện vào cuối học kỳ, vì trong mô hình tín chỉ, sinh viên học ghép liên khoa và phải bóc tách thủ công giữa tín chỉ học lần đầu với tín chỉ học lại/cải thiện, dẫn đến việc chậm trễ khóa sổ kế toán và gia tăng áp lực sai số khi kiểm toán ngân sách."

# **4\. Giả định cần kiểm chứng (Assumptions to Validate)**

* **Về mặt chuẩn hóa định danh thanh toán:** Giả định rằng nếu áp dụng mã thanh toán động (như VietQR gắn sẵn mã hóa đơn và số tiền chính xác theo từng mã sinh viên), tới 99% lỗi ghi sai cú pháp chuyển khoản và nộp lệch số tiền lẻ sẽ được loại bỏ hoàn toàn.  
* **Về mặt hành vi xử lý học phí dư/hoàn trả:** Giả định rằng đa số sinh viên và phụ huynh đồng ý phương án tự động bảo lưu khoản tiền học phí dư (do rút môn hoặc hủy lớp học phần) vào "Ví học phí cá nhân" để cấn trừ trực tiếp cho học kỳ kế tiếp, thay vì yêu cầu làm thủ tục rút tiền mặt hoặc chuyển khoản hoàn trả ngay trong kỳ.  
* **Về mặt phân quyền khóa/mở học vụ tự động:** Giả định rằng Phòng Đào tạo và Phòng Tài chính \- Kế toán thống nhất hoàn toàn về quy tắc nghiệp vụ để hệ thống tự động mở khóa quyền đăng ký môn/quyền dự thi ngay tức thì (real-time) khi nhận tín hiệu gạch nợ, không cần bước cán bộ ký duyệt danh sách giấy trung gian.  
* **Về mặt công thức tính học phí kỹ thuật phức tạp:** Giả định rằng mọi quy tắc tính học phí theo tín chỉ (hệ số thực hành xưởng 1.2–1.5, học vượt, học lại, văn bằng 2, chế độ miễn giảm chính sách) tại HBA đều đã được quy định tường minh bằng công thức toán học và không tồn tại các trường hợp ngoại lệ phải định giá cảm tính.

# **5\. User problem statement canvas**

## **5.1. User problem statement canvas 1**

| CONTEXT (Bối cảnh xảy ra) | PROBLEM / ROOT CAUSE (Vấn đề cốt lõi) | ALTERNATIVES (Cách CBTC tự xoay sở hiện tại) |
| :---- | :---- | :---- |
| Ngay sau khi đóng cổng đăng ký học phần chính thức và sau tuần lễ điều chỉnh thêm/rút môn đầu mỗi học kỳ tại Phòng Tài chính \- Kế toán HBA. | Chuyển từ mức thu phẳng cố định thời niên chế sang tính học phí động theo từng tín chỉ thực học kèm hệ số chênh lệch giữa lý thuyết và thực hành xưởng (1.2–1.5) theo từng ngành, nhưng thiếu công cụ liên thông tính phí tự động từ dữ liệu học vụ. | • Yêu cầu Phòng Đào tạo kết xuất file danh sách đăng ký môn học của 35.000 sinh viên ra định dạng Excel.• Kế toán viên tự thiết lập các bảng tra đơn giá và dùng công thức Excel (SUMIFS, VLOOKUP) để nhân hệ số tín chỉ cho từng sinh viên. |
| **CUSTOMERS (Đối tượng chịu tác động)** | **EMOTIONAL & QUANTIFIABLE IMPACT (Tác động cảm xúc & Định lượng)** | **ALTERNATIVE SHORTCOMINGS (Hạn chế của cách cũ)** |
| Chuyên viên kế toán học phí và cán bộ theo dõi công nợ tại Phòng Tài chính \- Kế toán HBA (gián tiếp ảnh hưởng tới 35.000 sinh viên và phụ huynh). | • Cảm xúc: Căng thẳng, lo âu cao độ vì áp lực tính đúng tiền cho hàng chục nghìn sinh viên dưới sức ép thời gian gấp rút đầu kỳ.• Định lượng: Mất 3–5 ngày làm việc để tổng hợp và kiểm tra bảng tính; phát sinh 35% lượng thắc mắc tại bộ phận Tài vụ do chậm cập nhật số tiền học phí sau khi sinh viên thêm/rút lớp (Evidence). | • File Excel hàng trăm nghìn dòng dữ liệu đăng ký môn học thường xuyên bị treo máy hoặc lỗi công thức khi chạy tổng hợp.• Mọi thay đổi thêm/bớt môn của sinh viên đều khiến bảng tính cũ bị lệch, buộc kế toán phải chạy lại dữ liệu từ đầu. |

## **5.2. User problem statement canvas 2** 

| CONTEXT (Bối cảnh xảy ra) | PROBLEM / ROOT CAUSE (Vấn đề cốt lõi) | ALTERNATIVES (Cách CBTC tự xoay sở hiện tại) |
| :---- | :---- | :---- |
| Giai đoạn cao điểm mở cổng thu học phí đầu kỳ và trước kỳ thi học kỳ (kéo dài khoảng 3–4 tuần) tại Văn phòng Kế toán HBA. | Sinh viên chuyển khoản các số tiền lẻ biến đổi theo tín chỉ nhưng ghi sai cú pháp nội dung (thiếu MSSV, viết tắt, phụ huynh nộp hộ), trong khi hệ thống kế toán thiếu cổng kết nối tự động (Payment Gateway / Open Banking API) với ngân hàng và CSDL đào tạo. | • Tải sao kê tài khoản ngân hàng dạng file Excel về máy tính vào cuối mỗi ngày làm việc.• Dùng hàm VLOOKUP trên Excel để dò tìm chuỗi MSSV trong nội dung chuyển khoản.• Đăng thông báo tìm chủ nhân các khoản tiền khuyết danh hoặc chờ sinh viên mang biên lai giấy đến đối chất trực tiếp. |
| **CUSTOMERS (Đối tượng chịu tác động)** | **EMOTIONAL & QUANTIFIABLE IMPACT (Tác động cảm xúc & Định lượng)** | **ALTERNATIVE SHORTCOMINGS (Hạn chế của cách cũ)** |
| Chuyên viên kế toán thanh toán, cán bộ đối soát công nợ học phí tại Phòng Tài chính \- Kế toán HBA. | • Cảm xúc: Áp lực nặng nề vì liên quan trực tiếp đến số liệu tiền tệ và kiểm toán ngân sách nhà nước; mệt mỏi kiệt sức khi phải giải quyết khiếu nại của sinh viên bị treo nợ.• Định lượng: Mất 5 đến 7 ngày làm việc toàn thời gian của 4 cán bộ kế toán; tỷ lệ giao dịch lỗi cú pháp phải xử lý tay chiếm 8–12%; thời gian sinh viên chờ gạch nợ trễ 24–48 giờ (Evidence). | • Cực kỳ tốn thời gian và dễ nhầm lẫn khi 35.000 sinh viên nộp các khoản tiền lẻ khác nhau.• Không thể tự động nhận diện các giao dịch do phụ huynh chuyển hộ với tên chủ tài khoản hoàn toàn khác tên sinh viên.• Gây ùn ứ hàng trăm sinh viên cầm hóa đơn giấy xếp hàng tại Phòng Tài vụ để xin xác nhận gạch nợ thủ công. |

## **5.3. User problem statement canvas 3**

| CONTEXT (Bối cảnh xảy ra) | PROBLEM / ROOT CAUSE (Vấn đề cốt lõi) | ALTERNATIVES (Cách CBTC tự xoay sở hiện tại) |
| :---- | :---- | :---- |
| Thời điểm sát ngày mở cổng đăng ký học phần kỳ mới và 1–2 tuần trước kỳ thi kết thúc học phần toàn Học viện. | Cơ sở dữ liệu công nợ của Phòng Tài chính \- Kế toán và phân hệ quản lý học vụ của Phòng Đào tạo hoạt động độc lập, không có cơ chế đồng bộ trạng thái nợ học phí theo thời gian thực. | • Định kỳ cuối ngày hoặc cuối tuần, kế toán lọc danh sách sinh viên còn nợ học phí ra file Excel và gửi qua email nội bộ cho Phòng Đào tạo để khóa quyền đăng ký/cấm thi.• Cấp giấy xác nhận đã nộp tiền đóng dấu đỏ cho từng sinh viên nộp muộn cầm sang Phòng Đào tạo xin mở khóa tài khoản. |
| **CUSTOMERS (Đối tượng chịu tác động)** | **EMOTIONAL & QUANTIFIABLE IMPACT (Tác động cảm xúc & Định lượng)** | **ALTERNATIVE SHORTCOMINGS (Hạn chế của cách cũ)** |
| Cán bộ quản lý công nợ (Phòng Tài chính) và Cán bộ học vụ (Phòng Đào tạo) tại HBA. | • Cảm xúc: Bức xúc, bị động khi liên tục bị kẹp giữa sự thúc ép danh sách của Phòng Đào tạo và sự phẫn nộ của sinh viên bị khóa tài khoản oan.• Định lượng: Độ trễ cập nhật dữ liệu gạch nợ sang phân hệ đào tạo kéo dài từ 24h đến 72h; mất trung bình 10–15 phút xử lý thủ công cho mỗi trường hợp sinh viên lên xin mở khóa tài khoản khẩn cấp (Evidence). | • Sinh viên nộp tiền vào sát giờ đăng ký môn hoặc sát ngày thi vẫn bị hệ thống cũ chặn quyền do chưa kịp gửi file Excel đồng bộ.• Ngược lại, những sinh viên rút môn hoặc phát sinh nợ bổ sung chưa kịp cập nhật vẫn lọt vào danh sách dự thi chính thức. |

## **5.4. User problem statement canvas 4** 

| CONTEXT (Bối cảnh xảy ra) | PROBLEM / ROOT CAUSE (Vấn đề cốt lõi) | ALTERNATIVES (Cách CBTC tự xoay sở hiện tại) |
| :---- | :---- | :---- |
| Giai đoạn 3 tuần đầu học kỳ khi Phòng Đào tạo chốt danh sách các lớp học phần bị hủy do thiếu sĩ số sàn và sinh viên hoàn tất điều chỉnh rút môn. | Sự biến động lớp học phần trong mô hình tín chỉ rất lớn nhưng hệ thống chưa có tài khoản định danh bảo lưu học phí (Ví học phí) hay cổng hoàn tiền tự động, buộc kế toán phải xử lý hạch toán hoàn trả thủ công. | • Tiếp nhận danh sách lớp bị hủy từ Phòng Đào tạo và đơn xin rút/hoàn học phí bằng giấy của sinh viên.• Kiểm tra chéo từng biên lai đã thu, lập bảng kê hoàn tiền trình Ban Giám đốc phê duyệt để chuyển khoản trả lại hoặc ghi chú thủ công sang file Excel kỳ sau. |
| **CUSTOMERS (Đối tượng chịu tác động)** | **EMOTIONAL & QUANTIFIABLE IMPACT (Tác động cảm xúc & Định lượng)** | **ALTERNATIVE SHORTCOMINGS (Hạn chế của cách cũ)** |
| Kế toán viên thanh toán tại Phòng Tài chính \- Kế toán HBA và nhóm sinh viên có lớp bị hủy/điều chỉnh. | • Cảm xúc: Quá tải và ngán ngẩm trước hàng nghìn bút toán điều chỉnh lặt nhặt; chịu áp lực giải trình lớn khi phụ huynh nghi ngờ nhà trường "ngâm" tiền học phí của con em.• Định lượng: Có tới 12% lớp học phần bị hủy phút chót do thiếu sĩ số; thủ tục rà soát và hoàn trả học phí thủ công kéo dài từ 3 đến 4 tuần (hàng tháng) (Assumption & Evidence). | • Quy trình duyệt chứng từ hoàn tiền giấy qua nhiều cấp mất rất nhiều thời gian và chi phí chuyển khoản ngân hàng.• Việc ghi chú bảo lưu học phí sang kỳ sau trên file Excel rời rạc rất dễ bị thất lạc dữ liệu hoặc bỏ sót khi chuyển giao giữa các học kỳ. |

## **5.5. User problem statement canvas 5 (Phát hành Hóa đơn điện tử & Biên lai thu học phí)**

| CONTEXT (Bối cảnh xảy ra) | PROBLEM / ROOT CAUSE (Vấn đề cốt lõi) | ALTERNATIVES (Cách CBTC tự xoay sở hiện tại) |
| :---- | :---- | :---- |
| Sau khi sinh viên hoàn tất nộp học phí đầu kỳ và khi sinh viên cần chứng từ tài chính để làm thủ tục vay vốn tín dụng hoặc thanh toán học bổng. | Phần mềm xuất hóa đơn điện tử của Học viện hoạt động rời rạc, chưa tích hợp API tự động lấy chi tiết danh mục tín chỉ đăng ký và kết quả gạch nợ từ ngân hàng. | • Kết xuất danh sách sinh viên đã gạch nợ thành công trên Excel, định dạng lại các cột dữ liệu rồi import thủ công theo lô (batch) vào phần mềm hóa đơn điện tử.• Tra cứu, in và đóng dấu trực tiếp giấy xác nhận đã hoàn thành học phí tại quầy giao dịch cho những sinh viên cần gấp. |
| **CUSTOMERS (Đối tượng chịu tác động)** | **EMOTIONAL & QUANTIFIABLE IMPACT (Tác động cảm xúc & Định lượng)** | **ALTERNATIVE SHORTCOMINGS (Hạn chế của cách cũ)** |
| Cán bộ phát hành chứng từ/hóa đơn tại Phòng Tài chính \- Kế toán HBA. | • Cảm xúc: Mệt mỏi vì các thao tác nhập liệu, xuất file lặp đi lặp lại nhàm chán; căng thẳng khi văn phòng luôn chật kín sinh viên xếp hàng xin giấy xác nhận.• Định lượng: Phải xử lý phát hành chứng từ cho \~35.000 sinh viên/kỳ; sinh viên phải chờ trung bình 3–5 ngày mới nhận được hóa đơn điện tử hoặc mất 30–45 phút xếp hàng xin giấy xác nhận trực tiếp (Assumption). | • Hóa đơn xuất theo lô thường chỉ ghi tổng số tiền chung chung, thiếu bảng kê chi tiết từng môn tín chỉ khiến phụ huynh khó đối chiếu.• Khi sinh viên điều chỉnh môn học làm thay đổi số tiền, kế toán phải lập biên bản hủy/điều chỉnh hóa đơn điện tử đã xuất rất phức tạp. |

## **5.6. User problem statement canvas 6** 

| CONTEXT (Bối cảnh xảy ra) | PROBLEM / ROOT CAUSE (Vấn đề cốt lõi) | ALTERNATIVES (Cách CBTC tự xoay sở hiện tại) |
| :---- | :---- | :---- |
| Giai đoạn giữa và cuối mỗi học kỳ khi xét duyệt danh sách miễn giảm học phí chính sách, cấp học bổng và lập báo cáo quyết toán tài chính năm học. | Trong học chế tín chỉ, định mức miễn giảm chỉ tính trên các học phần học lần đầu trong khung chuẩn (không miễn giảm cho tín chỉ học lại, học cải thiện điểm), đòi hỏi phải bóc tách chi tiết từng môn của từng sinh viên. | • Nhận danh sách sinh viên thuộc diện chính sách từ Phòng Công tác Sinh viên, sau đó đối chiếu thủ công với bảng đăng ký môn học của Phòng Đào tạo để trừ các môn học lại.• Tổng hợp doanh thu học phí theo từng Khoa/Viện bằng PivotTable trên Excel để lập báo cáo quyết toán. |
| **CUSTOMERS (Đối tượng chịu tác động)** | **EMOTIONAL & QUANTIFIABLE IMPACT (Tác động cảm xúc & Định lượng)** | **ALTERNATIVE SHORTCOMINGS (Hạn chế của cách cũ)** |
| Kế toán tổng hợp và Trưởng phòng Tài chính \- Kế toán HBA. | • Cảm xúc: Lo lắng về rủi ro xuất toán hoặc sai lệch số liệu khi đoàn kiểm toán nhà nước kiểm tra; áp lực phải làm thêm giờ vào mỗi dịp khóa sổ cuối kỳ.• Định lượng: Quá trình rà soát đối chiếu miễn giảm và lên báo cáo quyết toán cuối kỳ kéo dài 2–3 tuần; chi phí làm thêm giờ mùa cao điểm của các bộ phận vận hành ước tính lên tới \~200 triệu VNĐ/kỳ (Evidence & Assumption). | • Rất dễ nhầm lẫn giữa tín chỉ học lần đầu (được miễn giảm) và tín chỉ học cải thiện/học lại (phải đóng 100% phí) nếu rà soát bằng mắt trên Excel.• Dữ liệu phân tán ở nhiều phòng ban khiến báo cáo phân tích dòng tiền thu học phí cho Ban Giám đốc luôn bị chậm trễ. |

# **6\. Business problem**

## **Sai lệch và chậm trễ tính học phí động theo tín chỉ**

* **User Problem:** Cán bộ Tài chính gặp khó khăn khi phải xuất dữ liệu thủ công sang Excel để tính toán học phí cho 35.000 sinh viên theo số tín chỉ thực tế kèm hệ số chênh lệch lý thuyết.  
* **Operational Impact:** Tốn nhiều ngày làm việc của nhân sự kế toán đầu kỳ, thông tin học phí cập nhật chậm sau khi sinh viên thêm/rút môn khiến 35% thắc mắc học vụ dồn về Phòng Tài vụ.  
* **Business Problem:** Quy trình tính định mức học phí tín chỉ thủ công thiếu sự liên thông tự động với dữ liệu đào tạo, làm tăng chi phí vận hành (làm thêm giờ) và giảm tính minh bạch tài chính của Học viện.  
* **Desired Outcome:** Tự động hóa 100% việc tính toán và hiển thị học phí tức thời ngay khi sinh viên chọn hoặc điều chỉnh môn học, giảm 80% lượng thắc mắc về cách tính công nợ.

## **Quá tải đối soát sao kê ngân hàng và ách tắc gạch nợ học phí**

* **User Problem:** Cán bộ Tài chính mất từ 5–7 ngày để dò tìm thủ công hàng nghìn giao dịch chuyển khoản tiền lẻ bị ghi sai cú pháp (chiếm 8–12%) trên file sao kê Excel.  
* **Operational Impact:** Phòng Tài chính và Phòng Đào tạo phải trao đổi danh sách công nợ qua file Excel rời rạc với độ trễ 24–72 giờ, gây khóa nhầm quyền đăng ký môn hoặc cấm thi oan đối với sinh viên đã đóng tiền.  
* **Business Problem:** Quy trình đối soát thanh toán và đồng bộ công nợ thủ công gây ách tắc dây chuyền cho hoạt động tổ chức thi cuối kỳ và làm chậm tốc độ thu hồi dòng tiền học phí của Học viện (tỷ lệ nợ đọng kéo dài \~5% tổng thu).  
* **Desired Outcome:** Tự động hóa 95% khâu đối soát và gạch nợ học phí theo thời gian thực (≤ 5 giây) qua cổng thanh toán chuẩn hóa, thu hồi 99% học phí đúng hạn trước kỳ thi.

## **Trì trệ trong quyết toán hoàn/bảo lưu học phí khi hủy lớp và xuất chứng từ**

* **User Problem:** Cán bộ Tài chính phải lập danh sách hoàn trả/cấn trừ học phí thủ công cho hàng nghìn sinh viên có lớp học phần bị hủy (12% số lớp) hoặc rút môn, đồng thời phải xuất lẻ hóa đơn điện tử và giấy xác nhận.  
* **Operational Impact:** Thủ tục hoàn trả hoặc kết chuyển công nợ kéo dài hàng tháng trời; khu vực tiếp sinh viên của Phòng Tài vụ luôn quá tải người xếp hàng chờ xin chứng từ và giải quyết khiếu nại.  
* **Business Problem:** Sự thiếu hụt cơ chế quản lý ví học phí định danh và hóa đơn điện tử tích hợp gây lãng phí hơn 2.000 giờ công hành chính mỗi năm học và làm suy giảm chỉ số hài lòng của người học (NPS chỉ đạt \~45%) trong giai đoạn chuyển đổi sang tín chỉ.  
* **Desired Outcome:** Tự động bảo lưu/khấu trừ tiền học phí chênh lệch vào tài khoản định danh của sinh viên, phát hành 100% biên lai/hóa đơn điện tử tự động và nâng mức độ hài lòng của người học lên trên 85%.

# **7\. System Request (Hồ sơ Đề xuất Hệ thống – Planning Phase)**

**CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM**  
**Độc lập \- Tự do \- Hạnh phúc**

**VĂN BẢN ĐỀ XUẤT HỆ THỐNG (SYSTEM REQUEST)**  
*Giai đoạn: Khởi tạo & Lập kế hoạch*

## **7.1. Project Title (Tên Dự án)**

* **Tên dự án (Tiếng Việt):** Hệ thống Quản trị Đào tạo Đại học theo Học chế Tín chỉ và Thanh toán Học phí Trực tuyến Tích hợp.  
* **Tên dự án (Tiếng Anh):** Hanoi Polytechnic Academy Smart Credit-based Student Information and Tuition System (**HBA SIS-Pay**).  
* **Mã dự án:** PRJ-IT3120-HBA-SIS.

## **7.2.Đơn vị đề xuất và tài trợ**

* **Đơn vị phê duyệt & tài trợ chính (Executive Sponsor):** Ban Giám đốc Học viện Bách Nghệ Hà Nội (HBA).  
* **Đơn vị chủ trì nghiệp vụ (Co-Sponsors / Requestors):**  
  * **Phòng Đào tạo HBA:** Chịu trách nhiệm về Quy chế đào tạo tín chỉ, Quản lý chương trình học, Điều phối lớp học phần lý thuyết/xưởng thực hành và Xét điều kiện học vụ.  
  * **Phòng Tài chính \- Kế toán HBA:** Chịu trách nhiệm về Định mức đơn giá tín chỉ, Quản lý công nợ học phí động, Đối soát thanh toán ngân hàng và Phát hành hóa đơn điện tử.  
* **Đơn vị phối hợp kỹ thuật & vận hành hạ tầng:** Trung tâm Mạng và Dịch vụ Công nghệ Thông tin HBA.

## **7.3. Business Need / Problem Statement (Nhu cầu Nghiệp vụ)**

Học viện Bách Nghệ Hà Nội (HBA) vừa chính thức chuyển đổi mô hình quản trị đào tạo từ Niên chế truyền thống sang Học chế Tín chỉ nhằm đáp ứng nhu cầu cá nhân hóa lộ trình học tập cho hơn 35.000 sinh viên và 1.500 giảng viên. Tuy nhiên, hạ tầng phần mềm cũ và quy trình vận hành dựa trên bảng tính Excel kế thừa từ thời niên chế hoàn toàn không thể đáp ứng được độ phức tạp của hàng nghìn lớp học phần (tách biệt giữa lý thuyết và ca thực hành xưởng) cùng hàng chục nghìn giao dịch học phí tiền lẻ biến đổi theo từng tín chỉ.

Hiện tại, hệ thống cũ thường xuyên gặp sự cố nghẽn mạng vào khung giờ cao điểm mở cổng đăng ký; có tới 78.3% sinh viên từng nhầm lẫn điều kiện tiên quyết, 12% lớp học phần bị hủy phút chót do lệch pha dự báo sĩ số, và phát sinh hơn 1.500 – 4.000 đơn thư khiếu nại học vụ mỗi đầu kỳ. Đặc biệt tại Phòng Tài chính \- Kế toán, việc tính học phí thủ công và đối soát sao kê ngân hàng cho 35.000 sinh viên (với 8–12% giao dịch lỗi cú pháp) tiêu tốn từ 5 đến 7 ngày làm việc, gây trễ gạch nợ từ 24–72 giờ và làm ách tắc dây chuyền đến việc khóa/mở quyền đăng ký môn cũng như xét điều kiện dự thi cuối kỳ. Do đó, việc đầu tư xây dựng hệ thống HBA SIS-Pay liên thông toàn diện giữa Đào tạo và Tài chính là yêu cầu cấp thiết mang tính sống còn để đảm bảo sự thành công của chiến lược chuyển đổi số tại Học viện.

## **7.4. Project Vision / Goals (Tầm nhìn & Mục tiêu Dự án)**

* **Tầm nhìn (Project Vision):** Xây dựng nền tảng quản trị đại học số hiện đại, minh bạch, lấy người học làm trung tâm, tự động hóa và liên thông 100% dữ liệu theo thời gian thực giữa 4 tác nhân: **Sinh viên – Cán bộ Đào tạo – Cán bộ Tài chính – Giảng viên**.  
* **Mục tiêu định lượng (SMART Goals):**  
  1. **Kiểm soát quy chế & Ghép lịch:** Tự động hóa **100%** việc kiểm tra điều kiện môn tiên quyết/học trước/song hành và bộ lọc ghép cặp không trùng lịch giữa lớp Lý thuyết với ca Thực hành xưởng.  
  2. **Tối ưu tốc độ đăng ký:** Rút ngắn thời gian hoàn tất đăng ký học phần của sinh viên từ **4–6 giờ** chờ đợi xuống dưới **5 phút** thao tác ổn định.  
  3. **Tự động hóa tài chính & Đối soát:** Tự động hóa **100%** việc tính học phí tạm tính theo tín chỉ (kèm hệ số xưởng 1.2–1.5) và tự động hóa **≥ 95%** khâu đối soát, gạch nợ học phí tức thời qua mã VietQR động trong vòng **dưới 5 giây**.  
  4. **Giảm tải hành chính & Tối ưu tài nguyên:** Giảm **70–80%** số lượng đơn thư khiếu nại học vụ và công nợ đầu kỳ; giảm tỷ lệ hủy lớp học phần do thiếu sĩ số từ **12% xuống dưới 3%**.

## **7.5. Business Benefits (Phân tích Lợi ích Kinh doanh Đa Chiều)**

| Nhóm lợi ích | Chỉ số hiện trạng (Current State) | Mục tiêu đạt được (Desired State) | Giá trị định lượng & Định tính mang lại |
| :---- | :---- | :---- | :---- |
| Lợi ích Vận hành (Operational Benefits) | • Mất 5–7 ngày của 4 kế toán để đối soát sao kê thủ công.• Độ trễ gạch nợ và đồng bộ công nợ sang Đào tạo từ 24–72h.• Mất 15–20 phút/đơn xử lý ngoại lệ học vụ (trung bình chờ 5 ngày).• Tỷ lệ lớp hủy phút chót do lệch cung cầu ở mức 12%. | • Đối soát và gạch nợ tự động theo thời gian thực (≤ 5 giây).• Đồng bộ mở khóa đăng ký/dự thi tức thời (real-time).• 90% quy tắc kiểm tra tự động; xử lý ngoại lệ dưới 24 giờ.• Tỷ lệ hủy lớp giảm xuống \< 3%; công suất phòng/xưởng \> 85%. | • Tiết kiệm hơn 2.000 giờ làm việc hành chính mỗi năm học cho cán bộ Phòng Đào tạo và Phòng Tài chính.• Giải tỏa hoàn toàn cảnh sinh viên xếp hàng nộp đơn giấy và đối chất biên lai học phí.• Ổn định danh sách lớp học phần cho Giảng viên ngay từ tuần đầu tiên. |
| Lợi ích Kinh tế / Tài chính (Economic Benefits) | • Tỷ lệ nợ đọng học phí tín chỉ kéo dài chiếm \~5% tổng thu.• Chi phí in ấn biểu mẫu, đơn từ, sao kê, biên lai giấy \~150 triệu VNĐ/năm.• Chi phí làm thêm giờ (OT) mùa cao điểm cho cán bộ \~200 triệu VNĐ/kỳ. | • Thu hồi 99% học phí đúng hạn trước kỳ thi nhờ định danh VietQR và nhắc nợ tự động.• Cắt giảm 90% chi phí giấy tờ (áp dụng 100% đơn số & hóa đơn điện tử).• Cắt giảm 75% chi phí làm thêm giờ của nhân sự kế toán và đào tạo. | • Đẩy nhanh tốc độ luân chuyển dòng tiền học phí của Học viện.• Tiết kiệm trực tiếp ước tính từ 500 đến 700 triệu VNĐ/năm chi phí vận hành hành chính trực tiếp.• Ngăn ngừa thất thoát công nợ và sai sót kiểm toán nhà nước. |
| Lợi ích Chiến lược (Strategic Benefits) | • Dữ liệu học vụ và tài chính phân tán trên các file Excel rời rạc, báo cáo trễ 2–3 tuần.• Chỉ số hài lòng của sinh viên (NPS) về công tác chuyển đổi tín chỉ thấp (\~45%). | • Hệ thống dữ liệu tập trung (Single Source of Truth), báo cáo Dashboard thời gian thực.• Nâng chỉ số hài lòng của người học và giảng viên lên trên 85%. | • Hiện thực hóa thành công chiến lược Đại học Số của Học viện Bách Nghệ Hà Nội.• Nâng cao uy tín học thuật và đáp ứng tiêu chuẩn kiểm định chất lượng giáo dục đại học. |

## **7.6. High-level Requirements (Yêu cầu Cấp cao của Hệ thống)**

### **A. Yêu cầu Chức năng (Functional Requirements)**

1. **Phân hệ Quản lý Khung Chương trình & Trực quan hóa Cây Tiên quyết:** Cho phép cấu hình danh mục học phần, điều kiện ràng buộc (tiên quyết, học trước, song hành, tương đương) và hiển thị trực quan trạng thái môn học (Đã học / Đủ điều kiện / Khóa kèm lý do) gắn với lịch sử điểm cá nhân của từng sinh viên.  
2. **Phân hệ Đăng ký Nguyện vọng sớm & Điều phối Mở lớp:** Thu thập dữ liệu đăng ký nguyện vọng học phần trước kỳ học để dự báo nhu cầu, hỗ trợ Phòng Đào tạo phân bổ giảng đường lý thuyết và chia ca thực hành xưởng sát thực tế.  
3. **Phân hệ Đăng ký Học phần & Ghép lịch Lý thuyết – Thực hành Xưởng:** Cung cấp lưới thời khóa biểu trực quan; khi sinh viên chọn lớp lý thuyết, hệ thống tự động lọc các ca thực hành xưởng/thí nghiệm còn chỗ trống và kiểm tra chống trùng kíp học theo thời gian thực.  
4. **Phân hệ Tính Học phí Động & Quản lý Ví Học phí Cá nhân:** Tự động tính toán học phí tạm tính và chính thức theo số tín chỉ đăng ký, nhân hệ số chênh lệch (lý thuyết / thực hành xưởng 1.2–1.5), khấu trừ định mức miễn giảm chính sách và tự động bảo lưu tiền thừa vào Ví học phí khi hủy lớp hoặc rút môn.  
5. **Phân hệ Cổng Thanh toán Tích hợp (VietQR Payment Gateway) & Đối soát Tự động:** Sinh mã QR động (theo chuẩn Napas VietQR) chứa sẵn thông tin định danh hóa đơn và số tiền chính xác của từng sinh viên; tiếp nhận tín hiệu Webhook từ ngân hàng để gạch nợ tức thời và tự động mở khóa quyền đăng ký môn / tư cách dự thi.  
6. **Phân hệ Hóa đơn Điện tử & Báo cáo Quyết toán Tài vụ:** Tích hợp API xuất hóa đơn điện tử / biên lai thu tiền tự động kèm bảng kê chi tiết từng môn tín chỉ ngay sau khi gạch nợ; hỗ trợ xuất báo cáo đối soát và quyết toán thu học phí theo từng Khoa/Viện.  
7. **Phân hệ Xử lý Đơn Học vụ Số & Không gian Giảng viên:** Cho phép sinh viên gửi và theo dõi trạng thái đơn xin học vượt/điều chỉnh trực tuyến; cung cấp danh sách lớp học phần ổn định theo thời gian thực và công cụ nhập điểm cho Giảng viên.

### **B. Yêu cầu Phi chức năng (Non-Functional Requirements)**

8. **Hiệu năng & Khả năng chịu tải (Performance & Scalability):** Hệ thống phải chịu tải đồng thời tối thiểu **15.000 người dùng trực tuyến** trong khung giờ cao điểm mở cổng đăng ký tập trung (cho quy mô 35.000 SV) thông qua cơ chế hàng đợi ảo (Virtual Waiting Room); thời gian phản hồi thao tác đăng ký \< 1.5 giây và thời gian xử lý webhook gạch nợ học phí \< 5 giây.  
9. **Tính toàn vẹn & Nhất quán dữ liệu (Data Integrity & Consistency):** Đảm bảo tính chất ACID cho mọi giao dịch tranh chấp chỉ tiêu lớp học phần và giao dịch tài chính; tuyệt đối không xảy ra tình trạng trừ tiền hai lần hoặc lệch số dư công nợ giữa phân hệ Đào tạo và Tài chính.  
10. **An toàn, Bảo mật & Kiểm toán (Security & Auditability):** Xác thực người dùng tập trung qua SSO (Single Sign-On) và phân quyền chặt chẽ theo vai trò (RBAC); mã hóa dữ liệu giao dịch thanh toán theo chuẩn bảo mật tài chính; lưu vết toàn bộ lịch sử thao tác thêm/rút môn và điều chỉnh công nợ (Audit Logs) phục vụ thanh tra, kiểm toán.

## **7.7. Constraints / Assumptions (Ràng buộc & Giả định Dự án)**

* **Ràng buộc Ngân sách (Budget Constraint):** Tổng mức đầu tư dự kiến từ **1.2 đến 1.5 tỷ VNĐ** cho toàn bộ vòng đời phân tích, thiết kế, phát triển phần mềm, tích hợp cổng thanh toán/hóa đơn điện tử và triển khai đào tạo chuyển giao.  
* **Ràng buộc Thời gian (Schedule Constraint):** Thời gian thực hiện dự án tối đa **06 tháng** (từ tháng 11/2026 đến tháng 04/2027), bắt buộc phải hoàn thành kiểm thử nghiệm thu (UAT) để đưa vào vận hành chính thức trước đợt đăng ký học phần Học kỳ Hè và Học kỳ 1 năm học mới của Học viện.  
* **Ràng buộc Pháp lý & Quy chế (Regulatory Constraints):** Mọi thuật toán kiểm tra điều kiện tiên quyết, giới hạn tín chỉ tối thiểu/tối đa, cảnh báo học vụ và công thức tính học phí phải tuân thủ nghiêm ngặt Quy chế Đào tạo tín chỉ mới ban hành của Học viện Bách Nghệ Hà Nội và quy định quản lý tài chính công của Nhà nước.  
* **Giả định Hạ tầng & Đối tác (Assumptions):**  
  * Trung tâm Mạng HBA đảm bảo cung cấp hạ tầng máy chủ đám mây lai (Hybrid Cloud) hoặc cụm máy chủ nội bộ đủ năng lực tính toán.  
  * Các ngân hàng thương mại đối tác của Học viện cung cấp đầy đủ tài liệu kỹ thuật và môi trường Sandbox cho dịch vụ Open Banking API / Dynamic VietQR Webhook.  
  * Toàn bộ sinh viên và cán bộ có thiết bị máy tính hoặc điện thoại thông minh kết nối Internet để truy cập hệ thống.

## **7.8. Feasibility Assessment (Đánh giá Tính Khả thi 4 Chiều)**

| Chiều khả thi | Mức độ đánh giá | Phân tích & Luận cứ chi tiết |
| :---- | :---- | :---- |
| 1\. Technical Feasibility (Tính khả thi Kỹ thuật) | CAO | Kiến trúc hướng dịch vụ (Microservices / Modular Monolith) kết hợp cơ sở dữ liệu quan hệ PostgreSQL, bộ nhớ đệm Redis Caching (xử lý giữ chỗ/chống nghẽn chỉ tiêu lớp) và Message Queue hoàn toàn giải quyết triệt để bài toán 15.000 người dùng truy cập đồng thời. Chuẩn kết nối VietQR động và API Hóa đơn điện tử hiện đã được chuẩn hóa rộng rãi tại Việt Nam, độ phức tạp tích hợp ở mức kiểm soát tốt. |
| 2\. Economic Feasibility (Tính khả thi Kinh tế) | CAO | Phân tích Chi phí – Lợi ích (Cost-Benefit Analysis) cho thấy với ngân sách đầu tư 1.2–1.5 tỷ VNĐ, dự án giúp tiết kiệm trực tiếp 500–700 triệu VNĐ/năm (chi phí OT, in ấn, vận hành) và thu hồi sớm dòng tiền học phí nợ đọng (\~5% tổng thu). Thời gian hoàn vốn dự kiến (Payback Period) chỉ từ 1.8 đến 2.2 năm, mang lại hiệu quả đầu tư (ROI) rất tích cực cho Học viện. |
| 3\. Operational Feasibility (Tính khả thi Vận hành) | CAO | Dự án giải quyết trực tiếp "nỗi đau" lớn nhất của cả 4 nhóm người dùng trong giai đoạn chuyển đổi sang tín chỉ: giải phóng Cán bộ Đào tạo khỏi 4.000 đơn giấy, giải phóng Cán bộ Tài chính khỏi 5–7 ngày đối soát sao kê Excel thủ công, và giúp 35.000 Sinh viên chủ động xếp lịch/đóng phí minh bạch. Ban Giám đốc HBA cam kết ủng hộ tối đa về mặt chủ trương hành chính. |
| 4\. Schedule Feasibility (Tính khả thi Lịch trình) | TRUNG BÌNH – CAO (Khả thi nếu phân kỳ hợp lý) | Khung thời gian 6 tháng khá thách thức đối với một hệ thống tích hợp cả Đào tạo và Tài chính. Để đảm bảo tiến độ, dự án được chia làm 2 giai đoạn (Phased Delivery): Giai đoạn 1 (3 tháng đầu) tập trung bàn giao MVP gồm luồng Đăng ký học phần (Lý thuyết \+ Xưởng), Tính học phí động và Đối soát VietQR; Giai đoạn 2 (3 tháng tiếp theo) hoàn thiện phân hệ Xử lý đơn số, Ví bảo lưu, Miễn giảm chính sách và Báo cáo quyết toán nâng cao. |

## **7.9. Expected Deliverables (Sản phẩm Bàn giao Dự kiến)**

1. **Bộ Hồ sơ Khám phá Vấn đề & Phân tích Nghiệp vụ (Problem Discovery & BA Artifacts):** Báo cáo khảo sát User Needs, User Problem Statement Canvas, Lean UX Canvas, Kế hoạch kiểm chứng MVP và Tài liệu Đặc tả Yêu cầu Phần mềm (SRS).  
2. **Bộ Hồ sơ Thiết kế Hệ thống Hướng đối tượng (OOAD / SDD):** Biểu đồ Ca sử dụng (Use Case Diagrams & Specifications), Biểu đồ Lớp phân tích (BCE), Biểu đồ Trình tự (Sequence Diagrams), Biểu đồ Trạng thái (State Machine cho vòng đời Lớp học phần & Hóa đơn học phí) và Sơ đồ Cơ sở dữ liệu (ERD chuẩn 3NF).  
3. **Hệ thống Phần mềm Hoàn chỉnh (HBA SIS-Pay):**  
   * *Cổng thông tin Sinh viên (Web/Mobile Responsive):* Tra cứu cây tiên quyết, đăng ký nguyện vọng, ghép lịch Lý thuyết – Xưởng, xem học phí tạm tính, thanh toán VietQR và tra cứu biên lai điện tử.  
   * *Phân hệ Quản trị Đào tạo:* Cấu hình chương trình tín chỉ, điều phối lớp học phần/xưởng và duyệt đơn học vụ trực tuyến.  
   * *Phân hệ Quản trị Tài chính \- Kế toán:* Cấu hình biểu phí/hệ số tín chỉ, theo dõi gạch nợ tự động theo thời gian thực, quản lý Ví bảo lưu/hoàn phí và xuất báo cáo quyết toán.  
   * *Phân hệ Giảng viên:* Quản lý danh sách lớp học phần, điểm danh và nhập điểm thành phần/cuối kỳ.  
4. **Bộ Công cụ Chuyển đổi Dữ liệu & Tài liệu Vận hành:** Kịch bản làm sạch và ánh xạ dữ liệu lịch sử từ Niên chế sang Tín chỉ (Data Migration Scripts), Tài liệu hướng dẫn sử dụng (User Manuals) cho 4 tác nhân và Bộ kịch bản kiểm thử nghiệm thu (Test Cases).

## **7.10. Risks & Mitigation Strategies (Nhận diện Rủi ro & Phương án Giảm thiểu)**

| Mã RR | Rủi ro nhận diện (Identified Risks) | Loại rủi ro & Mức độ | Phương án phòng ngừa và giảm thiểu (Mitigation Strategies) |
| :---- | :---- | :---- | :---- |
| R-01 | Rủi ro sập tải cục bộ (Traffic Spike) giờ mở cổng: Hàng chục nghìn sinh viên HBA cùng truy cập chọn lớp và tạo mã thanh toán vào đúng giây mở cổng đầu tiên. | Kỹ thuật (Mức độ: Cao) | • Thiết kế cơ chế Hàng đợi ảo (Virtual Waiting Room) và bộ đệm Redis để kiểm soát lưu lượng truy cập.• Phối hợp với Phòng Đào tạo phân chia khung giờ mở cổng đăng ký lệch ca theo từng Khóa/Nhóm ngành kỹ thuật. |
| R-02 | Rủi ro gián đoạn Webhook ngân hàng gây lệch công nợ: Đường truyền liên ngân hàng bị trễ hoặc lỗi mạng khiến sinh viên đã bị trừ tiền nhưng hệ thống chưa nhận được tín hiệu gạch nợ tức thời. | Kỹ thuật & Nghiệp vụ (Mức độ: Trung bình – Cao) | • Xây dựng tiến trình đối soát chạy ngầm (Reconciliation Worker) tự động gọi API truy vấn lại lịch sử giao dịch ngân hàng mỗi 5 phút.• Cung cấp tính năng "Kiểm tra lại trạng thái giao dịch" trên màn hình của sinh viên và cơ chế tạm mở khóa quyền đăng ký có điều kiện. |
| R-03 | Rủi ro dữ liệu lịch sử từ thời Niên chế sang Tín chỉ không đồng nhất: Mã môn học, số tín chỉ quy đổi và lịch sử nợ phí của các khóa giao thời bị lệch chuẩn khi chuyển vào CSDL mới. | Dữ liệu (Mức độ: Trung bình) | • Xây dựng kịch bản làm sạch và quy đổi dữ liệu tương đương (Data Mapping & Cleansing) có sự kiểm duyệt chéo của Phòng Đào tạo và Phòng Tài chính trước khi golive.• Vận hành thử nghiệm song song (Parallel Run) đối soát số liệu trong 1 đợt đăng ký đầu tiên. |
| R-04 | Rủi ro tâm lý ngại thay đổi quy trình của người dùng: Một bộ phận cán bộ quen duyệt đơn giấy/Excel hoặc sinh viên chưa hiểu cơ chế Ví bảo lưu học phí và cảnh báo tiên quyết tự động. | Vận hành (Mức độ: Trung bình) | • Kiểm thử khả năng sử dụng (Usability Testing) trên nguyên mẫu Figma với sinh viên và cán bộ trước khi lập trình chính thức.• Tổ chức các buổi tập huấn thực hành (Hands-on Workshops) và ban hành quy định hành chính áp dụng đồng bộ quy trình số tại HBA. |

## **7.11. Approval & Sign-off (Phê duyệt Khởi động Dự án)**

| ĐẠI DIỆN BAN GIÁM ĐỐC HỌC VIỆN(Giám đốc Học viện Bách Nghệ Hà Nội) | ĐẠI DIỆN ĐƠN VỊ ĐỒNG ĐỀ XUẤT(Trưởng phòng Đào tạo HBA) | ĐẠI DIỆN ĐƠN VỊ ĐỒNG ĐỀ XUẤT(Trưởng phòng Tài chính \- Kế toán HBA) |
| :---- | :---- | :---- |
| *(Ký, ghi rõ họ tên và đóng dấu)*Ngày: ...... / ...... / 2026 | *(Ký và ghi rõ họ tên)*Ngày: ...... / ...... / 2026 | *(Ký và ghi rõ họ tên)*Ngày: ...... / ...... / 2026 |

