# 🚀 Lộ trình 7 ngày học Robot Framework thực chiến cho Automation Tester

Lộ trình này được thiết kế dành cho các tester (đặc biệt là tester manual đang chuyển sang automation) muốn học Robot Framework theo từng bước và áp dụng ngay vào dự án thực tế (test UI, API, data-driven, tích hợp CI/CD…)

---

## 🟢 Ngày 1: Nền tảng và kiến thức cốt lõi

### 🎯 Mục tiêu:
- Hiểu được kiến trúc của Robot Framework
- Viết được test case đầu tiên

### 🧠 Prompt nên dùng:
1. `Hãy hướng dẫn tôi học Robot Framework từ A-Z, bao gồm cài đặt, cấu trúc, từ khóa cơ bản và chạy testcase đầu tiên.`
2. `Giải thích cấu trúc của một file .robot, vai trò của *** Settings ***, *** Test Cases ***, *** Keywords ***.`
3. `So sánh Robot Framework với Selenium WebDriver/Python về ưu nhược điểm khi làm UI test.`

---

## 🟡 Ngày 2: UI Testing cơ bản với SeleniumLibrary

### 🎯 Mục tiêu:
- Tự động kiểm thử form đăng nhập, điều hướng, nhập liệu

### 🧠 Prompt nên dùng:
4. `Viết test case Robot Framework để kiểm tra chức năng đăng nhập với dữ liệu đúng và sai.`
5. `Hướng dẫn cách dùng SeleniumLibrary để tìm và tương tác với button, input, checkbox.`
6. `Làm sao để đợi một element xuất hiện trên màn hình trong Robot Framework?`

---

## 🟠 Ngày 3: Luồng test UI phức tạp + xử lý nâng cao

### 🎯 Mục tiêu:
- Kiểm thử nhiều bước liên tiếp + xử lý alert, dropdown, iframe, tab

### 🧠 Prompt nên dùng:
7. `Viết test case để test luồng: Đăng nhập → Vào trang thiết bị → Kiểm tra danh sách thiết bị hiển thị.`
8. `Giải thích cách xử lý dropdown, alert, iframe, tab mới bằng Robot Framework.`

---

## 🔵 Ngày 4: Kiểm thử REST API với RequestsLibrary

### 🎯 Mục tiêu:
- Gọi và kiểm thử REST API: đăng nhập, xác thực, kiểm tra kết quả trả về

### 🧠 Prompt nên dùng:
9. `Giới thiệu RequestsLibrary và cách gọi API GET, POST, PUT trong Robot Framework.`
10. `Viết test case kiểm tra API đăng nhập, nhận access token và dùng token cho các API tiếp theo.`
11. `Làm sao để validate response body, status code, header khi test API bằng Robot Framework?`

---

## 🔴 Ngày 5: Test theo dữ liệu + mở rộng từ khóa

### 🎯 Mục tiêu:
- Chạy test với nhiều dữ liệu khác nhau, viết từ khóa tùy chỉnh mở rộng bằng Python

### 🧠 Prompt nên dùng:
12. `Robot Framework có hỗ trợ Data-Driven Test không? Hãy cho ví dụ.`
13. `Hướng dẫn cách tạo từ khóa riêng bằng Python rồi dùng trong file .robot.`
14. `Tôi muốn test API có xác thực Bearer Token, hãy viết mẫu giúp tôi.`

---

## 🟣 Ngày 6: Tổ chức test + quản lý tag + module

### 🎯 Mục tiêu:
- Chia nhỏ test suite, tái sử dụng tài nguyên, quản lý linh hoạt bằng tag

### 🧠 Prompt nên dùng:
15. `Hướng dẫn cách chia nhiều test case ra nhiều file, dùng chung các từ khóa (keywords).`
16. `Tôi muốn chạy test theo tag, nhóm, hoặc theo tên testcase. Làm như thế nào?`
17. `Tôi đang dùng Robot Framework để test dự án thật, làm sao quản lý test case hiệu quả bằng Git?`

---

## 🟤 Ngày 7: Báo cáo, tích hợp CI/CD và tổng hợp

### 🎯 Mục tiêu:
- Tạo báo cáo đẹp, tích hợp GitHub/GitLab CI, tổng kết toàn bộ quá trình

### 🧠 Prompt nên dùng:
18. `Làm sao để tạo báo cáo đẹp hơn cho Robot Framework (Allure Report chẳng hạn)?`
19. `Robot Framework có thể test trên cloud browser (BrowserStack, LambdaTest) không? Cấu hình như thế nào?`
20. `Tôi cần test luồng login → xem danh sách sản phẩm → tạo đơn hàng → xác nhận. Hãy viết test suite Robot Framework.`

---

## 📁 Bonus

Bạn có thể yêu cầu thêm:
- Cấu trúc thư mục project mẫu (`tests/`, `resources/`, `data/`)
- Test case mẫu cho từng ngày theo roadmap này
- Export ra PDF, Markdown hoặc README GitHub

---