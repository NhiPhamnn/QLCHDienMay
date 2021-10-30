USE master
GO
CREATE DATABASE QLDienMay
GO
USE QLDienMay
GO

-----Khai bao cac bang------ 

CREATE TABLE NhaCungCap
(
	MaNCC CHAR(5),
	TenNCC NVARCHAR(50) NOT NULL,
	MaSoThue CHAR(10) NOT NULL UNIQUE,
	DiaChi NVARCHAR(100) NOT NULL,
	CONSTRAINT PK_NCC PRIMARY KEY (MaNCC)
)
GO

CREATE TABLE ThanhPho
(
	MaThanhPho CHAR(5),
	TenThanhPho NVARCHAR(20) NOT NULL,
	CONSTRAINT PK_TP PRIMARY KEY(MaThanhPho),
)
GO
CREATE TABLE KhuyenMai
(
	MaKhuyenMai CHAR(10),
	TenKM NVARCHAR(50) NOT NULL,
	PhanTramKhuyenMai FLOAT CHECK(PhanTramKhuyenMai > 0 AND PhanTramKhuyenMai <= 1) NOT NULL,
	NgayBatDau DATETIME NOT NULL,
	NgayKetThuc DATETIME NOT NULL,
	MoTa NVARCHAR(50) NOT NULL,
	CONSTRAINT PK_KM PRIMARY KEY(MaKhuyenMai)
)
GO
ALTER TABLE KhuyenMai ADD CONSTRAINT CHECK_NGAY CHECK(NgayBatDau < NgayKetThuc)

CREATE TABLE DanhMuc
(
	MaDanhMuc CHAR(5),
	TenDanhMuc NVARCHAR(50) NOT NULL,
	CONSTRAINT PK_DM PRIMARY KEY(MaDanhMuc)
)
GO

CREATE TABLE Loai
(
	MaLoai CHAR(5),
	TenLoai NVARCHAR(50) NOT NULL,
	MaDanhMuc CHAR(5) NOT NULL,
	CONSTRAINT PK_LOAI PRIMARY KEY(MaLoai),
	CONSTRAINT FK_DM_LOAI FOREIGN KEY(MaDanhMuc) REFERENCES DanhMuc(MaDanhMuc)
)
GO

CREATE TABLE SanPham
(
	MaSanPham CHAR(10),
	TenSanPham NVARCHAR(100) NOT NULL,
	MaThuongHieu CHAR(5) NOT NULL,
	AnhMinhHoa VARCHAR(100),
	DonGia DECIMAL(18,2) CHECK(DonGia >= 0) NOT NULL,
	MaKhuyenMai CHAR(10),
	CONSTRAINT PK_SP PRIMARY KEY(MaSanPham),
	CONSTRAINT FK_KM_SP FOREIGN KEY(MaKhuyenMai) REFERENCES KhuyenMai(MaKhuyenMai)
)
GO

CREATE TABLE ChiTietLoai
(
	MaSanPham CHAR(10),
	MaLoai CHAR(5),
	CONSTRAINT PK_ChiTietLoai PRIMARY KEY(MaSanPham, MaLoai),
	CONSTRAINT FK_SP_ChiTietLoai FOREIGN KEY(MaSanPham) REFERENCES SanPham(MaSanPham),
	CONSTRAINT FK_Loai_ChiTietLoai FOREIGN KEY(MaLoai) REFERENCES Loai(MaLoai)
)
GO

CREATE TABLE TinhNang
(
	MaSanPham CHAR(10),
	TenTinhNang NVARCHAR(100),
	MoTa NVARCHAR(400) NOT NULL,
	HinhAnh VARCHAR(100),
	CONSTRAINT PK_TinhNang PRIMARY KEY(MaSanPham, TenTinhNang),
	CONSTRAINT FK_SP_TinhNang FOREIGN KEY(MaSanPham) REFERENCES SanPham(MaSanPham)
)
GO

CREATE TABLE DacDiemNoiBat
(
	MaSanPham CHAR(10),
	TenDacDiem NVARCHAR(100),
	CONSTRAINT PK_DacDiemNoiBat PRIMARY KEY(MaSanPham, TenDacDiem),
	CONSTRAINT FK_SP_DacDiemNoiBat FOREIGN KEY(MaSanPham) REFERENCES SanPham(MaSanPham)
)
GO

CREATE TABLE ThongSoKiThuat
(
	MaSanPham CHAR(10),
	TenThongSo NVARCHAR(50),
	MoTa NVARCHAR(100) NOT NULL,
	CONSTRAINT PK_ThongSoKiThuat PRIMARY KEY(MaSanPham, TenThongSo),
	CONSTRAINT FK_SP_ThongSoKiThuat FOREIGN KEY(MaSanPham) REFERENCES SanPham(MaSanPham)
)
GO

CREATE TABLE ChucVu
(
	MaChucVu CHAR(5),
	TenChucVu NVARCHAR(50) NOT NULL,
	CONSTRAINT PK_ChucVu PRIMARY KEY(MaChucVu)
)
GO

CREATE TABLE NhanVien
(
	MaNhanVien CHAR(10),
	TenNhanVien NVARCHAR(50) NOT NULL,
	NgaySinh DATETIME NOT NULL,
	SDT CHAR(10) UNIQUE NOT NULL,
	Email CHAR(50) UNIQUE NOT NULL,
	DiaChi NVARCHAR(100) NOT NULL,
	GioiTinh BIT NOT NULL,
	ChucVu CHAR(5) NOT NULL,
	CuaHang CHAR(5) NOT NULL,
	HinhThuc BIT NOT NULL,
	TaiKhoan CHAR(50) UNIQUE NOT NULL,
	MatKhau CHAR(50) NOT NULL,
	TrangThai BIT NOT NULL,
	CONSTRAINT PK_NhanVien PRIMARY KEY(MaNhanVien),
	CONSTRAINT FK_ChucVu_NhanVien FOREIGN KEY(ChucVu) REFERENCES ChucVu(MaChucVu)
)
GO

CREATE TABLE CuaHang
(
	MaCuaHang CHAR(5),
	DiaChi NVARCHAR(100) NOT NULL,
	ThanhPho CHAR(5) NOT NULL,
	CuaHangTruong CHAR(10),
	NgayThanhLap DATETIME NOT NULL,
	CONSTRAINT PK_CuaHang PRIMARY KEY(MaCuaHang),
	CONSTRAINT FK_NhanVien_CuaHang FOREIGN KEY(CuaHangTruong) REFERENCES NhanVien(MaNhanVien),
	CONSTRAINT FK_TP_CuaHang FOREIGN KEY(ThanhPho) REFERENCES ThanhPho(MaThanhPho)
)
GO
ALTER TABLE NhanVien
ADD FOREIGN KEY (CuaHang) REFERENCES CuaHang(MaCuaHang);
GO

CREATE TABLE Kho
(
	MaKho CHAR(5),
	MaCuaHang CHAR(5) NOT NULL,
	DiaChi NVARCHAR(100) NOT NULL,
	CONSTRAINT PK_Kho PRIMARY KEY(MaKho),
	CONSTRAINT FK_CuaHang_Kho FOREIGN KEY(MaCuaHang) REFERENCES CuaHang(MaCuaHang)
)
GO

CREATE TABLE ChiTietKho
(
	MaKho CHAR(5),
	MaSanPham CHAR(10),
	SoLuong INT CHECK(SoLuong >= 0) NOT NULL,
	CONSTRAINT PK_ChiTietKho PRIMARY KEY(MaKho,MaSanPham),
	CONSTRAINT FK_SanPham_ChiTietKho FOREIGN KEY(MaSanPham) REFERENCES SanPham(MaSanPham),
	CONSTRAINT FK_Kho_ChiTietKho FOREIGN KEY(MaKho) REFERENCES Kho(MaKho)
)
GO
CREATE TABLE PhieuNhap
(
	MaPhieuNhap CHAR(10),
	NhaCungCap CHAR(5) NOT NULL,
	NhanVienTrucKho CHAR(10) NOT NULL,
	MaKho CHAR(5) NOT NULL,
	ThoiGianTao DATETIME NOT NULL,
	TongGiaTri DECIMAL(18,2) DEFAULT 0 NOT NULL,
	CONSTRAINT PK_PhieuNhap PRIMARY KEY(MaPhieuNhap),	
	CONSTRAINT FK_NCC_PhieuNhap FOREIGN KEY(NhaCungCap) REFERENCES NhaCungCap(MaNCC),
	CONSTRAINT FK_NhanVien_NVPhuTrach FOREIGN KEY(NhanVienTrucKho) REFERENCES NhanVien(MaNhanVien),
	CONSTRAINT FK_Kho_PhieuNhap FOREIGN KEY(MaKho) REFERENCES Kho(MaKho)
)
GO
CREATE TABLE ChiTietPhieuNhap
(
	MaPhieuNhap CHAR(10),
	MaSanPham CHAR(10),
	SoLuong INT CHECK(SoLuong >= 0) NOT NULL,
	DonGiaNhap DECIMAL(18,2) NOT NULL,
	CONSTRAINT PK_ChiTietPhieuNhap PRIMARY KEY(MaPhieuNhap, MaSanPham),
	CONSTRAINT FK_PhieuNhap_ChiTietPhieuNhap FOREIGN KEY(MaPhieuNhap) REFERENCES PhieuNhap(MaPhieuNhap),
	CONSTRAINT FK_SanPham_ChiTietPhieuNhap FOREIGN KEY(MaSanPham) REFERENCES SanPham(MaSanPham)
)
GO

CREATE TABLE KhachHang
(
	MaKhachHang CHAR(10),
	TenKhachHang NVARCHAR(50) NOT NULL,
	SDT CHAR(10) UNIQUE NOT NULL,
	DiaChi NVARCHAR(100) NOT NULL,
	ThanhPho CHAR(5) NOT NULL,
	Email CHAR(50) UNIQUE NOT NULL,
	TaiKhoan CHAR(50) UNIQUE,
	MatKhau CHAR(50),
	TrangThai BIT NOT NULL,
	CONSTRAINT PK_KhachHang PRIMARY KEY(MaKhachHang),
	CONSTRAINT FK_TP_KhacHang FOREIGN KEY(ThanhPho) REFERENCES ThanhPho(MaThanhPho)
)
GO

CREATE TABLE Voucher
(
	MaVoucher CHAR(10),
	TenVoucher NVARCHAR(50) NOT NULL,
	PhanTramKhuyenMai FLOAT CHECK(PhanTramKhuyenMai > 0 AND PhanTramKhuyenMai <= 1) NOT NULL,
	NgayBatDau DATETIME NOT NULL,
	NgayKetThuc DATETIME NOT NULL,
	MoTa NVARCHAR(50) NOT NULL,
	CONSTRAINT PK_Voucher PRIMARY KEY(MaVoucher)
)
GO
ALTER TABLE Voucher ADD CONSTRAINT CHECK_NGAY2 CHECK(NgayBatDau < NgayKetThuc)

CREATE TABLE DonHang
(
	MaDonHang CHAR(10),
	NhanVienPhuTrach CHAR(10),
	MaKhachHang CHAR(10),
	MaCuaHang CHAR(5) NOT NULL,
	ThoiGianTao DATETIME,
	MaVoucher CHAR(10),
	Loai BIT,
	TinhTrangXacNhan BIT,
	TinhTrangThanhToan BIT,
	TinhTrangGiaoHang BIT,
	CONSTRAINT PK_DonHang PRIMARY KEY(MaDonHang),
	CONSTRAINT FK_NV_DonHang FOREIGN KEY(NhanVienPhuTrach) REFERENCES NhanVien(MaNhanVien),
	CONSTRAINT FK_KH_DonHang FOREIGN KEY(MaKhachHang) REFERENCES KhachHang(MaKhachHang),
	CONSTRAINT FK_Voucher_DonHang FOREIGN KEY(MaVoucher) REFERENCES Voucher(MaVoucher),
	CONSTRAINT FK_CuaHang_DonHang FOREIGN KEY(MaCuaHang) REFERENCES CuaHang(MaCuaHang)
)
GO
CREATE TABLE ChiTietDonHang
(
	MaDonHang CHAR(10),
	MaSanPham CHAR(10),
	SoLuong INT CHECK(SoLuong >= 0) NOT NULL,
	DonGia DECIMAL(18,2) CHECK(DonGia >= 0) NOT NULL,	
	ThanhTien DECIMAL(18,2) CHECK(ThanhTien >= 0) NOT NULL,
	CONSTRAINT PK_ChiTietDonHang PRIMARY KEY(MaDonHang, MaSanPham),
	CONSTRAINT FK_DonHang_ChiTietDonHang FOREIGN KEY(MaDonHang) REFERENCES DonHang(MaDonHang),
	CONSTRAINT FK_SanPham_ChiTietDonHang FOREIGN KEY(MaSanPham) REFERENCES SanPham(MaSanPham)
)
GO

CREATE TABLE HangTichDiem
(
	MaHang CHAR(5),
	TenHang NVARCHAR(20) NOT NULL,
	CONSTRAINT PK_HangTichDiem PRIMARY KEY(MaHang)
)
GO

CREATE TABLE TheTichDiem
(
	MaThe CHAR(10),
	MaKhachHang CHAR(10),
	Hang CHAR(5) NOT NULL,
	NgayTao DATETIME NOT NULL,
	Diem INT CHECK(Diem >= 0) NOT NULL,
	TrangThai BIT NOT NULL,
	CONSTRAINT PK_TheTichDiem PRIMARY KEY(MaThe),
	CONSTRAINT FK_KH_TheTichDiem FOREIGN KEY(MaKhachHang) REFERENCES KhachHang(MaKhachHang),
	CONSTRAINT FK_HangThe_TheTichDiem FOREIGN KEY(Hang) REFERENCES HangTichDiem(MaHang)
)
GO

CREATE TABLE PhieuXuat
(
	MaPhieuXuat CHAR(10),
	NhanVienTaoPhieu CHAR(10) NOT NULL,
	NhanVienTruongKho CHAR(10) NOT NULL,
	MaKho CHAR(5) NOT NULL,
	MaDonHang CHAR(10) NOT NULL,
	ThoiGianTao DATETIME NOT NULL,
	TongGiaTri DECIMAL(18,2) NOT NULL,
	CONSTRAINT PK_PhieuXuat PRIMARY KEY(MaPhieuXuat),
	CONSTRAINT FK_NVTaoPhieu_PhieuXuat FOREIGN KEY(NhanVienTaoPhieu) REFERENCES NhanVien(MaNhanVien),
	CONSTRAINT FK_NVTruongKho_PhieuXuat FOREIGN KEY(NhanVienTruongKho) REFERENCES NhanVien(MaNhanVien),
	CONSTRAINT FK_Kho_PhieuXuat FOREIGN KEY(MaKho) REFERENCES Kho(MaKho),
	CONSTRAINT FK_DonHang_PhieuXuat FOREIGN KEY(MaDonHang) REFERENCES DonHang(MaDonHang)
)
GO

CREATE TABLE ChiTietPhieuXuat
(
	MaPhieuXuat CHAR(10),
	MaSanPham CHAR(10),
	SoLuong INT NOT NULL,
	CONSTRAINT PK_ChiTietPhieuXuat PRIMARY KEY(MaPhieuXuat, MaSanPham),
	CONSTRAINT FK_PhieuXuat_CTPhieuXuat FOREIGN KEY(MaPhieuXuat) REFERENCES PhieuXuat(MaPhieuXuat),
	CONSTRAINT FK_SanPham_CTPhieuXuat FOREIGN KEY(MaSanPham) REFERENCES SanPham(MaSanPham),
)
GO

CREATE TABLE PhieuBaoHanh
(
	MaPhieuBH CHAR(10),
	MaSanPham CHAR(10) NOT NULL,
	MaKhachHang CHAR(10) NOT NULL,
	MaDonHang CHAR(10) NOT NULL,
	NgayTao DATETIME NOT NULL,
	NgayHetHan DATETIME NOT NULL,
	CONSTRAINT PK_PhieuBaoHanh PRIMARY KEY(MaPhieuBH),
	CONSTRAINT FK_SP_BaoHanh FOREIGN KEY(MaSanPham) REFERENCES SanPham(MaSanPham),
	CONSTRAINT FK_KH_BaoHanh FOREIGN KEY(MaKhachHang) REFERENCES KhachHang(MaKhachHang),
	CONSTRAINT FK_DH_BaoHanh FOREIGN KEY(MaDonHang) REFERENCES DonHang(MaDonHang)
)

CREATE TABLE PhanHoi
(
	MaPhanHoi CHAR(10),
	MaKhachHang CHAR(10) NOT NULL,
	NoiDung NVARCHAR(300) NOT NULL,
	TrangThai BIT,
	CONSTRAINT PK_PhanHoi PRIMARY KEY(MaPhanHoi),
	CONSTRAINT FK_KH_PhanHoi FOREIGN KEY(MaKhachHang) REFERENCES KhachHang(MaKhachHang)
)
GO
