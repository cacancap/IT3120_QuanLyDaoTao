-- =============================================================================
-- HỆ THỐNG QUẢN LÝ ĐÀO TẠO ĐẠI HỌC (IT3120 - SOICT / ĐHBK HÀ NỘI)
-- CƠ SỞ DỮ LIỆU: PostgreSQL 14+
-- ĐẶC TẢ: 27 Thực thể thuộc 4 Phân hệ (CUR, SCH, REG, GRD)
-- QUY ƯỚC: snake_case cho toàn bộ bảng và cột, khóa chính UUID hoặc VARCHAR
-- =============================================================================

-- 0. Cấu hình Extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- 1. Định nghĩa các kiểu dữ liệu liệt kê (ENUMs)
CREATE TYPE section_status_enum AS ENUM (
    'DRAFT', 
    'OPEN_FOR_REG', 
    'CLOSED_FOR_REG', 
    'IN_PROGRESS', 
    'COMPLETED', 
    'CANCELLED'
);

CREATE TYPE registration_status_enum AS ENUM (
    'REGISTERED', 
    'WITHDRAWN', 
    'CANCELLED'
);

CREATE TYPE grade_status_enum AS ENUM (
    'DRAFT', 
    'PUBLISHED', 
    'UNDER_APPEAL', 
    'LOCKED'
);

CREATE TYPE invoice_status_enum AS ENUM (
    'UNPAID', 
    'PARTIALLY_PAID', 
    'PAID', 
    'OVERDUE'
);

CREATE TYPE period_status_enum AS ENUM (
    'PLANNED', 
    'OPEN', 
    'CLOSED'
);

-- =============================================================================
-- PHÂN HỆ 1: MODULE CUR (Danh mục & Hệ thống)
-- =============================================================================

-- 1.1 Bảng Người dùng hệ thống
CREATE TABLE users (
    id VARCHAR(64) PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    full_name VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20),
    status VARCHAR(50) NOT NULL DEFAULT 'ACTIVE',
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- 1.2 Bảng Vai trò (Roles)
CREATE TABLE roles (
    id VARCHAR(64) PRIMARY KEY,
    role_name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT
);

-- 1.3 Bảng liên kết Người dùng - Vai trò
CREATE TABLE user_roles (
    user_id VARCHAR(64) NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    role_id VARCHAR(64) NOT NULL REFERENCES roles(id) ON DELETE CASCADE,
    PRIMARY KEY (user_id, role_id)
);

-- 1.4 Bảng Khoa / Viện đào tạo
CREATE TABLE faculties (
    id VARCHAR(64) PRIMARY KEY,
    code VARCHAR(50) NOT NULL UNIQUE,
    name VARCHAR(255) NOT NULL,
    office_location VARCHAR(255)
);

-- 1.5 Bảng Ngành đào tạo
CREATE TABLE majors (
    id VARCHAR(64) PRIMARY KEY,
    faculty_id VARCHAR(64) NOT NULL REFERENCES faculties(id),
    code VARCHAR(50) NOT NULL UNIQUE,
    name VARCHAR(255) NOT NULL
);

-- 1.6 Bảng Khung Chương trình Đào tạo (CTĐT)
CREATE TABLE programs (
    id VARCHAR(64) PRIMARY KEY,
    major_id VARCHAR(64) NOT NULL REFERENCES majors(id),
    name VARCHAR(255) NOT NULL,
    cohort_year INT NOT NULL,
    total_credits INT NOT NULL CHECK (total_credits > 0),
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- 1.7 Bảng Danh mục Học phần
CREATE TABLE courses (
    id VARCHAR(64) PRIMARY KEY,
    course_code VARCHAR(50) NOT NULL UNIQUE,
    name VARCHAR(255) NOT NULL,
    credits INT NOT NULL CHECK (credits > 0 AND credits <= 12),
    tuition_factor NUMERIC(3, 2) NOT NULL DEFAULT 1.00 CHECK (tuition_factor > 0),
    description TEXT
);

-- 1.8 Bảng Liên kết CTĐT - Học phần
CREATE TABLE program_courses (
    program_id VARCHAR(64) NOT NULL REFERENCES programs(id) ON DELETE CASCADE,
    course_id VARCHAR(64) NOT NULL REFERENCES courses(id) ON DELETE CASCADE,
    suggested_semester INT NOT NULL CHECK (suggested_semester BETWEEN 1 AND 12),
    is_mandatory BOOLEAN NOT NULL DEFAULT TRUE,
    PRIMARY KEY (program_id, course_id)
);

-- 1.9 Bảng Ràng buộc Học phần Tiên quyết (Prerequisites)
CREATE TABLE prerequisites (
    id VARCHAR(64) PRIMARY KEY,
    course_id VARCHAR(64) NOT NULL REFERENCES courses(id) ON DELETE CASCADE,
    prerequisite_course_id VARCHAR(64) NOT NULL REFERENCES courses(id) ON DELETE CASCADE,
    type VARCHAR(50) NOT NULL DEFAULT 'PREREQUISITE', -- PREREQUISITE, CO_REQUISITE
    CONSTRAINT check_no_self_prereq CHECK (course_id <> prerequisite_course_id),
    UNIQUE (course_id, prerequisite_course_id)
);

-- 1.10 Bảng Lớp Hành chính
CREATE TABLE admin_classes (
    id VARCHAR(64) PRIMARY KEY,
    major_id VARCHAR(64) NOT NULL REFERENCES majors(id),
    class_code VARCHAR(50) NOT NULL UNIQUE,
    name VARCHAR(255) NOT NULL,
    cohort INT NOT NULL
);

-- 1.11 Bảng Hồ sơ Sinh viên (Kế thừa User)
CREATE TABLE students (
    id VARCHAR(64) PRIMARY KEY REFERENCES users(id) ON DELETE CASCADE,
    student_code VARCHAR(50) NOT NULL UNIQUE,
    admin_class_id VARCHAR(64) REFERENCES admin_classes(id),
    program_id VARCHAR(64) REFERENCES programs(id),
    cohort INT NOT NULL,
    admission_year INT NOT NULL
);

-- 1.12 Bảng Hồ sơ Giảng viên (Kế thừa User)
CREATE TABLE instructors (
    id VARCHAR(64) PRIMARY KEY REFERENCES users(id) ON DELETE CASCADE,
    faculty_id VARCHAR(64) NOT NULL REFERENCES faculties(id),
    staff_code VARCHAR(50) NOT NULL UNIQUE,
    academic_rank VARCHAR(100),
    department VARCHAR(255)
);

-- 1.13 Bảng Thông báo hệ thống
CREATE TABLE notifications (
    id VARCHAR(64) PRIMARY KEY,
    user_id VARCHAR(64) NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    is_read BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- =============================================================================
-- PHÂN HỆ 2: MODULE SCH (Tổ chức Giảng dạy)
-- =============================================================================

-- 2.1 Bảng Học kỳ tác nghiệp
CREATE TABLE semesters (
    id VARCHAR(64) PRIMARY KEY,
    code VARCHAR(50) NOT NULL UNIQUE, -- VD: '20231', '20232'
    name VARCHAR(100) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    CONSTRAINT check_semester_dates CHECK (end_date > start_date)
);

-- 2.2 Bảng Phòng học
CREATE TABLE rooms (
    id VARCHAR(64) PRIMARY KEY,
    room_code VARCHAR(50) NOT NULL UNIQUE,
    building VARCHAR(50) NOT NULL,
    capacity INT NOT NULL CHECK (capacity > 0)
);

-- 2.3 Bảng Lớp Học phần
CREATE TABLE class_sections (
    id VARCHAR(64) PRIMARY KEY,
    semester_id VARCHAR(64) NOT NULL REFERENCES semesters(id),
    course_id VARCHAR(64) NOT NULL REFERENCES courses(id),
    section_code VARCHAR(50) NOT NULL,
    max_capacity INT NOT NULL CHECK (max_capacity > 0),
    current_enrollment INT NOT NULL DEFAULT 0 CHECK (current_enrollment >= 0),
    status section_status_enum NOT NULL DEFAULT 'DRAFT',
    CONSTRAINT check_enrollment_limit CHECK (current_enrollment <= max_capacity),
    UNIQUE (semester_id, section_code)
);

-- 2.4 Bảng Kíp học / Lịch học chi tiết
CREATE TABLE schedule_slots (
    id VARCHAR(64) PRIMARY KEY,
    section_id VARCHAR(64) NOT NULL REFERENCES class_sections(id) ON DELETE CASCADE,
    room_id VARCHAR(64) REFERENCES rooms(id),
    day_of_week INT NOT NULL CHECK (day_of_week BETWEEN 2 AND 8), -- 2: Thứ 2, 8: Chủ nhật
    start_period INT NOT NULL CHECK (start_period BETWEEN 1 AND 12),
    end_period INT NOT NULL CHECK (end_period BETWEEN 1 AND 12),
    weeks VARCHAR(100) NOT NULL, -- Chuỗi tuần học, VD: '1-8,10-16'
    CONSTRAINT check_period_order CHECK (start_period <= end_period)
);

-- 2.5 Bảng Phân công Giảng viên phụ trách Lớp HP
CREATE TABLE instructor_assignments (
    id VARCHAR(64) PRIMARY KEY,
    section_id VARCHAR(64) NOT NULL REFERENCES class_sections(id) ON DELETE CASCADE,
    instructor_id VARCHAR(64) NOT NULL REFERENCES instructors(id),
    role_in_section VARCHAR(50) NOT NULL DEFAULT 'PRIMARY', -- PRIMARY, ASSISTANT
    UNIQUE (section_id, instructor_id)
);

-- =============================================================================
-- PHÂN HỆ 3: MODULE REG (Đăng ký Học phần & Học phí)
-- =============================================================================

-- 3.1 Bảng Đợt Đăng ký học phần
CREATE TABLE registration_periods (
    id VARCHAR(64) PRIMARY KEY,
    semester_id VARCHAR(64) NOT NULL REFERENCES semesters(id),
    name VARCHAR(255) NOT NULL,
    start_time TIMESTAMPTZ NOT NULL,
    end_time TIMESTAMPTZ NOT NULL,
    status period_status_enum NOT NULL DEFAULT 'PLANNED',
    CONSTRAINT check_period_times CHECK (end_time > start_time)
);

-- 3.2 Bảng Đơn giá tín chỉ theo năm / chương trình
CREATE TABLE tuition_rates (
    id VARCHAR(64) PRIMARY KEY,
    effective_year INT NOT NULL,
    amount_per_credit NUMERIC(12, 2) NOT NULL CHECK (amount_per_credit > 0),
    description VARCHAR(255)
);

-- 3.3 Bảng Đăng ký Lớp học phần của Sinh viên
CREATE TABLE registrations (
    id VARCHAR(64) PRIMARY KEY,
    student_id VARCHAR(64) NOT NULL REFERENCES students(id),
    section_id VARCHAR(64) NOT NULL REFERENCES class_sections(id),
    registered_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status registration_status_enum NOT NULL DEFAULT 'REGISTERED',
    UNIQUE (student_id, section_id)
);

-- 3.4 Bảng Hóa đơn Học phí
CREATE TABLE invoices (
    id VARCHAR(64) PRIMARY KEY,
    student_id VARCHAR(64) NOT NULL REFERENCES students(id),
    semester_id VARCHAR(64) NOT NULL REFERENCES semesters(id),
    total_amount NUMERIC(12, 2) NOT NULL DEFAULT 0.00 CHECK (total_amount >= 0),
    paid_amount NUMERIC(12, 2) NOT NULL DEFAULT 0.00 CHECK (paid_amount >= 0),
    due_date DATE NOT NULL,
    status invoice_status_enum NOT NULL DEFAULT 'UNPAID',
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (student_id, semester_id)
);

-- 3.5 Bảng Giao dịch Thanh toán học phí
CREATE TABLE payments (
    id VARCHAR(64) PRIMARY KEY,
    invoice_id VARCHAR(64) NOT NULL REFERENCES invoices(id) ON DELETE CASCADE,
    amount NUMERIC(12, 2) NOT NULL CHECK (amount > 0),
    paid_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    transaction_ref VARCHAR(100) NOT NULL UNIQUE,
    payment_method VARCHAR(50) NOT NULL -- VNPAY, MOMO, BANK_TRANSFER
);

-- 3.6 Bảng Miễn giảm học phí
CREATE TABLE waivers (
    id VARCHAR(64) PRIMARY KEY,
    student_id VARCHAR(64) NOT NULL REFERENCES students(id),
    semester_id VARCHAR(64) NOT NULL REFERENCES semesters(id),
    percentage NUMERIC(5, 2) NOT NULL CHECK (percentage > 0 AND percentage <= 100),
    reason TEXT NOT NULL,
    approved_by VARCHAR(64) REFERENCES users(id)
);

-- =============================================================================
-- PHÂN HỆ 4: MODULE GRD (Kết quả Học tập)
-- =============================================================================

-- 4.1 Bảng Cấu trúc Trọng số Điểm của Học phần
CREATE TABLE grade_components (
    id VARCHAR(64) PRIMARY KEY,
    course_id VARCHAR(64) NOT NULL REFERENCES courses(id) ON DELETE CASCADE,
    name VARCHAR(100) NOT NULL, -- VD: 'Quá trình', 'Cuối kỳ'
    weight NUMERIC(3, 2) NOT NULL CHECK (weight > 0 AND weight <= 1.0),
    UNIQUE (course_id, name)
);

-- 4.2 Bảng Điểm số Học phần (Gắn với bản ghi Registration)
CREATE TABLE grades (
    id VARCHAR(64) PRIMARY KEY,
    registration_id VARCHAR(64) NOT NULL UNIQUE REFERENCES registrations(id) ON DELETE CASCADE,
    process_score NUMERIC(3, 1) CHECK (process_score >= 0.0 AND process_score <= 10.0),
    final_score NUMERIC(3, 1) CHECK (final_score >= 0.0 AND final_score <= 10.0),
    total_score_10 NUMERIC(3, 1) CHECK (total_score_10 >= 0.0 AND total_score_10 <= 10.0),
    letter_grade VARCHAR(5), -- A+, A, B+, B, C+, C, D+, D, F
    score_4 NUMERIC(3, 2) CHECK (score_4 >= 0.0 AND score_4 <= 4.0),
    status grade_status_enum NOT NULL DEFAULT 'DRAFT',
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- 4.3 Bảng Đơn Phúc khảo Điểm
CREATE TABLE grade_appeals (
    id VARCHAR(64) PRIMARY KEY,
    grade_id VARCHAR(64) NOT NULL REFERENCES grades(id) ON DELETE CASCADE,
    reason TEXT NOT NULL,
    status VARCHAR(50) NOT NULL DEFAULT 'PENDING', -- PENDING, APPROVED, REJECTED
    old_score NUMERIC(3, 1),
    new_score NUMERIC(3, 1),
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    resolved_at TIMESTAMPTZ
);

-- 4.4 Bảng Kết quả Học tập Học kỳ & Tích lũy (GPA & CPA)
CREATE TABLE academic_records (
    id VARCHAR(64) PRIMARY KEY,
    student_id VARCHAR(64) NOT NULL REFERENCES students(id) ON DELETE CASCADE,
    semester_id VARCHAR(64) NOT NULL REFERENCES semesters(id) ON DELETE CASCADE,
    gpa NUMERIC(3, 2) NOT NULL CHECK (gpa >= 0.0 AND gpa <= 4.0),
    cpa NUMERIC(3, 2) NOT NULL CHECK (cpa >= 0.0 AND cpa <= 4.0),
    accumulated_credits INT NOT NULL CHECK (accumulated_credits >= 0),
    debt_credits INT NOT NULL DEFAULT 0 CHECK (debt_credits >= 0),
    calculated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (student_id, semester_id)
);

-- 4.5 Bảng Cảnh báo Học vụ
CREATE TABLE academic_warnings (
    id VARCHAR(64) PRIMARY KEY,
    student_id VARCHAR(64) NOT NULL REFERENCES students(id) ON DELETE CASCADE,
    semester_id VARCHAR(64) NOT NULL REFERENCES semesters(id) ON DELETE CASCADE,
    warning_level INT NOT NULL CHECK (warning_level IN (0, 1, 2, 3)),
    reason TEXT NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (student_id, semester_id)
);

-- =============================================================================
-- TẠO CHỈ MỤC TỐI ƯU HÓA TRUY VẤN (INDEXES)
-- =============================================================================

CREATE INDEX idx_sections_semester ON class_sections(semester_id);
CREATE INDEX idx_sections_course ON class_sections(course_id);
CREATE INDEX idx_slots_section ON schedule_slots(section_id);
CREATE INDEX idx_slots_room ON schedule_slots(room_id);
CREATE INDEX idx_registrations_student ON registrations(student_id);
CREATE INDEX idx_registrations_section ON registrations(section_id);
CREATE INDEX idx_invoices_student_semester ON invoices(student_id, semester_id);
CREATE INDEX idx_grades_registration ON grades(registration_id);
CREATE INDEX idx_academic_records_student ON academic_records(student_id);
CREATE INDEX idx_academic_warnings_student ON academic_warnings(student_id);

