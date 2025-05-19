# ---- Acessar a API do IBGE ---- 

url = "https://servicodados.ibge.gov.br/api/v3/agregados/8418/periodos/2019/variaveis/12747%7C12748%7C12749%7C12750%7C12751%7C12752%7C12753%7C12754?localidades=N2[all]" 

response = requests.get(url) 

  

if response.status_code == 200: 

    data = response.json() 

    registros = [] 

  

    for item in data: 

        variavel = item['variavel'] 

        unidade = item['unidade'] 

        resultados = item['resultados'][0]['series'] 

  

        for serie in resultados: 

            regiao = serie['localidade']['nome'] 

            ano_valores = serie['serie'] 

  

            for ano, valor in ano_valores.items(): 

                try: 

                    registros.append((variavel, unidade, regiao, float(valor), int(ano))) 

                except ValueError: 

                    pass  # Ignora valores inválidos 

  

    # Inserção no banco de dados 

    insert_query = """ 

        INSERT INTO DadosIBGE (variavel, unidade, regiao, valor, ano) 

        VALUES (?, ?, ?, ?, ?) 

    """ 

    cursor.executemany(insert_query, registros) 

    conn.commit() 

    print(f"✅ {len(registros)} registros inseridos com sucesso na tabela 'DadosIBGE'.") 

else: 

    print("❌ Erro ao acessar a API. Código de status:", response.status_code) 

  

# Fechar conexão 

cursor.close() 

conn.close() 