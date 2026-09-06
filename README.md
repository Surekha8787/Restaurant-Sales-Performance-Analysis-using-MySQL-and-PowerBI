# 🍽️ Restaurant Sales Performance Analysis using MYSQL + MICROSOFT POWERBI

## 📊 Project Overview

This project analyzes food delivery and restaurant sales data using **MySQL and Microsoft Power BI**.

The project follows an end-to-end data analytics workflow, starting with database operations and SQL analysis in MySQL and progressing to data modeling, analysis, and interactive visualization in Power BI.

### Project Workflow

**MySQL Database → SQL Analysis → Data Preparation → Power BI → Interactive Dashboard → Business Insights**

---

## 🛠️ Tools & Technologies

* **MySQL**
* **SQL**
* **Microsoft Power BI**
* **Power Query**
* **DAX**
* Data Modeling
* Data Visualization

---

## 🗄️ Database

The project uses the **`food_delivery`** database.

### Main Tables

| Table              | Description                                                           |
| ------------------ | --------------------------------------------------------------------- |
| `customers_medium` | Customer information including customer ID, city and signup date      |
| `restaurants`      | Restaurant information including cuisine, city and rating             |
| `food_items`       | Food/menu item information including item ID, restaurant ID and price |
| `orderone`         | Order-item details including quantity and price                       |
| `ordertwo`         | Order-level details including customer, restaurant and order status   |

> `food_items` was originally named `menu_items` and was renamed using an SQL `ALTER TABLE` operation.

---

# 🧮 SQL Analysis

The MySQL project demonstrates a wide range of SQL concepts.

### DDL Operations

* CREATE TABLE
* ALTER TABLE
* MODIFY
* RENAME TABLE
* DROP TABLE

### DML Operations

* INSERT
* UPDATE
* DELETE

### Aggregate Functions

* COUNT
* SUM
* AVG
* MAX
* MIN

### Filtering & Operators

* WHERE
* OR
* BETWEEN
* IN
* LIKE

### Joins

* INNER JOIN
* Multiple-table joins
* Customer, restaurant and order relationships

### Subqueries

The project includes analysis such as:

* Restaurants with ratings above the average
* Customers who placed more orders than average
* Most expensive food item
* Highest-sales restaurant
* Restaurants whose revenue exceeds average revenue
* Customers who never placed an order
* Second-highest restaurant rating

### Advanced SQL Concepts

* Transactions
* COMMIT
* ROLLBACK
* SAVEPOINT
* Indexes
* Composite indexes
* Views
* Stored Procedures

---

# 📈 Power BI Dashboard

The SQL data was analyzed and visualized in Power BI through an interactive **Restaurant Sales Performance Dashboard**.

### Datasets Used in Power BI

The Power BI report uses the following five tables:

* `customers_medium`
* `restaurants`
* `food_items`
* `orderone`
* `ordertwo`

---

## 📊 Dashboard Analysis

The dashboard provides analysis of:

### 💰 Sales Performance

* Total sales by restaurant
* Monthly sales
* Revenue analysis

### 🏪 Restaurant Analysis

* Restaurant ratings
* Number of orders by restaurant
* Restaurant-wise sales
* Restaurant performance

### 🍔 Food Analysis

* Average food price by restaurant
* Food item distribution
* Food-related analysis

### 🍜 Cuisine Analysis

* Revenue by cuisine
* Restaurant ratings by cuisine
* Order count by cuisine

### 👥 Customer Analysis

* Customers by city
* Customer signup trends
* Customer-related order analysis

### 📦 Order Analysis

* Order status distribution
* Number of orders by restaurant

---

# 🔄 Project Workflow

```text
Raw Food Delivery Data
        ↓
MySQL Database
        ↓
Data Preparation & SQL Operations
        ↓
SQL Queries & Business Analysis
        ↓
Power BI Data Connection
        ↓
Data Modeling
        ↓
Power Query / DAX
        ↓
Interactive Dashboard
        ↓
Business Insights
```

---

<img width="1166" height="797" alt="RESTAURANT PERFORMANCE DASHBOARD HOME PAGE" src="https://github.com/user-attachments/assets/f2a05d69-6758-42f6-b3bf-71e919573554" />



# 🎯 Project Objectives

The main objectives of this project are:

* Analyze restaurant sales performance
* Understand customer distribution and signup trends
* Analyze food item pricing
* Compare restaurant performance
* Analyze cuisine-wise revenue and orders
* Understand order status distribution
* Identify useful business insights from food delivery data
* Demonstrate practical SQL and Power BI skills

---

# 📂 Repository Structure

```text
Restaurant-Sales-Performance-Analysis/
│
├── README.md
│
├── SQL/
│   └── FOOD_PROJECT.sql
│
├── PowerBI/
│   └── RESTAURANT_SALES_PERFORMANCE_DASHBOARD.pbix
│
├── Screenshots/
│   ├── dashboard.png
│   ├── sales_analysis.png
│   └── customer_analysis.png
│
└── Documentation/
    └── Project_Workflow.png
```

---

## 🚀 Key Skills Demonstrated

**SQL | MySQL | Data Analysis | Data Cleaning | Joins | Subqueries | Aggregations | Transactions | Indexing | Views | Stored Procedures | Power BI | Power Query | DAX | Data Modeling | Data Visualization | Business Intelligence**
