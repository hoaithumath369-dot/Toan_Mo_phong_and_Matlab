# Toan_Mo_phong_and_Matlab
Đây là nơi ghi lại quá trình học môn Toán mô phỏng và Matlab

# 📘 TỔNG HỢP KIẾN THỨC MATLAB & MÔ HÌNH HÓA HỆ THỐNG

Tài liệu này tổng hợp các lệnh cơ bản trong MATLAB, thao tác với biến, ma trận, đồ thị 2D và một số bài tập ứng dụng (như giải bài toán động học cơ cấu tay quay con trượt).

---

## 📑 Mục lục
1. [Khái niệm mở đầu](#1-khái-niệm-mở-đầu)
2. [Lệnh hệ thống & Cú pháp cơ bản](#2-lệnh-hệ-thống--cú-pháp-cơ-bản)
3. [Hàm toán học & Số phức](#3-hàm-toán-học--số-phức)
4. [Nhập/Xuất & Định dạng dữ liệu](#4-nhậpxuất--định-dạng-dữ-liệu)
5. [Vector & Ma trận](#5-vector--ma-trận)
6. [Đồ họa 2D](#6-đồ-họa-2d)
7. [Bài tập & Code mẫu](#7-bài-tập--code-mẫu)

---

## 1. Khái niệm mở đầu
**Vai trò của Mô hình hóa hệ thống:**
* Biểu diễn bằng **Phương trình toán học**.
* Chuyển đổi thành **Hàm truyền**.
* Xây dựng **Hệ phương trình trạng thái (PTTT)**.

---

## 2. Lệnh hệ thống & Cú pháp cơ bản
MATLAB có đặc điểm là **không cần khai báo kiểu dữ liệu** và tự động nhận diện biến. 

| Lệnh / Phím tắt | Chức năng |
| :--- | :--- |
| `Ctrl + C` | Dừng lệnh đang chạy (khi bị lặp vô hạn hoặc không nhấc lệnh). |
| `ans` | Biến tạm lưu kết quả gần nhất (Hạn chế lạm dụng). |
| `...` | Viết tiếp lệnh xuống dòng (không dùng Shift+Enter). |
| `;` | Kết thúc lệnh, thực thi nhưng **không hiển thị** kết quả ra màn hình. |
| `,` | Ngăn cách các lệnh nếu viết nhiều lệnh trên cùng một dòng. |
| `who` | Liệt kê danh sách các biến đang có trong vùng làm việc (Workspace). |
| `clear a` | Xóa biến `a` khỏi bộ nhớ. |
| `clear all` | Xóa tất cả các biến. |
| `help [tên_lệnh]`| Tra cứu công dụng của lệnh. (Hoặc bôi đen lệnh + nhấn `F1`). |
| `lookfor [từ_khóa]`| Tìm kiếm tất cả các lệnh có chứa từ khóa đó. |
| `%` / `Ctrl + R` | Tạo ghi chú (comment) trong code. |

---

## 3. Hàm toán học & Số phức

### Toán học cơ bản
* `sqrt(x)`: Căn bậc 2.
* `exp(x)`: Hàm mũ cơ số $e$ ($e^x$).
* `rem(x, y)` / `mod(x, y)`: Tìm phần dư của phép chia $x$ cho $y$.
* `log10(x)`: Logarit cơ số 10.
* `log(x)`: Logarit tự nhiên (ln).

### Làm tròn số
* `round(x)`: Làm tròn về số nguyên gần nhất.
* `ceil(x)`: Làm tròn lên (Ví dụ: `ceil(2.1)` -> `3`).
* `floor(x)`: Làm tròn xuống (Ví dụ: `floor(2.9)` -> `2`).

### Số phức ($z = a + bi$)
* `z = complex(a, b)`: Khởi tạo số phức.
* `real(z)` / `imag(z)`: Lấy phần thực / phần ảo.
* `abs(z)`: Tính module (độ lớn).
* `angle(z)`: Tính góc pha (argument) theo radian. 
  *(Mẹo đổi sang độ: `angle(z) * 180 / pi` hoặc dùng hàm `rad2deg`).*

---

## 4. Nhập/Xuất & Định dạng dữ liệu

### Định dạng hiển thị (`format`)
* `format short`: Hiển thị 5 chữ số.
* `format long`: Hiển thị 15 chữ số.
* `format rat`: Hiển thị dưới dạng phân số.

### Nhập/Xuất dữ liệu
* **Nhập:** * `a = input('Nhập số: ')`: Nhập số.
  * `b = input('Nhập chuỗi: ', 's')`: Nhập chuỗi văn bản.
* **Xuất:**
  * `disp('Xin chao')`: Hiển thị chuỗi/biến không kèm định dạng.
  * `fprintf('Tuổi của bạn là: %d\n', tuoi)`: In có định dạng (`%d` cho số nguyên, `%f` cho số thập phân, `\n` để xuống dòng).

### Thao tác với File
* `save bt.mat`: Lưu toàn bộ workspace vào file `.mat`.
* `load('bt.mat')`: Tải dữ liệu từ file vào workspace.
* Ghi file Text:
  ```matlab
  fid = fopen('baitap.txt', 'w');
  fprintf(fid, '%f', a);
  fclose(fid);
