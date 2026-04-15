# 📦 SAP Warehouse Bin Management System

![SAP BTP](https://img.shields.io/badge/SAP-BTP-blue?logo=sap)
![ABAP RESTful Application Programming Model](https://img.shields.io/badge/RAP-Managed-orange)
![Fiori Elements](https://img.shields.io/badge/UI-Fiori%20Elements-blueviolet)

A modern, cloud-ready SAP Fiori application built using the **ABAP RESTful Application Programming Model (Managed RAP)**. This project provides a robust backend architecture and a highly professional, color-coded Fiori Elements user interface for managing warehouse locations and their internal storage bins.

## 📑 Table of Contents
- [Overview](#-overview)
- [Key Features](#-key-features)
- [Technical Stack](#-technical-stack)
- [Architecture & Data Model](#-architecture--data-model)
- [UI & UX Highlights](#-ui--ux-highlights)
- [Installation & Deployment](#-installation--deployment)
- [Usage](#-usage)

---

## 📖 Overview

This application was developed to demonstrate modern SAP ABAP Cloud development practices. It allows warehouse managers to create and maintain warehouse master data (Header) and manage individual storage bins (Child Items) within those warehouses. The application leverages SAP's Managed RAP framework, meaning the system handles all standard database operations (Create, Read, Update, Delete) automatically, without the need for manual SQL coding.

---

## ✨ Key Features

- **Managed RAP Architecture:** Fully automated transactional buffer and database updates.
- **Draft Framework Enabled:** Modern web experience with auto-saving, session resumption, and an explicit Edit/Save lifecycle. Prevents data loss during interruptions.
- **Modern UUID Keys:** Built using `sysuuid_x16` as primary keys, adhering to SAP's best practices for cloud-ready, draft-enabled applications.
- **Dynamic UI Color Coding (Criticality):** Custom logic implemented in the CDS layer to automatically color-code Storage Bin statuses on the dashboard.
- **OData V4 Protocol:** Exposed via the latest OData V4 service binding for optimized performance and seamless UI integration.

---

## 🛠️ Technical Stack

- **Backend Environment:** SAP ABAP Cloud / ABAP Environment (SAP BTP)
- **Development Tool:** Eclipse IDE with ABAP Development Tools (ADT)
- **Frontend UI:** SAP Fiori Elements
- **Data Modeling:** Core Data Services (CDS)

---

## 🗄️ Architecture & Data Model

The project follows a strict hierarchical structure from the database layer up to the UI consumption layer:

### 1. Database Tables
- `ZCIT_WHS_22AD067` - Warehouse Header (Parent)
- `ZCIT_BNS_22AD067` - Storage Bin (Child)

### 2. Core Data Services (CDS)
- **Interface Views:** `ZCIT_I_WHS_22AD067` & `ZCIT_I_BNS_22AD067` (Defines the composition tree and UI color numbering logic).
- **Projection Views:** `ZCIT_C_WHS_22AD067` & `ZCIT_C_BNS_22AD067` (Exposes data for UI consumption and searchability).

### 3. Business Object Behavior
- **Behavior Definition (BDEF):** Manages standard operations, managed numbering for UUIDs, and draft table generation (`zcit_d_whs_22ad`, `zcit_d_bns_22ad`).
- **Behavior Implementation:** Standard managed class `zbp_cit_i_whs_22ad067`.

### 4. Service Exposure
- **Service Definition:** `ZCIT_UI_WHS_22AD067`
- **Service Binding:** `ZCIT_UI_WHS_22AD067_O4` (OData V4 UI)

---

## 🎨 UI & UX Highlights

The frontend is generated entirely via ABAP Metadata Extensions (`@UI` annotations), ensuring a consistent Fiori experience.

**Storage Bin Status Criticality:**
The UI dynamically reacts to the `BinStatus` field to provide immediate visual feedback to the user:
* 🟢 **Green (Empty / `E`):** Ready for inbound stock.
* 🟡 **Yellow (Partial / `P`):** Partially filled, mixed inventory.
* 🔴 **Red (Full / `F`):** Maximum capacity reached.

**Optimized Layouts:**
- Checkboxes for boolean fields (Active Status).
- Multi-line text areas for long descriptions (Remarks).
- Faceted navigation separating Header details from Item lists.

---

## 🚀 Installation & Deployment

1. Install **Eclipse** with the latest **ABAP Development Tools (ADT)** plugin.
2. Connect to your SAP BTP ABAP Environment or S/4HANA system.
3. Clone or import this repository using **abapGit**.
4. Activate the objects bottom-up:
   - Database Tables
   - CDS Interface Views
   - CDS Projection Views
   - Metadata Extensions
   - Behavior Definitions & Draft Tables
   - Service Definition & Binding
5. Publish the Service Binding locally to test.

---

## 💻 Usage

1. Open the published Service Binding and click **Preview** on the `Warehouse` entity to launch the Fiori application.
2. Click **Create** to initialize a new Draft.
3. Fill in the Warehouse Header information (ID, Manager, Address).
4. Scroll down to the **Managed Storage Bins** section and add new bins, assigning capacities and statuses (E, P, F).


5. Note the automatic color rendering upon saving.
6. Click **Save** to activate the draft and commit the data to the database.

---
*Developed as part of an SAP ABAP Cloud architecture exercise.*

<img width="1920" height="1020" alt="image" src="https://github.com/user-attachments/assets/c0e0fd46-f3f4-46d3-bfcf-98c7284bc43b" />

<img width="1920" height="1020" alt="image" src="https://github.com/user-attachments/assets/40689e56-8539-4be1-bfaf-bffc364683b1" />

<img width="1920" height="1020" alt="image" src="https://github.com/user-attachments/assets/abc27eb2-eae9-49ae-a8eb-053d18047bbe" />


