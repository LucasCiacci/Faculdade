

## Instruções de Build e Execução

### .NET MAUI
1. Abra o Visual Studio 2022 Community.  
2. Abra a pasta `/maui` como solução.  
3. Selecione o emulador desejado (Pixel 6 / API 34 recomendado).  
4. Execute em **Release mode** para testes de desempenho.  

### Android Nativo
1. Abra o Android Studio.  
2. Importe o projeto da pasta `/android-nativo`.  
3. Configure o emulador equivalente (Pixel 6 / API 34).  
4. Execute o app em **Release mode**.  

> **Dica:** Desative animações do SO e Hot Reload para medições precisas.

---

## Métricas Coletadas

- Tempo de cold start  
- Tamanho do pacote (APK)  
- Memória em repouso (30s após abrir a lista)  
- Tempo de desenvolvimento (auto-registro por plataforma)  

---

## Equipe

- Fernanda Laudares Silva 
- Julia Ragi Beltrão
- Lucas Silva Ciacci
- Sara Veríssimo Souza

---

## Referências

1. [.NET MAUI Documentation](https://learn.microsoft.com/dotnet/maui/)  
2. [Android Studio Documentation](https://developer.android.com/studio)  
3. [IBGE API](https://servicodados.ibge.gov.br/api/docs/)  
4. Fonte independente: [Exemplo de artigo sobre comparativo MAUI x Android](#)  

---

## Observações

- Mantenha mesmo layout, cores e assets nas duas plataformas para reduzir vieses.  
- Use sempre emuladores equivalentes para medições consistentes.  
