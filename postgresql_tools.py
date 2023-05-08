import pandas as pd
import psycopg2
from configparser import ConfigParser


def create_db_conn(config_file: str):
    # Read database configuration from config file
    config = ConfigParser()
    config.read(config_file)

    # Connect to PostgreSQL database
    conn = psycopg2.connect(
        host=config['postgresql']['host'],
        port=config['postgresql']['port'],
        database=config['postgresql']['database'],
        user=config['postgresql']['user'],
        password=config['postgresql']['password']
    )

    return conn


def create_table(query_file: str, conn):
    # Read SQL query to create table from file
    with open(query_file, 'r') as f:
        query = f.read()

    # Execute SQL query to create tables
    with conn.cursor() as cursor:
        cursor.execute(query)
    conn.commit()


def insert_data_to_db(conn, df, table_name: str, col_names: list[str]):
    with conn.cursor() as cursor:
        for index, row in df.iterrows():
            query = f"INSERT INTO {table_name} VALUES ({', '.join(['%s']*len(col_names))})"
            values = tuple(row[column] for column in col_names)
            cursor.execute(query, values)

    conn.commit()


def load_query_df(query_file: str, conn, col_names: list[str]):
    """
      Load data from a PostgreSQL query file into a pandas DataFrame.

      Parameters:
      - query_file: the name of the file containing the SQL query
      - conn: a psycopg2 database connection object
      - col_names: a list of column names to use for the DataFrame

      Returns:
      - a pandas DataFrame containing the query results
      """

    # Open the file and read the query from it
    with open(query_file, 'r') as f:
        query = f.read()

    # Execute the SQL query and fetch the results as a list of tuples
    cur = conn.cursor()
    cur.execute(query)
    rows = cur.fetchall()

    # Convert the list of tuples to a pandas DataFrame
    df = pd.DataFrame(rows, columns=col_names)

    # Return the DataFrame
    return df
