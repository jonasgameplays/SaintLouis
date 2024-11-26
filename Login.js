function fazerLogin(){
    const email = document.querySelector('#txtEmail').value;
    const senha = document.querySelector('#txtSenha').value;
    fetch('http://localhost:8080/clientes/busca?Email='+email+
        '&Senha='+senha)
    .then(response=>response.json())
    .then(data=>{
        if(data.length<=0){
            alert('Senha ou usuário inválido');
        }
        if(data[0].email!="" || data[0].email!=null){
            document.location.assign("inicial.html?cliente="+data[0].cod_cliente);
            sessionStorage.setItem('cod_cliente',data[0].cod_cliente);
            sessionStorage.setItem('nome',data[0].nome);
    
        }
    }
    
)}