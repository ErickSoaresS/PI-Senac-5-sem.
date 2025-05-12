# Verificar existência da tabela 

cursor.execute(""" 

    SELECT OBJECT_ID('dbo.DadosIBGE', 'U') 

""") 

tabela_existe = cursor.fetchone()[0] 

  

if tabela_existe: 

    print("✅ A tabela 'DadosIBGE' já existe no banco de dados.") 

else: 

    print("🆕 A tabela 'DadosIBGE' não existe. Criando agora...") 

    cursor.execute(""" 

        CREATE TABLE DadosIBGE ( 

            id INT IDENTITY(1,1) PRIMARY KEY, 

            variavel VARCHAR(255), 

            unidade VARCHAR(100), 

            regiao VARCHAR(100), 

            valor FLOAT, 

            ano INT 

        ) 

    """) 

    conn.commit() 

    print("✅ Tabela 'DadosIBGE' criada com sucesso.") 

  

# Truncar os dados 

print("🧹 Limpando dados da tabela 'DadosIBGE'...") 

cursor.execute("TRUNCATE TABLE DadosIBGE") 

conn.commit() 

print("✅ Dados antigos removidos.") 