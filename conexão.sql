# Conexão com o SQL Server 

server = 'CAIQUELEITE' 

database = 'ProjetoIntegrador' 

username = 'sa' 

password = '123456' 

  

conn = pyodbc.connect( 

    f'DRIVER={{ODBC Driver 17 for SQL Server}};SERVER={server};DATABASE={database};UID={username};PWD={password}' 

) 

cursor = conn.cursor() 