# Chat Firebase

- Autenticação do login pelo Google.
- Utilizado o Firebase para o backend.
- Armazenamento no banco de dados as mensagens que são trocadas dentro do app.
- Envio de mensagens apenas se estiver logado.
- Pode ser enviado tanto mensagens de texto quanto imagens.


## Dependências utilizadas:
  - `cloud_firestore` para acessar o firestore do firebase
  - `image_picker` para pegar a imagem da camera (pode mudar o código para pegar uma imagem da galeria)
  - `google_sign_in` para fazer o login com o google
  - `firebase_storage` para armazenar as imagens
  - `firebase_auth` para fazer a autenticação com o firebase
