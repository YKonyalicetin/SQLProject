# SQLProject

## Introduction
This repository contains the creation of a database for the administration of a fictional university. It is the outcome of a four week course work in Microsoft SQL.

## Description of tables
The database can be used to administer lists of students, lecturers, courses of studies, exams and results. Every person (tb_Personen) can either be a student (tb_Studenten), a lecturer (tb_Dozenten) or both. Every student has a unique matriculation number and is registered for a specific course of study (tb_Studiengaenge). Courses of studies belong to faculties (tb_Fakultaeten) and include courses (tb_Kurse). Every course is being taught by a specific lecturer in a specific semester. A year has two semesters (tb_Semester). Each semester starts either at April 1 or October 1 of a year. Types of examinations (tb_Pruefung) are taken by a student in a certain course at a specific date. Therefore, an index ensures the unique identity of a module (combination of course, semester, lecturer), student, date and type of examination in the respective table (tb_Leistungen).

## Stored Procedures
sp_Noteneintrag adds entries to tb_Leistungen and requires the following specifications: ID of lecturer, ID of course, ID of type of examination, matriculation number, ID of semester and the date on which the examination is taken. This stored procedure checks whether the entry is correctly specified and displays helpful error messages if the information entered cannot be employed.

For a given module and type of examination, sp_Notentabelle_Modul_Pruefung creates a table that is named respectively and which displays the grading table. Thus, the table enables comparison between students. Already employed tables for the same combination will be replaced.

## Triggers
For every change in tb_Leistungen a trigger is activated that either updates a grading table created by sp_Notentabelle_Modul_Pruefung or, if not available, creates a new respective table.


![Diagramm](/Diagramm/Datenbankdiagramm_Projekt_Univerwaltung-1.png)
