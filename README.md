# RSVP_Movies Database

This project contains the SQL schema and sample data for the **RSVP_Movies** database.  
The database stores movies, directors, ratings, and their relationships. It also includes example SQL queries for basic analysis.

---

## 📂 Database Structure

### **1. Movies Table**
Stores information about movies.
- `movie_id` (Primary Key)
- `title`
- `release_year`
- `genre`
- `language`
- `budget`
- `revenue`

### **2. Directors Table**
Stores information about movie directors.
- `director_id` (Primary Key)
- `name`

### **3. Movie_Director Table**
Maps movies to their directors.
- `movie_id` (Foreign Key → Movies.movie_id)
- `director_id` (Foreign Key → Directors.director_id)

### **4. Ratings Table**
Contains movie ratings.
- `movie_id` (Foreign Key → Movies.movie_id)
- `rating`

---

## 📥 Sample Data
The project includes inserts for:
- 3 Movies  
- 3 Directors  
- 3 Ratings  
- Movie-director mapping  

---

## 🔍 Example Queries

### ✔ List all movies released after 2017  
```sql
select title, release_year 
from Movies 
where release_year > 2017;

