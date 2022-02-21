import sqlalchemy

db = 'postgresql://root:1111@localhost:5432/test'
engine = sqlalchemy.create_engine(db)
connection = engine.connect()

connection.execute("""SELECT "name", "year" FROM album "
                   "WHERE "year" = 2018""")

connection.execute("""SELECT "name", "duration_track" FROM track ORDER BY "duration_track" desc limit 1""")

connection.execute("SELECT name, duration_track FROM track "
                   "WHERE duration_track >= '03:50:00'")

connection.execute("""SELECT * FROM collection 
                   WHERE creation_year::date >= '2018-01-01' 
                   AND creation_year::date <= '2020-12-31' """)

connection.execute("""SELECT "name" FROM author WHERE array_length(regexp_split_to_array("name", '\s'),1) = 1""")

connection.execute("""SELECT "name" FROM track WHERE "name" LIKE '%%my%%'""")