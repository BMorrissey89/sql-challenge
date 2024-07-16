-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "Departments" (
    "dept_no" VARCHAR  NOT NULL ,
    "dept_name" VARCHAR  NOT NULL ,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
    )
)

GO

CREATE TABLE "Dept_Emp" (
    "emp_no" INT  NOT NULL ,
    "dept_no" VARCHAR  NOT NULL ,
    CONSTRAINT "pk_Dept_Emp" PRIMARY KEY (
        "emp_no","dept_no"
    )
)

GO

CREATE TABLE "Dept_Manager" (
    "emp_no" INT  NOT NULL ,
    "dept_no" VARCHAR  NOT NULL ,
    CONSTRAINT "pk_Dept_Manager" PRIMARY KEY (
        "emp_no","dept_no"
    )
)

GO

CREATE TABLE "Employees" (
    "emp_no" INT  NOT NULL ,
    "emp_title_id" VARCHAR  NOT NULL ,
    "birth_date" DATE  NOT NULL ,
    "first_name" VARCHAR  NOT NULL ,
    "last_name" VARCHAR  NOT NULL ,
    "sex" VARCHAR  NOT NULL ,
    "hire_date" DATE  NOT NULL ,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
    )
)

GO

CREATE TABLE "Salaries" (
    "emp_no" INT  NOT NULL ,
    "salary" INT  NOT NULL ,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "emp_no","salary"
    )
)

GO

CREATE TABLE "Titles" (
    "title_id" VARCHAR  NOT NULL ,
    "title" VARCHAR  NOT NULL ,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "title_id"
    )
)

GO

ALTER TABLE "Departments" ADD CONSTRAINT "fk_Departments_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Dept_Manager" ("dept_no")
GO

ALTER TABLE "Dept_Emp" ADD CONSTRAINT "fk_Dept_Emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no")
GO

ALTER TABLE "Dept_Emp" ADD CONSTRAINT "fk_Dept_Emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no")
GO

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no")
GO

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "Titles" ("title_id")
GO

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no")
GO

