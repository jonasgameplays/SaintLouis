document.getElementById('cadastroClien').addEventListener('submit', cadastrarCliente);

function cadastrarCliente(event) {
    event.preventDefault();

    // seleciona as caixas de texto no form
    const nome = document.getElementById('nome').value;
    const cpf = document.getElementById('cpf').value;
    const email = document.getElementById('email').value;
    const dt_Nascimento = document.getElementById('Dt_nascimento').value;
   // alert(dt_Nascimento);
    const contato = document.getElementById('contato').value;
    // faz a requisição ao backend
    fetch('http://localhost:8080/clientes', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({nome, dt_Nascimento, contato, cpf, email}),
    })

    // trata a resposta do backend em caso de sucesso
    .then(response => {
        if (!response.ok) {
            return Promise.reject('Erro ao cadastrar o cliente');
        }
        return response.json();
    })
    .then(data => {
        alert('Cliente cadastrado com sucesso');
        document.getElementById('cadastroClien').reset();
    })

    // trata a resposta do backend em caso de erro
    .catch(error => {
        alert('Erro: ' + error);
    })
}