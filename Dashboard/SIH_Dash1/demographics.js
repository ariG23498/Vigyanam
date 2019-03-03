sciinfo = document.getElementById('sciinfo')
spirit = document.getElementById('spirit')
ratn = document.getElementById('ratn')
cer = document.getElementById('cer')
let c = 0;

// let mapped = {
//     "mAll": 0,
//     "sciAll": 1,
//     "spAll": 2,
//     "rtAll": 3,
//     "cerAll": 4
// }

$(document).ready(function () {
    let chkArray = [];

    $.ajax({ url: 'http://127.0.0.1:12345/demographics',
            data: JSON.stringify({score: chkArray}),
            type: 'POST',
            dataType: "JSON",
            beforeSend: function(xhr){xhr.setRequestHeader('Content-Type', 'application/json');},
            success: function(output) {
            console.log(output['ans'])
            document.getElementById('myGraph').src =  output['ans']
        }
    });
	$("#updateButton").click(function() {
	    getValueUsingParentTag();
	});
});

const getValueUsingParentTag = () =>{
	let chkArray = [];
	let c =0;
	/* look for all checkboes that have a parent id called 'checkboxlist' attached to it and check if it was checked */
	$("input[name='selections']:checked").each(function() {
        chkArray.push($(this).val());
        c++;
	});
    if(c==4){
        // alert("fuck off")
        let myElement = "<img src = '/errorPage.png' width='600' height='500' /> "
        document.getElementById("plot").innerHTML = myElement;
        console.log(document.getElementById("plot"))

        // document.getElementById("myGraph").style.backgroundImage = url('./errorPage.png')
        return;
    }
	/* we join the array separated by the comma */
	var selected;
	selected = chkArray.join(',') ;
	// alert("works")
	/* check if there is selected checkboxes, by default the length is 1 as it contains one single comma */
	if(selected.length > 0){
        $.ajax({ url: 'http://127.0.0.1:12345/demographics',
                data: JSON.stringify({score: chkArray}),
                type: 'POST',
                dataType: "JSON",
                beforeSend: function(xhr){xhr.setRequestHeader('Content-Type', 'application/json');},
                success: function(output) {
                console.log(output['ans'])
                document.getElementById('myGraph').src =  output['ans']
            }
        });
	}else{
        $.ajax({ url: 'http://127.0.0.1:12345/demographics',
                data: JSON.stringify({score: chkArray}),
                type: 'POST',
                dataType: "JSON",
                beforeSend: function(xhr){xhr.setRequestHeader('Content-Type', 'application/json');},
                success: function(output) {
                console.log(output['ans'])
                document.getElementById('myGraph').src =  output['ans']
            }
        });	
}
}


let colors = ['#e21b28', '#e21b28' , '#6d6a03' , '#60f246' , '#037ba0']


    $('input[name="selections"]:checked').each(function() {
        console.log(this.value);
     });
    

// $(document).ready(function() {
//     var radioValue = $("input[name='selections']:checked").val();
//         if(radioValue){
//             // alert(colors[mapped[radioValue]])
//           $.ajax({ url: 'http://127.0.0.1:12345/demographics',
//                   data: JSON.stringify({score: radioValue , color: colors[mapped[radioValue]]}),
//                   type: 'POST',
//                   dataType: "JSON",
//                   beforeSend: function(xhr){xhr.setRequestHeader('Content-Type', 'application/json');},
//                   success: function(output) {
//                   console.log(output['ans'])
//                   document.getElementById('myGraph').src =  output['ans']
//               }
//           });
//         }  
//     $("input[type='radio']").click(function(){
//         var radioValue = $("input[name='selections']:checked").val();
//           if(radioValue){
//             //   alert('hey! working')
            //   $.ajax({ url: 'http://127.0.0.1:12345/demographics',
            //           data: JSON.stringify({score: radioValue , color: colors[mapped[radioValue]]}),
            //           type: 'POST',
            //           dataType: "JSON",
            //           beforeSend: function(xhr){xhr.setRequestHeader('Content-Type', 'application/json');},
            //           success: function(output) {
            //           console.log(output['ans'])
            //           document.getElementById('myGraph').src =  output['ans']
            //       }
            //   });
//           }  
//       });
// });
    

   



// sciinfo.addEventListener("click",() => {
//     if(sciinfo.style.color == "black" || sciinfo.style.color == ""){
//         if(c!=0){
//             spirit.style.color = "black";
//             ratn.style.color = "black";
//             cer.style.color = "black";
//             c = 0;
//         }
//         sciinfo.style.color = "#868690"; 
//         $.ajax({ url: 'http://127.0.0.1:12345/demographics',
//                 data: JSON.stringify({score: 'sciAll' , color: colors[radioValue]}),
//                 type: 'POST',
//                 dataType: "JSON",
//                 beforeSend: function(xhr){xhr.setRequestHeader('Content-Type', 'application/json');},
//                 success: function(output) {
//                 console.log(output['ans'])
//                 document.getElementById('myGraph').src =  output['ans']
//             }
//         });
//         c++;
//     }
//     else{
//         sciinfo.style.color = "black"; 
//     }  
// })

// spirit.addEventListener("click",() => {
//     console.log(spirit.style.color)
//     if(spirit.style.color == "" ||  spirit.style.color == "black" ){
//         if(c!=0){
//             ratn.style.color = "black";
//             cer.style.color = "black";
//             sciinfo.style.color = "black";
//             c= 0;
//         }
//         spirit.style.color = "#868690"; 
//         $.ajax({ url: 'http://127.0.0.1:12345/demographics',
//                 data: JSON.stringify({score: 'spAll' , color: colors[radioValue]}),
//                 type: 'POST',
//                 dataType: "JSON",
//                 beforeSend: function(xhr){xhr.setRequestHeader('Content-Type', 'application/json');},
//                 success: function(output) {
//                 console.log(output['ans'])
//                 document.getElementById('myGraph').src =  output['ans']
//             }
//         });
//         c++;
//     }
//     else{
//         spirit.style.color = "black"; 
//     }  
// })

// ratn.addEventListener("click",() => {
//     if(ratn.style.color == "black" || ratn.style.color == ""){
//         if(c!=0){
//             spirit.style.color = "black";
//             cer.style.color = "black";
//             sciinfo.style.color = "black";
//             c = 0;
//         }
//         ratn.style.color = "#868690"; 
//         $.ajax({ url: 'http://127.0.0.1:12345/demographics',
//                 data: JSON.stringify({score: 'rtAll' , color: colors[radioValue]}),
//                 type: 'POST',
//                 dataType: "JSON",
//                 beforeSend: function(xhr){xhr.setRequestHeader('Content-Type', 'application/json');},
//                 success: function(output) {
//                 console.log(output['ans'])
//                 document.getElementById('myGraph').src =  output['ans']
//             }
//         });
//         c++;
//     }
//     else{
//         ratn.style.color = "black"; 
//     }  
// })

// cer.addEventListener("click",() => {
//     if(cer.style.color == "black" || cer.style.color == ""){
//         if(c!=0){
//             spirit.style.color = "black";
//             ratn.style.color = "black";
//             sciinfo.style.color = "black";
//             c = 0;
//         }
//         cer.style.color = "#868690"; 
//         $.ajax({ url: 'http://127.0.0.1:12345/demographics',
//                 data: JSON.stringify({score: 'cerAll' , color: colors[radioValue]}),
//                 type: 'POST',
//                 dataType: "JSON",
//                 beforeSend: function(xhr){xhr.setRequestHeader('Content-Type', 'application/json');},
//                 success: function(output) {
//                 console.log(output['ans'])
//                 document.getElementById('myGraph').src =  output['ans']
//             }
//         });
//         c++;
//     }
//     else{
//         cer.style.color = "black"; 
//     }  
// })

