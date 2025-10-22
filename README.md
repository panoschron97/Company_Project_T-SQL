# Company_Project_T-SQL

This repository contains a T-SQL script for creating and managing a database related to company projects, including schemas for users, companies, locations, departments, projects, and employees. It includes procedures for creating tables, managing user roles and permissions, and implementing data manipulation logic through triggers.

## Table of Contents
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Dependencies](#dependencies)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Features

- Database and schema creation and deletion.
- User and role management with privilege assignment.
- Table creation for companies, locations, departments, projects, and employees.
- Triggers for logging data manipulation statements.
- Stored procedures for data insertion, update, and deletion.
- Index creation for performance optimization.
- Dynamic SQL and function examples.
- Demonstration of transaction management with commit and rollback.

## Installation

1.  Clone the repository to your local machine:

    ```bash
    git clone https://github.com/panoschron97/Company_Project_T-SQL.git
    ```

2.  Open the `Company_Project_T-SQL.sql` file in your SQL Server Management Studio (SSMS).

3.  Execute the script to create the database and its components.

## Usage

1.  Connect to your SQL Server instance using SQL Server Management Studio.

2.  Open the `Company_Project_T-SQL.sql` file.

3.  Execute the script. It will create the necessary databases, schemas, tables, procedures, and triggers.

Example of executing a stored procedure:

```sql
USE [Company_Project_T_SQL];
GO
EXECUTE [Companies].[InsertUpdateDeleteOfCompanies] 1;
GO
```

## Dependencies

- SQL Server
- SQL Server Management Studio (SSMS) - Optional but recommended for managing the database.

## Contributing

Contributions are welcome! Please follow these steps:

1.  Fork the repository.
2.  Create a new branch for your feature or bug fix.
3.  Make your changes and commit them with clear, descriptive messages.
4.  Submit a pull request to the main branch.

## License

Placeholder License. See the [LICENSE](LICENSE) file for more information.

## Contact

- [Placeholder Maintainer Name](mailto:placeholder@email.com)
```
