# CRM for Food Entrepreneurship Academy (P000337CSITCP)

A Customer Relationship Management (CRM) system developed for Food Entrepreneurship Academy (FEA), a food innovation consulting business, to streamline lead management, sales tracking, and project progress visibility.

---

## Project Team
- **Project Mentor**: Sumedh Shriram  
- **Group Members**:  
  - Shiyuan Sun (Calvin) - s3816174@student.rmit.edu.au  
  - Chenxing Zhou (Jason) - s3813193@student.rmit.edu.au  
  - Hoang Nguyen (Austin) - s3926555@student.rmit.edu.au  
  - Jagulan Srikaran - s3881257@student.rmit.edu.au (Product Owner)  
  - Abhinav Manohar - s3853479@student.rmit.edu.au  
- **Scrum Master**: Chenxing Zhou (Jason)  
- **Scrum Team**: Shiyuan Sun, Chenxing Zhou, Hoang Nguyen, Jagulan Srikaran, Abhinav Manohar

---

## Terminologies
- **Client**: Food Entrepreneurship Academy (FEA)  
- **Customer**: FEA's customers (e.g., food entrepreneurs, startups)

---

## Project Purpose
Food Entrepreneurship Academy (FEA) is a consultancy providing innovative solutions to early-stage food entrepreneurs and startups. Managing numerous leads manually via a diary has become inefficient, especially with a growing team and a long sales cycle. The CEO has requested a web-based CRM to:
- Track sales cycle stages: Prospecting, Lead Qualification, Initial Meeting, Proposal, Deal Closure, and Project Progress.
- Improve lead and client management efficiency.
- Support scalability and team collaboration.

---

## Project Objectives
The CRM aims to replace manual diary-based processes with a web-based solution that:
- Enables the sales team to update leads, opportunities, and project progress.
- Provides clients with visibility into project timelines and tasks.
- Saves time and increases team efficiency.

### Specific Objectives
- **BO-1**: Reduce time for recording, retrieving, and filtering client info to under 5 minutes per client.  
- **BO-2**: Improve project progress visibility for clients (public tasks and overall timeline).  
- **BO-3**: Simplify task creation, retrieval, and tracking to under 2 minutes per task.

### Success Metrics
- **SM-1**: Complete at least 80% of the scope by the last sprint with a Minimum Viable Product (MVP).  
- **SM-2**: Achieve 60% client satisfaction with the MVP via surveys.

---

## Scope
### System Access
- Web application, responsive for mobile and desktop.

### Features
| Feature ID | Feature Name                  | Description                                                                 |
|------------|-------------------------------|-----------------------------------------------------------------------------|
| F-1        | Login/Logout                 | Secure login/logout using email and password.                              |
| F-2        | Account Management           | Create, delete, and assign roles to user accounts (Admin).                 |
| F-3        | Customer Info Management     | Sales Team: Create/update project details, sales cycle updates (Prospecting to Deal Closure), assign project leads. Admin: Delete projects. |
| F-4        | Task Management & Delegation | Project Leads: Add team members, create milestones/tasks with deadlines/status, adjust deadlines, close tasks. Team Members: Notify task closure, use discussion forums. |
| F-5        | Project Report               | Graph showing project progress with deadlines and status.                 |
| F-6        | Home Page                    | Quick access to customer and task management features.                    |

### Out of Scope
| Index | Feature                  | Reason             |
|-------|--------------------------|--------------------|
| 1     | Chat Integration         | Existing platforms suffice. |
| 2     | Finetuning Progress      | Time constraints.  |
| 3     | OAuth/Third-Party Login  | Time constraints.  |
| 4     | Forgot Password Options  | Time constraints.  |
| 5     | Calendar View            | Time constraints.  |

---

## Major Deliverables
| Deliverable            | Description                       |
|-----------------------|------------------------------------|
| Web-Based Application | Implements Features F-1, F-2, F-3 |

---

## Release Plan
| Feature ID       | Release 1 (W7)         | Release 2 (W12)         | Release 3 (If Time Permits) | Release 4 (If Time Permits) |
|-------------------|------------------------|-------------------------|-----------------------------|-----------------------------|
| **F-1**: Login/Logout | Complete functionality | Fully completed         |                             |                             |
| **F-2**: Account Management | Admin CRUD for accounts | Carry over if needed    | Fully completed             |                             |
| **F-3**: Lead Management | Not implemented        | Sales Team CRUD, Admin delete | Carry over if needed       | Fully completed             |
| **F-4**: Task Management | Not implemented        | Not implemented         | Project Lead functionalities | Team Member functionalities |
| **F-5**: Project Report | Not implemented        | Not implemented         | Not implemented             | Client view of milestones   |

---

## Schedule (Agile WBS)
| ID   | Name                                    | Predecessor | Due Date       |
|------|-----------------------------------------|-------------|----------------|
| 1    | Release 1                               |             | 28 Apr (W7)    |
| 1.1  | Login Page                              |             |                |
| 1.2  | Logout Functionality                    |             |                |
| 1.3  | Admin CRUD: Sales Team                  | 1.1         |                |
| 1.4  | Admin CRUD: Project Team Members        | 1.1         |                |
| 1.5  | Admin CRUD: Client Members              | 1.1         |                |
| 2    | Release 2                               | 1, 2        | 2 Jun (W12)    |
| 2.1  | Sales Team: Project Details             | 1.3         |                |
| 2.2  | Sales Team: Sales Cycle Updates         | 2.1         |                |
| 2.3  | Sales Team: Assign Project Lead         | 2.2         |                |
| 2.4  | Admin: Delete Project                   | 2.1         |                |
| 3    | Release 3 (If Time Permits)             | 2           | TBD            |
| 3.1  | Project Lead: Add Team Members          | 2.3         |                |
| 3.2  | Project Lead: Create Milestones/Tasks   | 2.3         |                |
| 3.3  | Project Lead: Adjust Deadlines          | 2.3         |                |
| 3.4  | Project Lead: Close Tasks               | 2.3         |                |
| 4    | Release 4 (If Time Permits)             | 1, 3        | TBD            |
| 4.1  | Team Members: Notify Task Closure       | 3.1         |                |
| 4.2  | Discussion Forum in Tasks               | 3.1         |                |
| 4.3  | Client: View Milestones                 | 1.5         |                |

---

## Stakeholders
| Stakeholder         | Major Value                          | Major Interest                         | Constraints                          |
|---------------------|--------------------------------------|----------------------------------------|--------------------------------------|
| **Admin (Co-founders)** | Efficiency, growth, scalability      | Streamlining ops, sales, collaboration | Limited resources, data security     |
| **Sales Team**      | Closing deals, client satisfaction   | Centralized lead tracking, ease of use | Learning curve, time constraints     |
| **Project Team Lead** | Project success, productivity        | Task allocation, milestone tracking    | Balancing projects, team alignment   |
| **Project Team Members** | Contribution, skill development   | Clear tasks, learning opportunities    | Workload, communication challenges   |
| **Client**          | Transparency, timely delivery        | Updates, milestone tracking            | Time/budget limits, clarity needs    |

### Internal Roles
- **Product Owner**: Jagulan Srikaran  
- **Scrum Master**: Chenxing Zhou (Jason)

---

## Risk Management
### Assumptions
- **AS-1**: Training provided for sales/project teams.  
- **AS-2**: Project team updates progress for client visibility.

### Dependencies
- **DE-1**: Manual diary data must be migrated at launch.

### Risks
| Risk                       | Contingency Plan                                                                 |
|----------------------------|---------------------------------------------------------------------------------|
| Technical Failures         | Routine maintenance, dedicated IT support for quick resolution.                 |
| Data Breaches              | Strong security (encryption, firewalls), regular backups, and recovery plan.    |

---

## Project Infrastructure
- **Canvas Project Group**: SS-337-crm-food  
- **Trello Retro Board (Sprint 0)**: [Trello Link](https://trello.com/invite/b/2gAtmJ3L/ATT161fbed8a79f882076d19886d2b4c704eE7812B72/sprint-0-trello-retro-board)  
- **Trello Sprint Planning**: [Trello Link](https://trello.com/invite/b/mqSpqv8B/ATT150adcef912e181681b04d4f093440ddbAA7A6785/trello-board-for-sprints-planning)  
- **GitHub Repository**: [github.com/CalvinSSSSSS/CRM_Project](https://github.com/CalvinSSSSSS/CRM_Project)  
- **Document Management**: [Microsoft Teams Link](https://teams.microsoft.com/#/school/FileBrowserTabApp/...)  

### Backend Architecture
- **Frontend**: HTML, CSS, JavaScript, TypeScript (responsive design, code reliability).  
- **Backend**: AWS (EC2, S3), MySQL (database), Java with Spring Boot (core ops), RESTful API (secure communication).  
- **Development/Delivery**: GitHub for collaboration, automated testing, and deployment to AWS.

---

### Client Pain Points
- Managing 20+ clients simultaneously.  
- Difficulty scaling with rapid business growth.  
- Shifted focus from new client acquisition to existing client management.

---

## Tools & Technologies
- **Frontend**: HTML, CSS, JavaScript, TypeScript. C#, .NET, SQL  
- **Backend**: AWS, MySQL, Java (Spring Boot), RESTful API  
- **Collaboration**: GitHub, Trello, Microsoft Teams
