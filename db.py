import sqlalchemy

db = 'postgresql://root:1111@localhost:5432/test'
engine = sqlalchemy.create_engine(db)
connection = engine.connect()


connection.execute("INSERT INTO author (name) VALUES ('Lady GAGA'), ('Timati'),('Yolka'),"
                   "('Maroon5'),('MARUV'),('XO'), ('Klava KOKA'),('Eminem');")

connection.execute("INSERT INTO author_genre (author_id, genre_id) VALUES (1, 1), (2, 2), (3, 3), (4, 4),"
                   " (5, 5), (6, 1), (7, 3), (8, 2);")



connection.execute("INSERT INTO genre (name) VALUES ('pop'), ('rock'), ('classic'), ('rep'), ('rnb');")


connection.execute("INSERT INTO album (name, year) VALUES ('album1',2018), ('album2', 2019), ('album3', 2018),"
                   " ('album4', 2020), ('album5', 2018), ('album6', 2021), ('album7', 2017), ('album8', 2016);")

connection.execute("INSERT INTO author_album (author_id, album_id) VALUES (1, 1), (2, 2), (3, 3), (4, 4),"
                   " (5, 5), (6, 6), (7, 7), (8, 8);")


connection.execute("INSERT INTO track (name, duration_track, number_track, album_id) VALUES ('lalala', '01:47', 15, 1),"
                   "('alloha', '02:25', 14, 2), ('hello, dear', '01:50', 13, 3), ('i will remember', '02:25', 12, 4),"
                   "('on style', '03:35', 11, 5), ('hot summer', '04:05', 10, 6), ('my family', '01:15', 9, 7),"
                   " ('friends', '02:20', 8, 8), ('my stories', '01:58', 7, 6), ('my dreams', '03:40', 6, 5),"
                   "('Monday', '04:25', 5, 4), ('freedom', '04:45', 4, 3), ('winter', '03:15', 3, 2),"
                   "('lies', '02:45', 2, 1), ('end', '02:45', 1, 1)")


connection.execute("INSERT INTO collection (name, creation_year) VALUES ('collection1', '2018-01-01 20:20:20')",
                    "('collection2', '2018-06-01 20:20:20'), ('collection3', '2019-12-01 20:20:20'),"
                    "('collection4', '2020-10-21 20:20:20'), ('collection5', '2010-10-21 17:20:20'),"
                    "('collection6', '2015-10-11 15:30:20'), ('collection7', '2016-10-11 11:10:20'),"
                    "('collection8', '1999-10-11 05:10:30');")

connection.execute("INSERT INTO track_collection (track_id, collection_id) VALUES (1, 1), (2, 2), (3, 3), (4, 4), (5, 5),"
                   "(6, 6), (7, 7), (8, 8), (9, 1), (10, 2), (11, 3), (12, 4), (13, 5), (14, 6), (15, 7);")
