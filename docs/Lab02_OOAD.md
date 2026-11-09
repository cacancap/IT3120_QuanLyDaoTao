# BÀI THỰC HÀNH 2: BUSINESS MODELING – SYSTEM REQUIREMENTS – FUNCTIONAL MODELING

> **Đại học Bách Khoa Hà Nội**  
> **Trường Công nghệ Thông tin và Truyền thông (SoICT)**  
> *Slogan: ONE LOVE. ONE FUTURE.*

---

## MỤC LỤC
1. [Tổng quan nội dung thực hành](#1-tổng-quan-nội-dung-thực-hành)
2. [Phần 1: Business Modeling (Mô hình hóa nghiệp vụ)](#2-phần-1-business-modeling)
   - [Logic xuyên suốt & Thuật ngữ](#logic-xuyên-suốt--thuật-ngữ)
   - [Bối cảnh Case Study: Pet Care Booking System](#bối-cảnh-case-study-pet-care-booking-system)
   - [Bản chất của Business Process](#bản-chất-của-business-process)
   - [Xác định phạm vi quy trình](#xác-định-phạm-vi-quy-trình)
   - [Quy trình hiện tại: AS-IS Process](#quy-trình-hiện-tại-as-is-process)
   - [Phân tích Pain Points (Điểm đau) & Cơ hội cải tiến](#phân-tích-pain-points-và-cơ-hội-cải-tiến)
   - [Quy trình tương lai: TO-BE Process & Phân tích GAP](#quy-trình-tương-lai-to-be-process--phân-tích-gap)
   - [Nhiệm vụ Thực hành 1: Business Modeling](#nhiệm-vụ-thực-hành-1-business-modeling)
3. [Phần 2: Requirement Modeling (Mô hình hóa yêu cầu)](#3-phần-2-requirement-modeling)
   - [Từ nghiệp vụ đến yêu cầu hệ thống](#từ-nghiệp-vụ-đến-yêu-cầu-hệ-thống)
   - [Business Requirements (BR)](#business-requirements-br)
   - [Chuyển đổi từ Pain Points sang Business Requirements](#chuyển-đổi-từ-pain-points-sang-business-requirements)
   - [System Requirements (SR): Functional & Non-functional](#system-requirements-sr-functional--non-functional)
   - [Phân biệt Business Requirements và System Requirements](#phân-biệt-business-requirements-và-system-requirements)
   - [Phạm vi và ranh giới hệ thống (Scope)](#phạm-vi-và-ranh-giới-hệ-thống-scope)
   - [Stakeholders, Actors và Use Cases](#stakeholders-actors-và-use-cases)
   - [Xây dựng Use Case Model & Bảng truy vết (Traceability Matrix)](#xây-dựng-use-case-model--bảng-truy-vết)
   - [Nhiệm vụ Thực hành 2: Requirement Modeling](#nhiệm-vụ-thực-hành-2-requirement-modeling)
4. [Phần 3: Functional Modeling (Mô hình hóa chức năng)](#4-phần-3-functional-modeling)
   - [Chuỗi logic từ yêu cầu đến chức năng](#chuỗi-logic-từ-yêu-cầu-đến-chức-năng)
   - [Phân biệt Requirement – Function – Design – Use Case](#phân-biệt-requirement--function--design--use-case)
   - [Xác định System Functions từ System Requirements](#xác-định-system-functions-từ-system-requirements)
   - [Functional Decomposition (Phân rã chức năng)](#functional-decomposition-phân-rã-chức-năng)
   - [5 Nguyên tắc phân rã chức năng cốt lõi](#5-nguyên-tắc-phân-rã-chức-năng-cốt-lõi)
   - [System Function List & Mẫu mô tả chi tiết](#system-function-list--mẫu-mô-tả-chi-tiết)
   - [Requirements – Functions Mapping](#requirements--functions-mapping)
   - [Kiểm tra tính đầy đủ và nhất quán](#kiểm-tra-tính-đầy-đủ-và-nhất-quán)
   - [Nhiệm vụ Thực hành 3: Functional Modeling](#nhiệm-vụ-thực-hành-3-functional-modeling)
5. [Tổng kết & Bộ sản phẩm bàn giao (Deliverables)](#5-tổng-kết--bộ-sản-phẩm-bàn-giao-deliverables)

---

## 1. TỔNG QUAN NỘI DUNG THỰC HÀNH

Bài thực hành tập trung vào việc trả lời 3 câu hỏi nền tảng trong phân tích hệ thống:
1. **Phần 1. Business Modeling:** Phòng khám đang hoạt động như thế nào? Vấn đề/nỗi đau xảy ra ở đâu?
2. **Phần 2. Requirement Modeling:** Hệ thống cần đáp ứng những yêu cầu nào để hỗ trợ quy trình nghiệp vụ mới?
3. **Phần 3. Functional Modeling:** Hệ thống phải cung cấp những nhóm chức năng nào để thực hiện các yêu cầu đã xác định?

---

## 2. PHẦN 1: BUSINESS MODELING

### Logic xuyên suốt & Thuật ngữ
$$\text{Business Problem} \longrightarrow \text{Business Process AS-IS} \longrightarrow \text{Pain Points} \longrightarrow \text{Business Process TO-BE} \longrightarrow \text{Business Requirements}$$

* **Business Problem:** Vấn đề kinh doanh thực tế cần giải quyết.
* **Business Process:** Chuỗi các hoạt động có liên kết để tạo ra kết quả nghiệp vụ cụ thể.
* **Business Modeling:** Quá trình mô hình hóa cách các hoạt động nghiệp vụ được tổ chức và phối hợp.

---

### Bối cảnh Case Study: Pet Care Booking System
* **Chủ nuôi thú cưng gặp khó khăn khi:**
  * Không nắm được lịch trống của phòng khám.
  * Phải gọi điện/nhắn tin thủ công để đặt lịch.
  * Không có hệ thống nhắc lịch tự động $\rightarrow$ Dễ quên lịch hẹn.
* **Phòng khám thú y gặp khó khăn khi:**
  * Quản lý lịch thủ công qua sổ sách/tin nhắn $\rightarrow$ Dễ trùng lịch.
  * Không tối ưu hóa được công suất làm việc của bác sĩ.
* **Mục tiêu kinh doanh:**
  * Tăng số lượng lịch hẹn được phục vụ.
  * Giảm thời gian và chi phí quản lý lịch thủ công.
  * Cải thiện trải nghiệm và giữ chân khách hàng.

---

### Bản chất của Business Process
Business Process không chỉ đơn thuần là một danh sách công việc. Nó phải thể hiện được **trình tự**, **trách nhiệm** và **sự phối hợp** giữa các hoạt động.
Một Business Process hoàn chỉnh bắt buộc phải làm rõ 5 yếu tố:
1. **Trigger:** Điều gì kích hoạt quy trình? *(Ví dụ: Khách gửi yêu cầu đặt lịch).*
2. **Activities:** Những hoạt động nào sẽ diễn ra? *(Tiếp nhận, kiểm tra lịch, trao đổi, ghi nhận).*
3. **Roles:** Ai chịu trách nhiệm thực hiện từng bước? *(Khách hàng, Lễ tân, Bác sĩ).*
4. **Decisions:** Có những nhánh rẽ/lựa chọn nào? *(Có slot trống hay Hết slot).*
5. **Outcome:** Kết quả đầu ra là gì? *(Lịch hẹn được xác nhận hoặc thông báo từ chối).*

---

### Xác định phạm vi quy trình
* **Quy trình được chọn:** Đặt lịch khám cho thú cưng.
* **Điểm bắt đầu:** Chủ nuôi gửi yêu cầu đặt lịch.
* **Điểm kết thúc:** Lịch hẹn được xác nhận thành công hoặc nhận thông báo không thể đáp ứng.
* **Các bên tham gia dự kiến:** Chủ nuôi thú cưng, Nhân viên tiếp nhận (Lễ tân), Bác sĩ thú y, Người quản lý lịch khám.
* **Nằm ngoài phạm vi (Out of Scope):** Khám và điều trị thực tế, Kê đơn và quản lý thuốc, Thanh toán và kế toán dịch vụ.

---

### Quy trình hiện tại: AS-IS Process

* **Định nghĩa:** AS-IS mô tả cách thức nghiệp vụ **đang thực sự diễn ra** trong thực tế, không phải là một quy trình lý tưởng.

#### Mô hình luồng sơ bộ của AS-IS:
1. Chủ nuôi gửi yêu cầu khám (qua hotline/tin nhắn).
2. Nhân viên lễ tân tiếp nhận thông tin.
3. Nhân viên kiểm tra lịch của bác sĩ trên sổ sách.
4. **Rẽ nhánh quyết định:** Có giờ phù hợp không?
   * **Có:** Nhân viên trao đổi và thống nhất thời gian với khách $\rightarrow$ Ghi nhận lịch hẹn $\rightarrow$ Báo xác nhận với chủ nuôi.
   * **Không:** Tìm khung thời gian khác hoặc báo phòng khám chưa có lịch phù hợp $\rightarrow$ Lặp lại quá trình trao đổi.

#### Yêu cầu khi vẽ sơ đồ AS-IS:
* Có điểm Bắt đầu (*Start*) và Kết thúc (*End*).
* Đặt tên rõ ràng cho từng hoạt động, ghi rõ vai trò thực hiện.
* Nhánh quyết định phải chỉ rõ điều kiện hợp lệ.
* Thể hiện rõ các vòng lặp quay lại bước trước (đây chính là nơi tiềm ẩn điểm nghẽn/Pain Points).

---

### Phân tích Pain Points và Cơ hội cải tiến

* **Pain Point:** Là khó khăn, trở ngại hoặc điểm nghẽn kém hiệu quả trong trải nghiệm người dùng hoặc vận hành nghiệp vụ.
* **Phân biệt 3 cấp độ:**
  * *Triệu chứng:* Phải trao đổi qua lại nhiều lần.
  * *Nguyên nhân cốt lõi:* Không có nguồn dữ liệu lịch trống thống nhất, tập trung theo thời gian thực.
  * *Tác động:* Tăng thời gian xử lý của nhân viên, khách hàng mất kiên nhẫn.

#### Bảng ánh xạ Bước AS-IS – Pain Point giả định – Hướng cải tiến:

| Bước trong AS-IS | Pain Point giả định | Nguyên nhân giả định | Hướng cải tiến |
| :--- | :--- | :--- | :--- |
| **Tiếp nhận yêu cầu** | Thông tin đặt lịch chưa đầy đủ | Không có biểu mẫu chuẩn hóa | Cung cấp form đặt lịch chuẩn |
| **Kiểm tra lịch** | Nhân viên kiểm tra thủ công ở nhiều nơi, khó biết giờ trống | Lịch chưa được hiển thị tập trung | Chuẩn hóa và cập nhật lịch tập trung |
| **Trao đổi thời gian** | Phải liên hệ qua lại nhiều lần | Chưa có cách chọn giờ thuận tiện | Cho phép khách chủ động chọn khung giờ phù hợp |
| **Ghi nhận lịch** | Nguy cơ nhập sai thông tin hoặc trùng lịch hẹn | Chưa có bước kiểm tra khả dụng nhất quán trước khi lưu | Bổ sung cơ chế tự động kiểm tra slot trống khả dụng |
| **Xác nhận lịch** | Chủ nuôi phải chờ đợi lâu, không rõ trạng thái | Quy trình phản hồi chưa thống nhất | Quy định chuẩn hóa cách thông báo trạng thái đặt lịch |

> 📌 **Nguyên tắc cốt lõi:** Không phải Pain Point nào cũng giải quyết bằng phần mềm. Đôi khi chỉ cần điều chỉnh quy trình hoặc phân công nhiệm vụ. Mọi giải pháp công nghệ phải dựa trên nguyên nhân đã được xác minh.

---

### Quy trình tương lai: TO-BE Process & Phân tích GAP

* **TO-BE Business Process:** Mô tả cách thức nghiệp vụ vận hành sau khi ứng dụng phần mềm mới nhằm tối ưu hóa, loại bỏ nhược điểm của AS-IS, tăng năng suất và tự động hóa các tác vụ.
* **Phân tích GAP (GAP Analysis):** Cầu nối đo lường khoảng cách giữa *Hiện tại (As-Is)* và *Mục tiêu (To-Be)*, làm cơ sở trực tiếp để viết tài liệu đặc tả FRS/SRS.
* **Nguyên tắc thiết kế TO-BE:**
  * Bắt đầu từ các Pain Points đã xác định.
  * Giữ lại các hoạt động tạo giá trị, loại bỏ bước dư thừa.
  * Thêm hoạt động kiểm soát rủi ro.
  * Phân định rõ trách nhiệm giữa người và hệ thống.

#### Đề xuất luồng quy trình TO-BE:
$$\text{Chủ nuôi gửi yêu cầu online} \longrightarrow \text{Xem các khung giờ còn trống} \longrightarrow \text{Chọn giờ \& nhập thông tin} \longrightarrow \text{Hệ thống kiểm tra slot trống}$$
* **Nếu còn lịch:** Ghi nhận/xác nhận lịch tự động theo quy định.
* **Nếu hết lịch:** Yêu cầu chọn khung giờ khác.
* **Kết thúc:** Tự động gửi thông báo trạng thái cho chủ nuôi.

---

### Nhiệm vụ Thực hành 1: Business Modeling
* **03 Sản phẩm bắt buộc bàn giao:**
  1. Mô hình quy trình **AS-IS**.
  2. Bảng phân tích **Pain Points** (gắn liền với từng bước của AS-IS và chỉ rõ nguyên nhân).
  3. Mô hình quy trình **TO-BE** và diễn giải các thay đổi so với AS-IS.
* **Checklist kiểm tra chất lượng:**
  * AS-IS có phản ánh đúng thực trạng vận hành không?
  * Pain Points có gắn với từng bước cụ thể không?
  * TO-BE có giải quyết triệt để các Pain Points đã chọn không?
  * Các thay đổi có lý do nghiệp vụ thỏa đáng không?

---

## 3. PHẦN 2: REQUIREMENT MODELING

### Từ nghiệp vụ đến yêu cầu hệ thống
$$\text{Business Problem} \longrightarrow \text{AS-IS} \longrightarrow \text{Pain Points} \longrightarrow \text{TO-BE} \longrightarrow \text{Requirement Modeling}$$

Requirement Modeling có nhiệm vụ chuyển đổi các bước cải tiến nghiệp vụ trong TO-BE thành các yêu cầu có thể phân tích, kiểm thử và làm cơ sở cho thiết kế kiến trúc.

---

### Business Requirements (BR)
* **Định nghĩa:** Mô tả kết quả hoặc năng lực mà tổ chức cần đạt được để giải quyết Business Problem. Trả lời câu hỏi: *"Tổ chức cần cải thiện điều gì?"* (tập trung vào giá trị nghiệp vụ, không ép buộc giải pháp kỹ thuật).
* **Ví dụ Pet Clinic:**
  * **BR1:** Cải thiện khả năng tiếp cận thông tin lịch khám cho khách hàng.
  * **BR2:** Giảm công sức xử lý yêu cầu đặt lịch của nhân viên.
  * **BR3:** Nâng cao độ chính xác của lịch hẹn (hạn chế sai sót, trùng lịch).
  * **BR4:** Cải thiện khả năng theo dõi trạng thái đặt lịch.

---

### Chuyển đổi từ Pain Points sang Business Requirements

| Pain Point phát hiện | Business Requirement (Mã & Nội dung) |
| :--- | :--- |
| Chủ nuôi khó biết lịch trống | **BR1:** Cải thiện khả năng tiếp cận thông tin lịch khám |
| Nhân viên phải trao đổi nhiều lần | **BR2:** Giảm công sức xử lý yêu cầu đặt lịch của nhân viên |
| Nguy cơ ghi nhận lịch sai hoặc trùng | **BR3:** Nâng cao độ chính xác của lịch hẹn |
| Chủ nuôi không rõ trạng thái lịch | **BR4:** Cải thiện khả năng theo dõi trạng thái đặt lịch |

---

### System Requirements (SR): Functional & Non-functional

System Requirements mô tả những gì hệ thống phần mềm phải cung cấp hoặc đáp ứng để hỗ trợ nghiệp vụ.

#### 1. Functional Requirements (Yêu cầu chức năng - FR):
Mô tả hành vi hoặc năng lực xử lý cụ thể mà hệ thống phải có:
* **FR1 / SR1:** Hệ thống cho phép chủ nuôi xem các khung giờ khám còn trống.
* **FR2 / SR2:** Hệ thống cho phép chủ nuôi gửi thông tin đặt lịch trực tuyến.
* **FR3 / SR3:** Hệ thống tự động kiểm tra tính khả dụng của khung giờ trước khi ghi nhận.
* **FR4 / SR4:** Hệ thống lưu trữ thông tin lịch hẹn và trạng thái xử lý tương ứng.
* **FR5 / SR5:** Hệ thống tự động thông báo kết quả xử lý và gửi thông báo nhắc lịch.

#### 2. Non-functional Requirements (Yêu cầu phi chức năng - NFR):
Mô tả thuộc tính chất lượng, ràng buộc kỹ thuật hoặc hiệu năng:
* **NFR1 (Hiệu năng):** Thời gian phản hồi của hệ thống $< 2$ giây khi tra cứu lịch.
* **NFR2 (Bảo mật):** Đảm bảo an toàn thông tin cá nhân và dữ liệu thú cưng.
* **NFR3 (Độ sẵn sàng):** Hệ thống đảm bảo thời gian hoạt động ổn định đạt 99% uptime.
* **NFR4 (Khả dụng):** Hỗ trợ hiển thị tốt trên cả trình duyệt Web và thiết bị di động.

---

### Phân biệt Business Requirements và System Requirements

* Một **Business Requirement** trả lời *"Doanh nghiệp muốn gì"*, thường được hiện thực hóa bởi **nhiều System Requirements**.
* *Ví dụ:* Để đạt được **BR2 (Giảm công sức xử lý lịch của nhân viên)**, hệ thống cần các System Requirements sau:
  * *SR2.1:* Cho phép chủ nuôi tự gửi thông tin đặt lịch online.
  * *SR2.2:* Tự động kiểm tra tính khả dụng của khung giờ.
  * *SR2.3:* Lưu thông tin yêu cầu vào hàng đợi xử lý.
  * *SR2.4:* Hiển thị trạng thái xử lý yêu cầu tức thời.

---

### Phạm vi và ranh giới hệ thống (Scope)
* **Tên hệ thống:** Pet Clinic Appointment System (Hệ thống đặt lịch khám Pet Clinic).
* **Trong phạm vi (In Scope):**
  * Xem khung giờ trống, gửi yêu cầu đặt hẹn.
  * Kiểm tra tính khả dụng của slot khám.
  * Ghi nhận, lưu trữ và theo dõi trạng thái lịch hẹn.
  * Gửi thông báo kết quả và nhắc lịch.
* **Ngoài phạm vi phiên bản đầu (Out of Scope):**
  * Quản lý hồ sơ bệnh án điều trị chi tiết.
  * Kê đơn thuốc, quản lý kho thuốc và vật tư y tế.
  * Thanh toán, hóa đơn và hạch toán kế toán.

---

### Stakeholders, Actors và Use Cases

#### 1. Phân loại Stakeholders:
* **Primary (Sử dụng trực tiếp):** Chủ nuôi thú cưng (*Pet Owner*), Nhân viên tiếp nhận (*Receptionist*), Bác sĩ (*Veterinarian*).
* **Secondary (Hỗ trợ / Bị ảnh hưởng gián tiếp):** Chủ phòng khám (*Clinic Owner*), Kế toán (*Accountant*).
* **External (Hệ thống bên ngoài):** Cổng thanh toán (*Payment Gateway*), Nhà cung cấp (*Supplier*), Hệ thống tin nhắn SMS (*Notification System*).

#### 2. Bảng định danh Actors:

| Stakeholder | Actor (System) | Ghi chú vai trò |
| :--- | :--- | :--- |
| Chủ thú cưng | **Pet Owner** | Actor chính (ngoài hệ thống) |
| Lễ tân phòng khám | **Receptionist** | Actor nội bộ |
| Bác sĩ thú y | **Veterinarian** | Actor nội bộ |
| Dịch vụ gửi tin nhắn | **Notification System** | External Actor |

#### 3. Bảng danh sách Use Cases (Use Case List):

| Use Case | Primary Actor | Description |
| :--- | :--- | :--- |
| **View Available Slots** | Pet Owner | Xem các khung giờ khám còn trống |
| **Book Appointment** | Pet Owner | Nhập thông tin và gửi yêu cầu đặt lịch khám |
| **View Schedule** | Veterinarian | Xem danh sách lịch làm việc và bệnh nhân |
| **Manage Appointment** | Receptionist | Kiểm tra, điều chỉnh hoặc hủy lịch hẹn |
| **Send Reminder** | Notification System | Tự động gửi tin nhắn/email nhắc hẹn |

---

### Xây dựng Use Case Model & Bảng truy vết

#### Bảng truy vết System Requirements và Use Cases (Traceability Matrix):

| System Requirement | Use Case liên quan |
| :--- | :--- |
| **SR1:** Xem khung giờ có thể đặt | **UC1:** View Available Slots |
| **SR2:** Gửi yêu cầu đặt lịch | **UC2:** Book Appointment |
| **SR3:** Kiểm tra tính khả dụng | **UC2:** Book Appointment & **UC4:** Manage Appointment |
| **SR4:** Lưu lịch hẹn và trạng thái | **UC2:** Book Appointment & **UC4:** Manage Appointment |
| **SR5:** Thông báo kết quả và nhắc lịch | **UC3:** View Schedule & **UC5:** Send Reminder |

---

### Nhiệm vụ Thực hành 2: Requirement Modeling
* **06 Sản phẩm bắt buộc bàn giao:**
  1. Danh sách **Business Requirements** có gắn mã định danh chuẩn (BR1, BR2,...).
  2. Danh sách **Functional Requirements (FR)** và **Non-functional Requirements (NFR)**.
  3. Bản mô tả **Phạm vi và ranh giới hệ thống** (In-scope / Out-of-scope).
  4. Danh sách **Actor** và **Use Case List**.
  5. Sơ đồ **Use Case Diagram (UML chuẩn)** (thể hiện rõ System boundary, Actors, Use Cases, quan hệ `<<include>>`, `<<extend>>` nếu có).
  6. **Bảng truy vết (Traceability Matrix):** $\text{Business Requirements} \longrightarrow \text{System Requirements} \longrightarrow \text{Use Cases}$.

---

## 4. PHẦN 3: FUNCTIONAL MODELING

### Chuỗi logic từ yêu cầu đến chức năng
$$\text{Process TO-BE} \longrightarrow \text{Business Requirements} \longrightarrow \text{System Requirements / Use Cases} \longrightarrow \text{System Functions} \longrightarrow \text{Mapping}$$

Functional Modeling giúp chuyển các yêu cầu trừu tượng thành những nhóm năng lực cụ thể của hệ thống để làm cơ sở phân chia module và thiết kế kiến trúc phần mềm.

---

### Phân biệt Requirement – Function – Design – Use Case

* **Requirement (Yêu cầu):** Hệ thống *phải đáp ứng điều gì* cho nghiệp vụ? *(Vd: Khách cần biết khung giờ trống).*
* **Function (Chức năng):** Hệ thống *cần thực hiện khả năng gì* về mặt kỹ thuật/logic? *(Vd: Truy xuất và hiển thị dữ liệu lịch trống).*
* **Design (Thiết kế):** Chức năng đó *được hiện thực hóa và tổ chức như thế nào* bằng kiến trúc/lớp? *(Vd: Controller gọi Service truy vấn Repository).*
* **Use Case vs System Function:**
  * *Use Case:* Đứng từ **mục tiêu tương tác của Actor** *(Vd: Đặt lịch khám).*
  * *System Function:* Đứng từ **khả năng nội tại của hệ thống** *(Vd: Nhận thông tin $\rightarrow$ Kiểm tra hợp lệ $\rightarrow$ Kiểm tra slot $\rightarrow$ Lưu DB $\rightarrow$ Gửi thông báo).*
  * $\rightarrow$ **Một Use Case cần nhiều System Functions phối hợp; Một Function có thể phục vụ cho nhiều Use Cases.**

---

### Xác định System Functions từ System Requirements
* **SR1:** Cho phép chủ nuôi xem khung giờ có thể đặt $\longrightarrow$ **F01:** Hiển thị lịch trống.
* **SR2:** Cho phép chủ nuôi gửi yêu cầu đặt lịch $\longrightarrow$ **F02:** Tiếp nhận yêu cầu đặt lịch.
* **SR3:** Kiểm tra tính khả dụng của khung giờ $\longrightarrow$ **F03:** Kiểm tra lịch khả dụng.
* **SR4:** Lưu thông tin lịch hẹn và trạng thái $\longrightarrow$ **F04:** Xử lý yêu cầu & **F05:** Cập nhật trạng thái lịch hẹn.
* **SR5:** Thông báo kết quả xử lý $\longrightarrow$ **F06:** Thông báo kết quả cho chủ nuôi.

---

### Functional Decomposition (Phân rã chức năng)

Functional Decomposition là quá trình bóc tách chức năng tổng thể của hệ thống thành các module và các chức năng con có quan hệ phân cấp hình cây (*hierarchy*).

#### Cây phân rã chức năng mẫu (Pet Care System):
```text
Pet Care System
│
├── 1. Appointment Management (Quản lý lịch hẹn)
│   ├── 1.1 View Available Slots (Xem lịch trống)
│   ├── 1.2 Book Appointment (Đặt lịch hẹn)
│   ├── 1.3 Cancel Appointment (Hủy lịch hẹn)
│   └── 1.4 Reschedule Appointment (Đổi lịch hẹn)
│
├── 2. Pet Profile Management (Quản lý hồ sơ thú cưng)
│   ├── 2.1 Create Pet Profile (Tạo mới hồ sơ)
│   ├── 2.2 Update Pet Info (Cập nhật thông tin)
│   └── 2.3 View Pet History (Xem lịch sử khám)
│
├── 3. Health Tracking (Theo dõi sức khỏe)
│   ├── 3.1 Record Health Data (Ghi nhận chỉ số)
│   ├── 3.2 View Health History (Xem tiến trình bệnh)
│   └── 3.3 Analyze Health Trends (Phân tích xu hướng sức khỏe)
│
└── 4. Notification Management (Quản lý thông báo)
    ├── 4.1 Send Booking Confirmation (Gửi xác nhận đặt lịch)
    ├── 4.2 Send Reminder (Gửi thông báo nhắc lịch)
    └── 4.3 Send Cancellation Notice (Gửi thông báo hủy lịch)
```

---

### 5 Nguyên tắc phân rã chức năng cốt lõi
1. **Có căn cứ:** Mỗi chức năng con phải trực tiếp hỗ trợ ít nhất một yêu cầu hoặc mục tiêu nghiệp vụ.
2. **Nhất quán:** Các chức năng trong cùng một nhóm phải có tính liên quan chặt chẽ về mặt mục đích.
3. **Hạn chế trùng lặp:** Tránh tạo nhiều chức năng khác tên nhưng bản chất cùng một hành vi xử lý.
4. **Đúng mức độ chi tiết:** Không dừng ở mức quá chung chung, nhưng cũng không đi quá sâu vào từng thao tác nút bấm giao diện.
5. **Đủ phạm vi:** Đảm bảo tất cả các System Requirements trọng yếu đều được hiện thực hóa bởi các chức năng.

---

### System Function List & Mẫu mô tả chi tiết

#### 1. Bảng System Function List:

| Mã ID | Tên chức năng | Mô tả tóm tắt năng lực hệ thống |
| :--- | :--- | :--- |
| **F01** | Xem lịch trống | Truy xuất và hiển thị danh sách các khung giờ có thể đặt |
| **F02** | Tiếp nhận yêu cầu | Tiếp nhận và kiểm tra thông tin đặt lịch ban đầu từ người dùng |
| **F03** | Kiểm tra lịch khả dụng | Kiểm tra khả năng tiếp nhận của bác sĩ tại khung giờ được yêu cầu |
| **F04** | Xử lý yêu cầu đặt lịch | Hỗ trợ xác nhận hoặc từ chối lịch hẹn theo quy tắc nghiệp vụ |
| **F05** | Cập nhật trạng thái | Ghi nhận và thay đổi trạng thái xử lý lịch hẹn trong cơ sở dữ liệu |
| **F06** | Thông báo kết quả | Tự động tạo và gửi thông báo kết quả xử lý cho chủ nuôi |

#### 2. Mẫu mô tả chức năng ở mức phân tích (Ví dụ F03):
* **Function ID:** `F03`
* **Tên chức năng:** Kiểm tra lịch khả dụng (*Check Slot Availability*)
* **Mục đích:** Ngăn ngừa việc ghi nhận lịch trùng hoặc đặt vào khung giờ bác sĩ không thể tiếp nhận.
* **Mô tả:** Hệ thống đối soát khung giờ được yêu cầu với lịch làm việc thực tế của bác sĩ và các lịch hẹn đã xác nhận trước đó theo quy tắc không vượt quá công suất.
* **Yêu cầu liên quan:** `SR3` (Hệ thống kiểm tra tính khả dụng trước khi ghi nhận).
* **Use Case liên quan:** *Book Appointment*, *Manage Appointment*.

---

### Requirements – Functions Mapping

| System Requirement | System Function tương ứng |
| :--- | :--- |
| **SR1:** Xem khung giờ có thể đặt | **F01:** Xem lịch trống |
| **SR2:** Gửi yêu cầu đặt lịch | **F02:** Tiếp nhận yêu cầu đặt lịch |
| **SR3:** Kiểm tra tính khả dụng | **F03:** Kiểm tra lịch khả dụng |
| **SR4:** Lưu lịch hẹn và trạng thái | **F04:** Xử lý yêu cầu & **F05:** Cập nhật trạng thái |
| **SR5:** Thông báo kết quả | **F06:** Thông báo kết quả cho chủ nuôi |

---

### Kiểm tra tính đầy đủ và nhất quán
* **Kiểm tra từ Yêu cầu $\rightarrow$ Chức năng:** Mọi System Requirement bắt buộc phải có ít nhất một System Function hỗ trợ.
* **Kiểm tra từ Chức năng $\rightarrow$ Yêu cầu:** Không đưa vào các chức năng thừa thãi ("tính năng ma") mà không gắn với yêu cầu hay Use Case nào.
* **Đối chiếu với quy trình TO-BE:** Đảm bảo toàn bộ các bước nghiệp vụ mà hệ thống tham gia xử lý đều có chức năng tương ứng.

---

### Nhiệm vụ Thực hành 3: Functional Modeling
* **04 Đầu ra bắt buộc bàn giao:**
  1. Bản sơ đồ cây phân rã chức năng (**Functional Decomposition**) hoàn chỉnh (ít nhất 10 System Functions).
  2. Bảng danh mục chức năng (**System Function List**) có mã định danh và mô tả mục đích.
  3. Bảng ánh xạ **Requirements – Functions Mapping**.
  4. Danh sách các giả định kỹ thuật hoặc yêu cầu cần làm rõ thêm với các bên liên quan.

---

## 5. TỔNG KẾT & BỘ SẢN PHẨM BÀN GIAO (DELIVERABLES)

Toàn bộ chuỗi lập luận logic được chuẩn hóa từ đầu đến cuối:

$$\begin{aligned}
\text{Business Problem} &\longrightarrow \text{JTBD (Why)} \\
&\longrightarrow \text{AS-IS Process (How current)} \\
&\longrightarrow \text{Pain Points} \\
&\longrightarrow \text{TO-BE Process (How new)} \\
&\longrightarrow \text{Business Requirements (What needed)} \\
&\longrightarrow \text{System Requirements (How system)} \\
&\longrightarrow \text{Use Case (Interaction)}
\end{aligned}$$

### Danh mục hồ sơ Deliverables bài thực hành 2:
1. **Stakeholder & Actor List** (Phân loại chi tiết).
2. **JTBD (Jobs-To-Be-Done)** & Bản phân tích vấn đề nghiệp vụ.
3. **Mô hình quy trình AS-IS, Bảng Pain Points và Quy trình TO-BE**.
4. **Bảng danh mục Business Requirements** chuẩn hóa.
5. **Bảng danh mục System Requirements** (Phân chia Functional & Non-functional).
6. **Use Case List & Sơ đồ Use Case Diagram (UML chuẩn)**.
7. **Cây phân rã chức năng (Functional Decomposition) & System Function List**.
8. **Ma trận truy vết toàn diện (Traceability Matrix)**: $\text{BR} \longrightarrow \text{SR} \longrightarrow \text{Use Cases} \longrightarrow \text{Functions}$.
