import mysql.connector
from mysql.connector import Error

def create_connection():
    connection = None
    try:
        connection = mysql.connector.connect(
            host="mysql1",
            user="testuser",
            passwd="test",
            database="testdb"
        )
        print("Connection to MySQL DB successful")
    except Error as e:
        print(f"The error '{e}' occurred")
    return connection

def create_table(connection):
    create_table_query = """
    CREATE TABLE IF NOT EXISTS menteestasks (
        id INT AUTO_INCREMENT, 
        name TEXT NOT NULL, 
        web TEXT DEFAULT 'n',
        app TEXT DEFAULT 'n',
        sysad TEXT DEFAULT 'n', 
        PRIMARY KEY (id)
    )
    """
    cursor = connection.cursor()
    try:
        cursor.execute(create_table_query)
        connection.commit()
        print("Table created successfully")
    except Error as e:
        print(f"The error '{e}' occurred")

def insert_data(connection, name, age):
    insert_query = f"INSERT INTO `menteestask` (`id`, `name`, `web`, `app`, `sysad`) VALUES (NULL, '{name}', '{web}', '{app}', '{sysad}'); "
    cursor = connection.cursor()
    try:
        cursor.execute(insert_query)
        connection.commit()
        print("Data inserted successfully")
    except Error as e:
        print(f"The error '{e}' occurred")


conn = create_connection()
if conn is not None:
     create_table(conn)
     insert_data(conn, "aswin", 'n', 'n', 'y')
