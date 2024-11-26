//cria 2 valores para armazenar codigo e nome da desenvolvedora
const queryString = window.location.search;
const urlParams = new URLSearchParams(queryString);
const id= urlParams.get('id');
//alert(id);
//evento que faz a pesquisa de desenvolvedoras ao
//carregar pagina
window.onload=()=>{
	pesquisarProduto();
}
 function pesquisarProduto(){
    //selecionar a caixa 
   // const searchId = document.querySelector('#searchId').value;
    //faz a requisição ao beckend
    fetch('http://localhost:8080/produtos/'+id)
    //trata a resposta caso o jogo não seja encontrado
    .then(response=> {
        if(response.status === 404){
            return Promise.reject('jogo não encontrado');
        }
        return response.json();
    })

    //exibe o resultado da pesquisa em tela
    .then(data=>{
        
           var nome_prod = data.nome_Produto;
           var id_prod = data.cod_Produto;
           var foto_prod = data.capa;
           var preco_prod = data.preco;
           var Descricao = data.descricao;
        
        
        //seleciona a div para exibir o resultado
       
        const foto_p = document.getElementById('foto_p');
        const nome_p = document.getElementById('nome_p');
        const nome_p_foto = document.getElementById('nome_p_foto');
        const preco_p = document.getElementById('preco_p');
        const descricao_p = document.getElementById('descricao_p');
        foto_p.setAttribute('src', './IMG/'+foto_prod);
        nome_p.innerHTML=nome_prod;
        nome_p_foto.innerHTML=nome_prod;
        preco_p.innerHTML = 'R$ '+preco_prod;
        descricao_p.innerHTML = Descricao;
       
        //cria vetor para carregar fotos
    
    })

    //trata o erro vindo do backend
    .catch(error=>{
        alert('Erro: '+error);
    });
}