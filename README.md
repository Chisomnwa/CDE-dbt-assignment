# CDE-dbt-assignment

This dbt assignment is a continuation of the previous [data modelling assignment](https://github.com/Chisomnwa/CDE_Data-Modeling-Assignment), with the case study: **Fufu Republic.**

## The Assignment Instructions is as Follows:

In this phase, you have been tasked to design and implement a dimensional model that was previously designed. 

After several discussions, the team has decided to use **dbt** for the transformation layer.

**Step 1**: Develop a Dimensional Model (This has been done)

**Step 2**: Prototype Using Seed Data. 

Since real data is not yet available, you are asked to generate synthetic data. You can use Python’s **Faker library** or a GenAI tool to generate this data. The generated data will serve as seeds for your dbt project.

**Step 3**: Implement dbt Models
* __Sources__: Create source models for the raw data tables, ensuring you define freshness
tests for your sources.

* __Staging Models__: Implement staging models that map 1:1 with the source tables and
apply only light transformations (e.g., renaming columns, casting data types).

* __Intermediate Models (Optional)__: If needed, create intermediate models to further refine
the data before feeding it into the final models.

* __Dimensional Models__: Build dimension and fact models based on your business
process.

**Step 4**: Add Tests and Documentation
* Add generic and custom tests (e.g., uniqueness, non-null constraints, accepted values) to your models to ensure data quality.

* Document each of your models.

**Step 5**: Automate User Access Requests
Currently, a user (joseph) needs access to new tables/models after they are created. He
manually contacts the team for access. How can access be given to this user after each dbt
execution?

***Note***: You can use dbt core or dbt cloud

## Solution to the Assignment
After a couple of meeting with the business stakeholders, we reviwed the entire data modelling process and made certain adjustments based on the conceptual and physical data model.

The reviews helped to to understand better how the tables better connect to form a dimensional model.

### New Conceptual Model
<p align="center" style="margin-bottom: 0px !important;">
<img src="Conceptual and Physical Data models/Conceptual Data Model.png" width="540" height="540">

### New Physical Model
<p align="center" style="margin-bottom: 0px !important;">
<img src="Conceptual and Physical Data models/Physical Data Model.png" width="540" height="540">

---

With the insights from the data modeling process, we go ahead to create the three layers (datasets) in Bigquery using **dbt** as a data transformation tool.

These (*8staging**, **warehouse**, and **analytics_obt** or **reporting**) layers are identified by the **"dbt prefix"**.

<img src="BigQuery Data Layers Image.png">

The above three data layers help to achieve the business requirements of Fufu Republic.

The business can now leverage data to:

● Understand sales trends across locations, payment methods, and dining options
(dine-in, take-out, online).

● Manage stock levels efficiently, reducing waste and ensuring availability.

● Enhance customer experience by analyzing purchasing habits and tailoring promotions
accordingly.



### Resources on Getting Started with DBT:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
