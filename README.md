## Quản lý thông tin kiến nghị, phản hồi
Quản lý các thông tin kiến nghị, phản hồi của khu vực tổ dân phố

## Requirements

1. JDK 1.8 hoặc cao hơn ([JDK 1.8](https://www.oracle.com/java/technologies/javase/javase-jdk8-downloads.html))
1. [Xampp (phpmyAdmin + Tomcat)](https://www.apachefriends.org/index.html)
1. [JDBC Driver](https://dev.mysql.com/downloads/file/?id=465644)
1. [Netbeans IDE](https://netbeans.apache.org/download/index.html)


## Hướng dẫn cài đặt

1. Clone github project với Netbeans (Team -> Git -> Clone)
```
https://github.com/truongvu2000nd/QuanLyKienNghi
```
1. Install JDBC trong netbeans :
    1. Chọn dependencies. Chuột phải chọn mysql-1 -> manually install artifact
    1. Browse -> Chọn đến đường dẫn file jdbc.jar
1. Khởi động XAMPP, start Apache, MySql và Tomcat
1. Import cơ sở dữ liệu mẫu: [quan_ly_kien_nghi.sql](https://drive.google.com/drive/folders/1FyGZ-H8dTOGCU1y8egz_7rJRcbbZ7XaX)
1. Run project trong netbeans.