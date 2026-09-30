# PHỤ LỤC: QUY TẮC NGHIỆP VỤ (BUSINESS RULES - BR)

| Mã BR | Tên Quy tắc | Nội dung Chi tiết | Module quản lý |
|---|---|---|---|
| **BR-01** | Tiên quyết bắt buộc | Sinh viên chỉ được đăng ký Học phần nếu đã đạt các Học phần tiên quyết tương ứng. | REG / GRD[cite: 2] |
| **BR-02** | Giới hạn tín chỉ đăng ký | Số tín chỉ đăng ký/kỳ ∈ [MIN, MAX]. Giá trị MAX giảm theo Mức cảnh báo học vụ (Mức 0: 24TC, Mức 1: 18TC, Mức 2: 14TC, Mức 3: 8TC). | REG / GRD[cite: 2] |
| **BR-03** | Trùng kíp học | Sinh viên không được đăng ký 2 Lớp học phần có khung thời gian (ScheduleSlot) bị trùng lặp. | REG / SCH[cite: 2] |
| **BR-04** | Sĩ số tối đa | Số lượng đăng ký hợp lệ không được vượt quá sĩ số tối đa (`maxSize`) của Lớp học phần. | REG / SCH[cite: 2] |
| **BR-05** | Khung thời gian đợt đăng ký | Thao tác Đăng ký / Rút học phần chỉ được thực hiện trong thời gian Đợt đăng ký đang mở (`RegistrationPeriod.status = OPEN`). | REG[cite: 2] |
| **BR-06** | Tính học phí | Học phí Lớp HP = `Số tín chỉ` × `Đơn giá tín chỉ` × `Hệ số học phần`. | REG[cite: 2] |
| **BR-07** | Điểm học phần | Điểm HP = Σ(`Trọng số` × `Điểm thành phần`). Làm tròn đến 1 chữ số thập phân. | GRD[cite: 2] |
| **BR-08** | Tính GPA / CPA | GPA (kỳ) và CPA (tích lũy) tính theo trung bình có trọng số tín chỉ trên Thang điểm 4. Khi học lại, lấy điểm cao nhất. | GRD[cite: 2] |
| **BR-09** | Cảnh báo học vụ | Mức cảnh báo (0, 1, 2, 3) xác định dựa trên ngưỡng CPA và số tín chỉ nợ tích lũy theo Quy chế đào tạo. | GRD[cite: 2] |
| **BR-10** | Quyền nhập điểm | Chỉ Giảng viên được phân công phụ trách Lớp học phần mới có quyền nhập/chỉnh sửa điểm lớp đó. | GRD / SCH[cite: 2] |