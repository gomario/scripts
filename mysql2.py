
import pymysql
  
def mysqlconnect():
    # To connect MySQL database
    conn = pymysql.connect(
        host='198.58.125.167',
        user='mariotest', 
        password = "hoodP@r707",
        db='users',
        )
      
    cur = conn.cursor()
    cur.execute("select @@version")
    output = cur.fetchall()
    print(output)
      
    # To close the connection
    conn.close()
  
# Driver Code
if __name__ == "__main__" :
    mysqlconnect()

