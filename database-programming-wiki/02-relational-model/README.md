# Relational Model

The relational model is a foundational concept in database design that organizes data into structured tables. This model addresses the limitations of traditional data storage methods, such as lists, by providing a systematic way to manage and relate data.

## Key Concepts

### Tables
- **Definition**: Tables are the primary structure in a relational database, representing entities such as customers, orders, or products.
- **Structure**: Each table consists of rows and columns.
  - **Rows**: Each row represents a unique record or instance of the entity.
  - **Columns**: Each column represents an attribute of the entity.

### Relationships
- **Foreign Keys**: Foreign keys are used to establish relationships between tables, linking records in one table to records in another.
- **JOIN Operations**: JOIN operations allow for the retrieval of related data from multiple tables based on shared keys.

## Benefits of the Relational Model
- **Reduced Redundancy**: By organizing data into separate tables, the relational model minimizes data duplication.
- **Data Integrity**: The use of foreign keys and constraints helps maintain the accuracy and consistency of data.
- **Powerful Querying**: SQL provides robust querying capabilities to retrieve and manipulate data across multiple tables.

## Examples
The following examples illustrate key concepts of the relational model:

1. **Normalization**: Techniques to reduce redundancy in database design.
2. **Foreign Keys**: Establishing relationships between tables.
3. **Joins**: Retrieving related data from multiple tables.

For detailed examples, please refer to the SQL files in the `examples` directory.