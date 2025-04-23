# Lab 9: Creating Entity Relationship Diagrams with Draw.io

## Objective
Learn how to create clear and organized Entity Relationship (ER) diagrams using Draw.io. This lab will guide you through the process of designing entities, defining attributes, and connecting relationships with appropriate cardinality.

---

## Step 1: Setting Up the ER Diagram
1. Open your web browser and navigate to the [Draw.io website](https://app.diagrams.net/).
2. Choose where to save your diagrams (e.g., "Decide later" to start immediately).
3. Familiarize yourself with the interface:
   - **Drawing Canvas (Center)**: The workspace where you will build your diagram.
   - **Shape Library (Left Pane)**: Expand the "Entity Relation" set to access ER diagram shapes.
   - **Properties Panel (Right Pane)**: Use this to edit styles, text, and properties.

---

## Step 2: Adding Entities
1. Drag entity shapes from the "Entity Relation" set onto the canvas.
2. Rename each entity and define its attributes:
   - **Department**:
     - Attributes: `Department ID (PK)`, `Name`, `Phone`
   - **Employee**:
     - Attributes: `Employee ID (PK)`, `First Name`, `Last Name`, `Email`, `Department ID (FK)`
   - **Skill**:
     - Attributes: `Skill ID (PK)`, `Skill Name`
   - **Employee Skill (Associative Entity)**:
     - Attributes: `Employee ID (FK)`, `Skill ID (FK)`, `Skill Level`
3. Mark primary keys (PK) and foreign keys (FK) clearly.

---

## Step 3: Adding Relationships
1. Drag relationship lines from the shape library onto the canvas.
2. Connect the entities as follows:
   - **Department → Employee** (1:N)
   - **Employee → Employee Skill** (1:N)
   - **Skill → Employee Skill** (1:N)
3. Modify cardinality symbols:
   - Use "one-and-only-one" for PK relationships.
   - Use "zero-to-many" for FK relationships.

### Example:
- **Department (1)** → **Employee (N)**
- **Employee (1)** → **Employee Skill (N)**
- **Skill (1)** → **Employee Skill (N)**

---

## Step 4: Styling and Finalizing
1. Use the **Properties Panel** to:
   - Bold required attributes.
   - Change line styles (e.g., dashed for non-identifying relationships).
   - Use rounded corners or different borders for the **Employee Skill** entity to indicate it is associative.
2. Save the diagram:
   - Go to **File > Save As** to save for future editing.
   - Go to **File > Export As** to export as an image (PNG, JPG, etc.).

---

## Step 5: Summary
1. Review the completed ER diagram:
   - Ensure all entities, attributes, and relationships are correctly represented.
   - Verify cardinality symbols and relationship types.
2. Save or export the diagram for submission or sharing.

---

## Deliverable
Submit the exported ER diagram (PNG or JPG) showcasing the following:
- Four entities: `Department`, `Employee`, `Skill`, and `Employee Skill`.
- Correctly defined attributes with PK and FK clearly marked.
- Proper relationships with cardinality symbols.

---

### End of Lab