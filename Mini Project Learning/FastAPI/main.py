from fastapi import FastAPI
from pydantic import BaseModel
from mysql.connector import pooling
from dotenv import load_dotenv
import os

load_dotenv()

# Singleton Connection Pool
class DBPool:
    _pool = None

    @classmethod
    def initialize(cls):
        if cls._pool is None:
            cls._pool = pooling.MySQLConnectionPool(
                pool_name="mypool",
                pool_size=5,
                pool_reset_session=True,
                host=os.getenv("MYSQL_HOST"),
                user=os.getenv("MYSQL_USERNAME"),
                password=os.getenv("MYSQL_PASSWORD"),
                database=os.getenv("MYSQL_DATABASE")
            )

    @classmethod
    def get_connection(cls):
        if cls._pool is None:
            raise Exception("Connection pool is not initialized.")
        return cls._pool.get_connection()

# Initialize the pool once when app starts
DBPool.initialize()

app = FastAPI()

class Attraction(BaseModel):
    name: str
    detail: str
    coverimage: str
    latitude: float
    longitude: float

class UpdateAttraction(BaseModel):
    id: int
    name: str
    detail: str
    coverimage: str
    latitude: float
    longitude: float


@app.post('/attractions')
def create_attraction(attraction: Attraction):
    cnx = DBPool.get_connection()
    cursor = cnx.cursor()
    query = '''
    INSERT INTO attractions (name, detail, coverimage, latitude, longitude)
    VALUES (%s, %s, %s, %s, %s)
    '''
    cursor.execute(query, (attraction.name, attraction.detail, attraction.coverimage,
                           attraction.latitude, attraction.longitude))
    cnx.commit()
    attraction_id = cursor.lastrowid
    cursor.close()
    cnx.close()
    return {"id": attraction_id}

@app.put('/attractions')
def update_attraction(attraction: UpdateAttraction):
    cnx = DBPool.get_connection()
    cursor = cnx.cursor()
    query = '''
    UPDATE attractions SET name=%s,detail=%s,coverimage=%s,latitude=%s,longitude=%s WHERE id =%s
    '''
    cursor.execute(query, (attraction.name, attraction.detail, attraction.coverimage,
                           attraction.latitude, attraction.longitude, attraction.id))
    cnx.commit()
    cursor.close()
    cnx.close()
    return {f"Update Data ID : {attraction.id} Complete."}


@app.delete('attractions/delete/{id}')
def delete_id(id: int):
    cnx = DBPool.get_connection()
    cursor = cnx.cursor()
    query = "DELETE FROM attractions WHERE id = %s"
    cursor.execute(query, (id,))
    cnx.commit()
    cursor.close()
    cnx.close()
    return {"message": f"ID {id} deleted successfully."}

@app.get('/attractions')
def get_attractions():
    cnx = DBPool.get_connection()
    cursor = cnx.cursor()
    query = "SELECT * FROM attractions"
    cursor.execute(query)
    rows = cursor.fetchall()
    cursor.close()
    cnx.close()

    attractions = []
    for row in rows:
        attractions.append({
            "id": row[0],
            "name": row[1],
            "detail": row[2],
            "coverimage": row[3],
            "latitude": row[4],
            "longitude": row[5]
        })
    return attractions
