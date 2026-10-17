---
name: google-docs-sync
description: >-
  Workflows and instructions for collaborating on and syncing the IT3120 academic report
  between local Markdown files and Google Docs using the Google Workspace MCP.
---

# Google Docs Sync Skill for IT3120 Academic Report

Skill này hướng dẫn quy trình đồng bộ nội dung báo cáo học thuật giữa GitHub repository và tài liệu làm việc chính thức của nhóm trên **Google Docs** thông qua công cụ MCP `google-workspace`.

---

## 1. Thông tin Tài liệu Làm việc Chính thức

* **Đường dẫn Google Docs của Nhóm:**  
  `https://docs.google.com/document/d/1jiKlOosNQs4pjGGe4y44H7tnXUyxFF-9uj6AfKUexWs/edit`
* **Document ID trích xuất:**  
  `1jiKlOosNQs4pjGGe4y44H7tnXUyxFF-9uj6AfKUexWs`

---

## 2. Quy trình Làm việc Khuyến nghị (Hybrid Workflow)

```
      [ GitHub Repo ]                                   [ Google Docs ]
docs/, report/, diagrams/  ──(Biên soạn & Review)──>  Tài liệu Báo cáo Nhóm
  • Quản lý mã nguồn .puml                             • Trình bày format cuối
  • Xuất ảnh render .png                               • Nhúng hình ảnh sơ đồ
  • Rà soát logic & BR                                 • Nộp bài giảng viên
```

1. **Biên soạn cục bộ (Local First):**
   * Các bản nháp nội dung từng chương được soạn thảo và kiểm tra tính nhất quán trong `report/drafts/` hoặc `docs/`.
   * Toàn bộ sơ đồ PlantUML được kết xuất sang ảnh `.png` trong thư mục `renders/`.
2. **Đồng bộ hóa lên Google Docs:**
   * Sử dụng các công cụ thuộc MCP `google-workspace`:
     * `docs.getText(documentId: "1jiKlOosNQs4pjGGe4y44H7tnXUyxFF-9uj6AfKUexWs")`: Đọc nội dung hiện có trên tài liệu để đối chiếu tiến độ.
     * `docs.appendText`: Thêm các phần nội dung đã chốt theo khung mục lục [`report/report-outline.md`](file:///d:/SourceCodes/Java_SourceCodes/IT3120_QuanLyDaoTao/report/report-outline.md).
     * `docs.find`: Định vị tiêu đề mục cần cập nhật.

---

## 3. Tiêu chuẩn Định dạng Báo cáo Học thuật SOICT

Khi chuyển tải nội dung lên Google Docs:
* **Tiêu đề phân cấp:** Tuân thủ đúng phân cấp Heading 1 (Chương), Heading 2 (Mục lớn), Heading 3 (Tiểu mục) như quy định trong `report/report-outline.md`.
* **Bảng biểu:** Có số thứ tự và tiêu đề đặt **phía trên** bảng (VD: *Bảng 2.1: Danh mục 10 quy tắc nghiệp vụ*).
* **Hình vẽ/Biểu đồ:** Có số thứ tự và tiêu đề đặt **phía dưới** hình (VD: *Hình 3.4: Biểu đồ trình tự UC-REG-01 Đăng ký học phần*).
* **Công thức toán học:** Thể hiện rõ ràng các chỉ số trên/dưới và giải thích đầy đủ các biến số.
