# 🏠 RealEstate-Management-System-DBMS

## 📘 Project Overview
The **Real Estate Management System** is a SQL-based database project designed to streamline property transactions between owners, agents, and buyers.  
It efficiently manages property listings, transactions, visits, and features using relational tables and PL/SQL procedures for automation and consistency.

---

## 🎯 Objectives
- To maintain property, owner, buyer, and agent data in an organized relational database.  
- To automate database operations using **PL/SQL procedures** and **triggers**.  
- To ensure data consistency and integrity using **constraints**.  
- To simplify property management and tracking through structured queries.

---

## 🗂️ Database Schema

| Table Name | Description |
|-------------|-------------|
| **Owner** | Stores details of property owners |
| **Agent** | Holds agent details including region and experience |
| **Buyer** | Contains buyer information and preferences |
| **Property** | Records all property listings |
| **Transaction** | Logs purchase transactions between buyers and agents |
| **Visit** | Tracks property visits and buyer feedback |
| **Property_Features** | Lists key property features |

---

## ⚙️ Features
- Relational schema with **Primary**, **Foreign**, and **Unique** key constraints  
- **PL/SQL Procedures** for adding, updating, and deleting records  
- **Trigger** to automatically update property status when a sale completes  
- **Cursors** for dynamic property searches  
- **CHECK constraints** to validate data integrity  
- Preloaded **sample data** for testing and demonstration  

---

## 💻 Technologies Used
- **Oracle SQL / PL/SQL**  
- **Oracle SQL Developer / LiveSQL**  
- **ER Modeling Concepts**  

---

## 🧠 Key PL/SQL Programs

| Name | Description |
|------|--------------|
| `AddProperty` | Adds a new property record |
| `AddAgent` | Registers a new agent |
| `AddBuyer` | Inserts a new buyer into the system |
| `DeleteProperty` | Deletes a property by ID |
| `UpdateTransaction` | Updates final price and payment status |
| `LogVisit` | Logs a buyer’s property visit and feedback |
| `SearchProperty` | Returns available properties under a specific budget |
| `trg_UpdatePropertyStatus` | Trigger to mark property as *Sold* when payment is completed |
