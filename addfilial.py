import sqlite3

try:
    sqliteConnection = sqlite3.connect('db.sqlite3')
    cursor = sqliteConnection.cursor()
    print("Successfully Connected to SQLite")

    sqlite_insert_query = """
INSERT INTO DemandeMateriel_departement (name)
VALUES
    ('Siege'),
    ('BAM Casabalnca'),
    ('BAM Rabat'),
    ('BAM Eljadida'),
    ('BAM Meknes'),
    ('BG Agadir'),
    ('BG Rabat'),
    ('BG Essaouira'),
    ('BG Khouribga'),
    ('BG Marrakech'),
    ('BG Fes'),
    ('BG Meknes'),
    ('BG Oujda'),
    ('BG casa 1'),
    ('BG casa 2'),
    ('BG casa 3');
"""
    count = cursor.execute(sqlite_insert_query)
    sqliteConnection.commit()
    print("Record inserted successfully into SqliteDb_developers table ", cursor.rowcount)
    cursor.close()

except sqlite3.Error as error:
    print("Failed to insert data into sqlite table", error)
finally:
    if sqliteConnection:
        sqliteConnection.close()
        print("The SQLite connection is closed")
