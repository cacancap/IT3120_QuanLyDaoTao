# ĐẶC TẢ CA SỬ DỤNG: UC-CUR-01
## Xây dựng và Cập nhật Khung Chương trình Đào tạo (Module CUR)

| Hạng mục | Nội dung chi tiết |
|---|---|
| **Mã Use Case** | `UC-CUR-01` |
| **Tên Use Case** | Xây dựng và cập nhật khung Chương trình Đào tạo (CTĐT) |
| **Tác nhân chính** | Cán bộ Phòng Đào tạo (Academic Affairs Staff) |
| **Tác nhân phụ** | Cán bộ Khoa/Viện (Đề xuất học phần và cấu trúc khối kiến thức) |
| **Mô tả tóm tắt** | Cho phép Cán bộ Đào tạo thêm/sửa học phần vào khung CTĐT của một ngành và thiết lập điều kiện học phần tiên quyết, đồng thời hệ thống tự động kiểm tra ngăn chặn triệt để vòng lặp tiên quyết bằng thuật toán đồ thị DAG. |
| **Sự kiện kích hoạt** | Cán bộ Đào tạo chọn chức năng "Quản lý Khung CTĐT" trên hệ thống. |
| **Tiền điều kiện** | - Người dùng đã đăng nhập với vai trò Cán bộ Phòng Đào tạo.<br>- Danh mục Ngành (`Major`), Khóa đào tạo và danh mục Học phần (`Course`) cơ bản đã tồn tại trong hệ thống. |
| **Hậu điều kiện** | - Khung CTĐT (`Program`) và các ràng buộc tiên quyết (`Prerequisite`) được lưu trữ hợp lệ vào CSDL.<br>- Đảm bảo đồ thị môn học tiên quyết là đồ thị có hướng không chu trình (Directed Acyclic Graph - DAG). |

---

### 1. Luồng sự kiện chính (Main Success Scenario)
1. Cán bộ Đào tạo truy cập màn hình Quản lý Chương trình Đào tạo (`CurriculumPage`) và chọn một Khung CTĐT cần cấu hình (`programId`).
2. Hệ thống gọi `CurriculumController.getProgramDetails(programId)` để truy xuất và hiển thị thông tin chi tiết của CTĐT cùng danh sách các học phần hiện có (chia theo kỳ học gợi ý và khối kiến thức đại cương / cơ sở ngành / chuyên ngành).
3. Cán bộ Đào tạo chọn thêm học phần mới vào kỳ học mong muốn và thiết lập danh sách các mã học phần tiên quyết (`Prerequisite`) cho học phần đó.
4. Cán bộ Đào tạo nhấn nút "Lưu Khung CTĐT".
5. Hệ thống kiểm tra tính hợp lệ của dữ liệu đầu vào (số tín chỉ $> 0$, học kỳ dự kiến từ $1$ đến $10$).
6. Hệ thống ủy quyền cho `DAGCycleDetectorService` chạy thuật toán kiểm tra chu trình trên đồ thị có hướng (DFS 3-Coloring) đối với toàn bộ cây môn học tiên quyết.
7. Hệ thống xác nhận không tồn tại chu trình phụ thuộc lặp và mở Transaction lưu cấu hình vào bảng `programs`, `program_courses` và `prerequisites`.
8. Hệ thống thông báo cập nhật Khung CTĐT thành công và hiển thị lại cây cấu trúc đã chuẩn hóa.

---

### 2. Luồng sự kiện thay thế & Ngoại lệ (Exception Flows)
- **5a. Dữ liệu đầu vào không hợp lệ:** Hệ thống báo lỗi chi tiết tại ô nhập liệu (ví dụ: Số tín chỉ không hợp lệ, học kỳ gợi ý ngoài khoảng cho phép) và yêu cầu sửa đổi.
- **6a. Phát hiện vòng lặp tiên quyết (Deadlock học tập):**
  - *Ngữ cảnh:* Học phần $A$ tiên quyết $B$, $B$ tiên quyết $C$, nhưng người dùng lại thiết lập $C$ tiên quyết $A$.
  - 6a.1. Hệ thống chặn thao tác lưu, trích xuất chuỗi đường đi gây ra chu trình lặp: $\text{Cycle Trace} = [A \to B \to C \to A]$.
  - 6a.2. Hệ thống hiển thị cảnh báo đỏ trên giao diện:  
    *"Lỗi vi phạm cấu trúc đồ thị tiên quyết: Phát hiện vòng lặp phụ thuộc giữa các học phần: A → B → C → A. Vui lòng điều chỉnh lại điều kiện tiên quyết trước khi lưu!"*
  - 6a.3. Hệ thống highlight các cạnh môn học gây lỗi trên sơ đồ trực quan.

---

### 3. Mô hình Toán học & Thuật toán Kiểm tra Chu trình DAG (DAG Cycle Detection)

#### 3.1. Mô hình hóa bài toán bằng Đồ thị có Hướng
* Gọi $G = (V, E)$ là đồ thị có hướng mô tả cây môn học của một Chương trình Đào tạo:
  * Tập đỉnh $V$: Tập hợp tất cả các học phần thuộc khung CTĐT ($|V| \approx 50 - 70$ môn).
  * Tập cạnh $E$: Tập hợp các quan hệ tiên quyết có hướng. Mỗi cạnh có hướng $e = (u, v) \in E$ thể hiện rằng: **Học phần $u$ là điều kiện tiên quyết bắt buộc phải học trước học phần $v$**.
* **Định lý Tính khả thi của CTĐT:**  
  Một khung CTĐT chỉ có thể vận hành được trong thực tế khi và chỉ khi đồ thị $G = (V, E)$ là một **Đồ thị Có hướng Không Chu trình (Directed Acyclic Graph - DAG)**.  
  Nếu $G$ chứa bất kỳ chu trình nào $v_1 \to v_2 \to \dots \to v_k \to v_1$, sinh viên sẽ rơi vào tình trạng "Deadlock học tập" (muốn học $v_1$ phải học $v_k$, nhưng muốn học $v_k$ lại phải học $v_1$), dẫn tới việc không bao giờ có thể hoàn thành chương trình đào tạo.

#### 3.2. Thuật toán Duyệt theo chiều sâu với Kỹ thuật Tô 3 Màu (DFS 3-Coloring)
Thuật toán phân loại trạng thái của từng đỉnh $u \in V$ theo 3 màu:
* **WHITE (Trắng - Giá trị 0):** Đỉnh chưa được duyệt tới.
* **GRAY (Xám - Giá trị 1):** Đỉnh đang nằm trong ngăn xếp đệ quy hiện tại (đang duyệt dở các đỉnh con).
* **BLACK (Đen - Giá trị 2):** Đỉnh đã hoàn tất duyệt toàn bộ nhánh con và không có chu trình.

**Dấu hiệu nhận biết Chu trình:**  
Trong quá trình duyệt DFS từ đỉnh $u$, nếu gặp một đỉnh kề $v$ có trạng thái **`color[v] == GRAY`**, thì cạnh $(u, v)$ chính là một **Cạnh ngược (Back-edge)**, chứng minh đồ thị có chu trình.

#### 3.3. Mã giả Thuật toán (Algorithm Pseudo-code)

```python
class DAGCycleDetector:
    WHITE = 0  # Chưa thăm
    GRAY = 1   # Đang duyệt (nằm trong recursion stack)
    BLACK = 2  # Đã hoàn tất duyệt

    def detect_cycle(self, courses: List[str], prerequisites: List[Tuple[str, str]]) -> Tuple[bool, List[str]]:
        # 1. Xây dựng danh sách kề (Adjacency List)
        # Cạnh (u, v) nghĩa là u tiên quyết v
        adj = {course: [] for course in courses}
        for u, v in prerequisites:
            adj[u].append(v)

        color = {course: self.WHITE for course in courses}
        parent = {course: None for course in courses}
        cycle_path = []

        # 2. Hàm đệ quy DFS
        def dfs_visit(u: str) -> bool:
            color[u] = self.GRAY

            for v in adj[u]:
                if color[v] == self.GRAY:
                    # Phát hiện cạnh ngược (Back-edge) -> Có chu trình!
                    # Lần vết chu trình (Cycle trace)
                    curr = u
                    cycle_path.append(v)
                    while curr != v and curr is not None:
                        cycle_path.append(curr)
                        curr = parent[curr]
                    cycle_path.append(v)
                    cycle_path.reverse()
                    return True

                if color[v] == self.WHITE:
                    parent[v] = u
                    if dfs_visit(v):
                        return True

            color[u] = self.BLACK
            return False

        # 3. Duyệt toàn bộ các đỉnh trong đồ thị
        for course in courses:
            if color[course] == self.WHITE:
                if dfs_visit(course):
                    return (True, cycle_path)

        return (False, [])
```

#### 3.4. Đánh giá Độ phức tạp (Complexity Analysis)
* **Độ phức tạp Thời gian (Time Complexity):** $\mathcal{O}(|V| + |E|)$, trong đó $|V|$ là số học phần ($\approx 60$) và $|E|$ là số điều kiện tiên quyết ($\approx 80$). Thuật toán duyệt qua mỗi đỉnh và mỗi cạnh tối đa 1 lần, thời gian thực thi trên máy chủ $< 2\text{ms}$, hoàn toàn đáp ứng yêu cầu thời gian thực.
* **Độ phức tạp Không gian (Space Complexity):** $\mathcal{O}(|V|)$ để lưu trữ mảng màu `color`, danh sách cha `parent` và ngăn xếp đệ quy gọi hàm.

---

### 4. Danh mục Biểu đồ Mô hình hóa (UML Artifacts)

Toàn bộ các biểu đồ mô hình hóa cho ca sử dụng `UC-CUR-01` đã được thiết kế chuẩn xác bằng PlantUML và kết xuất tự động ra ảnh PNG:

1. **Biểu đồ Hoạt động phân làn (Activity Diagram with Swimlanes):**
   * Mã nguồn: [`diagrams/01-cur/UC-CUR-01-activity.puml`](../../diagrams/01-cur/UC-CUR-01-activity.puml)
   * Ảnh kết xuất: [`renders/01-cur/UC-CUR-01-activity.png`](../../renders/01-cur/UC-CUR-01-activity.png)
2. **Biểu đồ Lớp Phân tích (BCE Class Diagram):**
   * Mã nguồn: [`diagrams/01-cur/UC-CUR-01-bce.puml`](../../diagrams/01-cur/UC-CUR-01-bce.puml)
   * Ảnh kết xuất: [`renders/01-cur/UC-CUR-01-bce.png`](../../renders/01-cur/UC-CUR-01-bce.png)
3. **Biểu đồ Trình tự Phân tích (BCE Sequence Diagram):**
   * Mã nguồn: [`diagrams/01-cur/UC-CUR-01-sequence.puml`](../../diagrams/01-cur/UC-CUR-01-sequence.puml)
   * Ảnh kết xuất: [`renders/01-cur/UC-CUR-01-sequence.png`](../../renders/01-cur/UC-CUR-01-sequence.png)
4. **Biểu đồ Máy Trạng thái Vòng đời Lớp học phần (`ClassSection` Lifecycle):**
   * Mã nguồn: [`diagrams/01-cur/state-class-section.puml`](../../diagrams/01-cur/state-class-section.puml)
   * Ảnh kết xuất: [`renders/01-cur/state-class-section.png`](../../renders/01-cur/state-class-section.png)
