//cria 2 valores para armazenar codigo e nome da desenvolvedora
var id_prod=[];
var nome_prod=[];
var preco_prod=[];
var foto_prod=[];
//evento que faz a pesquisa de desenvolvedoras ao
//carregar pagina
window.onload=()=>{
	pesquisarProduto();
    if(sessionStorage.getItem('cod_cliente')!=null){
        alert(sessionStorage.getItem('cod_cliente'));
    }
    if(sessionStorage.getItem('nome')!=null){
        alert(sessionStorage.getItem('nome'));
    }
}
 function pesquisarProduto(){
    //selecionar a caixa 
   // const searchId = document.querySelector('#searchId').value;
    //faz a requisição ao beckend
    fetch('http://localhost:8080/produtos')
    //trata a resposta caso o jogo não seja encontrado
    .then(response=> {
        if(response.status === 404){
            return Promise.reject('jogo não encontrado');
        }
        return response.json();
    })

    //exibe o resultado da pesquisa em tela
    .then(data=>{
        for(var i=0;i<data.length;i++){
            nome_prod.push(data[i].nome_Produto);
            id_prod.push(data[i].cod_Produto);
            foto_prod.push(data[i].capa);
            preco_prod.push(data[i].preco);
        }
        for(var j=0;j<id_prod.length;j++){
        //seleciona a div para exibir o resultado
        var cod = id_prod[j];
        var nome = nome_prod[j];
        var foto = foto_prod[j];
        var preco = preco_prod[j];
        const resultado = document.getElementById('catalogo');
        const produto = document.createElement('div');
        produto.setAttribute("class", "product");
        produto.innerHTML = '<img src="./IMG/'+foto+'" alt="G.T.Jump" width="50px" height="100px">'+
        '<p style="color:rgb(221, 217, 217);">'+'</p>'+
        '<h3>'+nome+'</h3>'+
        '<p>R$ '+preco+'</p>'+
        '<center><a class="btn-banner" href="./Produto.html?id='+cod+'" target="_blank">Comprar</a></center>';
        resultado.appendChild(produto);
        //cria vetor para carregar fotos
    }
    })

    //trata o erro vindo do backend
    .catch(error=>{
        alert('Erro: '+error);
    });
}
//FUNÇÃO PARA ATUALIZAR A PAGINA COM O RESULTADO
function buscarProduto(){
    const nome_Prod = document.querySelector('#nomeProd').value;
    fetch('http://localhost:8080/produtos/busca?nome_Produto='+nome_Prod)
    .then(response=>response.json())
    .then(data=>{
         //seleciona o select que vai exibir os dados
         const resultado = document.getElementById('catalogo');
         resultado.innerHTML='';
        id_prod=[]; 
        nome_prod=[];
        preco_prod=[];
         foto_prod=[];
         //carregar os dados nos vetores
         for(var i=0;i<=0;i++){
            nome_prod.push(data[i].nome_Produto);
            id_prod.push(data[i].cod_Produto);
            foto_prod.push(data[i].capa);
            preco_prod.push(data[i].preco);
         }
         //carrega o select com as desenvolvedoras
         for(var j=0;j<=0;j++){
             //cria variáveis para o nome e id do desenvolvedor
            
             //cria as opções no select
        var cod = id_prod[j];
        var nome = nome_prod[j];
        var foto = foto_prod[j];
        var preco = preco_prod[j];
       // const resultado = document.getElementById('catalogo');
        const produto = document.createElement('div');
        produto.setAttribute("class", "product");
        produto.innerHTML = '<img src="./IMG/'+foto+'" alt="G.T.Jump" width="50px" height="100px">'+
        '<p style="color:rgb(221, 217, 217);">'+'</p>'+
        '<h3>'+nome+'</h3>'+
        '<p>R$ '+preco+'</p>'+
        '<center><a class="btn-banner" href="./Produto.html?id='+cod+'" target="_blank">Comprar</a></center>';
        resultado.appendChild(produto);
         }
     })
     //trata o erro
     .catch(error=>{
         alert("Erro: "+error);
     });

    }
//função para recarregar pelo botao Limpar
function recarregaPagina(){
    alert('OK');
    const nome = document.querySelector('#nomeProd');
    nome.value='';
    const resultado = document.getElementById('catalogo');
    resultado.innerHTML='';
   id_prod=[]; 
   nome_prod=[];
   preco_prod=[];
    foto_prod=[];
    pesquisarProduto();
}
const nome = document.querySelector('#nomeProd');
    nome.addEventListener('change', function recarrega(){
        
    if(nome.value.length==0){
        const resultado = document.getElementById('catalogo');
        resultado.innerHTML='';
       id_prod=[]; 
       nome_prod=[];
       preco_prod=[];
        foto_prod=[];
        pesquisarProduto();
    }
    // Seleciona o input de pesquisa
const searchInput = document.querySelector('#nomeProd');

// Adiciona um event listener para capturar o evento 'keyup' (tecla pressionada)
searchInput.addEventListener('keyup', function(event) {
    // Verifica se a tecla pressionada é a tecla Enter (código 13)
    if (event.keyCode === 13) {
        if(searchInput.value.length!=0){
        // Chama a função para buscar produtos
        buscarProduto();
        }else{
            const resultado = document.getElementById('catalogo');
            resultado.innerHTML='';
           id_prod=[]; 
           nome_prod=[];
           preco_prod=[];
            foto_prod=[];
            pesquisarProduto();
        }
    }
});
});