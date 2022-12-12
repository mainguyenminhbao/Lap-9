--16
SELECT S.MASP, TENSP
FROM SANPHAM S
WHERE S.MASP NOT IN(SELECT C.MASP 
FROM CTHD C INNER JOIN HOADON H
ON C.SOHD = H.SOHD
WHERE YEAR(NGHD) = 2006)
--17
SELECT S.MASP, TENSP
FROM SANPHAM S
WHERE NUOCSX = 'TRUNG QUOC' AND S.MASP NOT IN(SELECT C.MASP 
FROM CTHD C INNER JOIN HOADON H
ON C.SOHD = H.SOHD
WHERE YEAR(NGHD) = 2006)
--18
SELECT H.SOHD 
FROM HOADON H
WHERE NOT EXISTS(SELECT *
FROM SANPHAM S
WHERE NUOCSX = 'SINGAPORE'
AND NOT EXISTS(SELECT * 
FROM CTHD C
WHERE C.SOHD = H.SOHD
AND C.MASP = S.MASP))

SELECT DISTINCT CT.SOHD 
FROM CTHD CT
WHERE NOT EXISTS(SELECT *
FROM SANPHAM S
WHERE NUOCSX = 'SINGAPORE'
AND NOT EXISTS(SELECT * 
FROM CTHD C
WHERE C.SOHD = CT.SOHD
AND C.MASP = S.MASP))
--19
SELECT H.SOHD 
FROM HOADON H
WHERE YEAR(NGHD) = 2006 AND NOT EXISTS(SELECT *
FROM SANPHAM S
WHERE NUOCSX = 'SINGAPORE'
AND NOT EXISTS(SELECT * 
FROM CTHD C
WHERE C.SOHD = H.SOHD
AND C.MASP = S.MASP))
--20
SELECT COUNT(*)
FROM HOADON H
WHERE MAKH NOT IN(SELECT MAKH
FROM KHACHHANG K 
WHERE K.MAKH = H.MAKH)
--21
SELECT COUNT(DISTINCT MASP)
FROM CTHD C INNER JOIN HOADON H
ON C.SOHD = H.SOHD
WHERE YEAR(NGHD) = 2006
--22
SELECT MAX(TRIGIA) AS MAX, MIN(TRIGIA) AS MIN
FROM HOADON
--23
SELECT AVG(TRIGIA) TB
FROM HOADON
--24
SELECT SUM(TRIGIA) AS DOANHTHU
FROM HOADON
WHERE YEAR(NGHD) = 2006
--25
SELECT SOHD
FROM HOADON
WHERE TRIGIA = (SELECT MAX(TRIGIA)
FROM HOADON
--26
SELECT HOTEN
FROM KHACHHANG K INNER JOIN HOADON H
ON K.MAKH = H.MAKH 
AND SOHD = (SELECT SOHD
			FROM HOADON
			WHERE TRIGIA = (SELECT MAX(TRIGIA)
							FROM HOADON))
--27
SELECT TOP 3 MAKH, HOTEN
FROM KHACHHANG
ORDER BY DOANHSO DESC
--28
SELECT MASP, TENSP
FROM SANPHAM
WHERE GIA IN (SELECT DISTINCT TOP 3 GIA
			  FROM SANPHAM
			  ORDER BY GIA DESC)
--29
SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX = 'THAI LAN' AND GIA IN (SELECT DISTINCT TOP 3 GIA
FROM SANPHAM
ORDER BY GIA DESC)
--30
SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX = 'TRUNG QUOC' AND GIA IN (SELECT DISTINCT TOP 3 GIA
FROM SANPHAM
ORDER BY GIA DESC)
--31
SELECT TOP 3 MAKH, HOTEN
FROM KHACHHANG
ORDER BY DOANHSO DESC
--32
SELECT COUNT(DISTINCT MASP)
FROM SANPHAM
WHERE NUOCSX = 'TRUNG QUOC'
--33
SELECT NUOCSX, COUNT(DISTINCT MASP) AS TONGSOSANPHAM
FROM SANPHAM
GROUP BY NUOCSX
--34
SELECT NUOCSX, MAX(GIA) AS MAX, MIN(GIA) AS MIN, AVG(GIA) AS AVG
FROM SANPHAM
GROUP BY NUOCSX
--35
SELECT NGHD, SUM(TRIGIA) AS DOANHTHU
FROM HOADON
GROUP BY NGHD