sciinfo = document.getElementById('sciinfo')
spirit = document.getElementById('spirit')
ratn = document.getElementById('ratn')
cer = document.getElementById('cer')
let c = 0;




sciinfo.addEventListener("click",() => {
    if(sciinfo.style.color == "black" || sciinfo.style.color == ""){
        if(c!=0){
            spirit.style.color = "black";
            ratn.style.color = "black";
            cer.style.color = "black";
            c = 0;
        }
        sciinfo.style.color = "#868690"; 
        $.ajax({ url: 'http://127.0.0.1:12345/demographics',
                data: JSON.stringify({score: 'sciAll'}),
                type: 'POST',
                dataType: "JSON",
                beforeSend: function(xhr){xhr.setRequestHeader('Content-Type', 'application/json');},
                success: function(output) {
                console.log(output['ans'])
                document.getElementById('myGraph').src =  output['ans']
            }
        });
        c++;
    }
    else{
        sciinfo.style.color = "black"; 
    }  
})

spirit.addEventListener("click",() => {
    console.log(spirit.style.color)
    if(spirit.style.color == "" ||  spirit.style.color == "black" ){
        if(c!=0){
            ratn.style.color = "black";
            cer.style.color = "black";
            sciinfo.style.color = "black";
            c= 0;
        }
        spirit.style.color = "#868690"; 
        $.ajax({ url: 'http://127.0.0.1:12345/demographics',
                data: JSON.stringify({score: 'spAll'}),
                type: 'POST',
                dataType: "JSON",
                beforeSend: function(xhr){xhr.setRequestHeader('Content-Type', 'application/json');},
                success: function(output) {
                console.log(output['ans'])
                document.getElementById('myGraph').src =  output['ans']
            }
        });
        c++;
    }
    else{
        spirit.style.color = "black"; 
    }  
})

ratn.addEventListener("click",() => {
    if(ratn.style.color == "black" || ratn.style.color == ""){
        if(c!=0){
            spirit.style.color = "black";
            cer.style.color = "black";
            sciinfo.style.color = "black";
            c = 0;
        }
        ratn.style.color = "#868690"; 
        $.ajax({ url: 'http://127.0.0.1:12345/demographics',
                data: JSON.stringify({score: 'rtAll'}),
                type: 'POST',
                dataType: "JSON",
                beforeSend: function(xhr){xhr.setRequestHeader('Content-Type', 'application/json');},
                success: function(output) {
                console.log(output['ans'])
                document.getElementById('myGraph').src =  output['ans']
            }
        });
        c++;
    }
    else{
        ratn.style.color = "black"; 
    }  
})

cer.addEventListener("click",() => {
    if(cer.style.color == "black" || cer.style.color == ""){
        if(c!=0){
            spirit.style.color = "black";
            ratn.style.color = "black";
            sciinfo.style.color = "black";
            c = 0;
        }
        cer.style.color = "#868690"; 
        $.ajax({ url: 'http://127.0.0.1:12345/demographics',
                data: JSON.stringify({score: 'cerAll'}),
                type: 'POST',
                dataType: "JSON",
                beforeSend: function(xhr){xhr.setRequestHeader('Content-Type', 'application/json');},
                success: function(output) {
                console.log(output['ans'])
                document.getElementById('myGraph').src =  output['ans']
            }
        });
        c++;
    }
    else{
        cer.style.color = "black"; 
    }  
})